package Game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Library.GameObject;
	import Game.Cannon;
	import Library.Calculate;
	import Library.GUI;
	import Library.SoundSystem;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Game extends MovieClip
	{
		private var scrollbackground:Array;
		private var meteorArray:Array;
		private var shieldArray:Array;
		private var missileArray:Array;
		
		private var currentwave:int;
		private var health:int;
		
		private var flowFactory:CannonFlowFactory;
		private var flowObject:FlowObject;
		private var miniobjectlayer:MovieClip;
		private var missilelayer:MovieClip;
		
		private var floor:GameObject;
		private var floorBorder:GameObject;
		private var upperCannon:Cannon;
		private var lowerCannon:Cannon;
		private var background:GameObject;
		private var gui:GUI;
		
		private var shoottimer:int;
		private var shootdelay:Boolean;
		private var shooting:Boolean;
		
		public var closegame:Boolean;
		private var soundsystem:SoundSystem = new SoundSystem();
		public function Game() 
		{
			missileArray = new Array();
			background = new GameObject(14);
			addChild(background);
			scrollbackground = new Array();
			scrollbackground.push(new ScrollingBackground(0));
			addChild(scrollbackground[0]);
			scrollbackground.push(new ScrollingBackground(1));
			addChild(scrollbackground[1]);
			shieldArray = new Array();
			flowFactory = new CannonFlowFactory();
			floor = new GameObject(12);
			floorBorder = new GameObject(13);
			upperCannon = new Cannon(1);
			lowerCannon = new Cannon(2);
			missilelayer = new MovieClip();
			miniobjectlayer = new MovieClip();
			gui = new GUI();
			startGame();
		}
		
		
		public function gameUpdate(e:Event):void {
			if (gui.healthamount <= 0) {
				removeEventListener(Event.ENTER_FRAME, gameUpdate);
				unloadGame();
			}
			
			for (var pbullet:int = 0; pbullet < missileArray.length; pbullet++) {
				if (missileArray[pbullet].g.y <= -1000) {
					missileArray[pbullet].isdead = true;
				}
				
				if (missileArray[pbullet].isdead) {
					missilelayer.removeChild(missileArray[pbullet]);
					missileArray.splice(pbullet, 1);
					trace("Deleted");
				}
				
				if (missileArray[pbullet] != null){
				missileArray[pbullet].moveBullet();
				}
			}
			
			if (shooting && !shootdelay) {
				shootCannon();
				shoottimer = 0;
				soundsystem.playShot();
			}
			
			if (shootdelay) {
				shoottimer++;
				if (shoottimer >= 4) {
					shootdelay = false;
				}
			}
			
			for (var bg:int = 0; bg < 2; bg++) {
				scrollbackground[bg].scrollBackground();
			}
			
			if (meteorArray.length == 0 && gui.healthamount > 0) {
				gotoNextWave();
			}
			
			for (var meteors:int = 0; meteors < meteorArray.length; meteors++) {
				if(meteorArray.length != 0){
					if (meteorArray[meteors].dead) {
						removeChild(meteorArray[meteors]);
						meteorArray.splice(meteors, 1);
						break;
					}
					
					if (meteorArray[meteors].meteor.g.hitTestObject(floor)) {
						meteorArray[meteors].dead = true;
						health--;
						gui.addHealth(1);
					}
					
					for (var plbullet:int = 0; plbullet < missileArray.length; plbullet++) {
						if (meteorArray[meteors].meteor.g.hitTestObject(missileArray[plbullet].g)) {
							meteorArray[meteors].dead = true;
							missileArray[plbullet].isdead = true;
							gui.addScore(100);
						}
					}
					
					for (var shield:int = 0; shield < shieldArray.length; shield++) {
						if (shieldArray[shield].colcheck) {
							removeChild(shieldArray[shield]);
							shieldArray.splice(shield, 1);
							break;
						}
						
						if (meteorArray[meteors].meteor.g.hitTestObject(shieldArray[shield].g)) {
							meteorArray[meteors].dead = true;
							shieldArray[shield].colcheck = true;
						}
					}
					meteorArray[meteors].meteorUpdate();
				}
			}
			if (flowObject.isDestroyed) {
				flowObject = null;
				flowObject = flowFactory.makeFlowObject(Calculate.randomRange(1,2));
				miniobjectlayer.addChild(flowObject);
			}
		}
		
		
		public function shootCannon():void {
			shootdelay = true;
			var RandomNum:int = Calculate.randomRange(1, 2);
			var spawnx:int;
			var spawny:int;
			var bulletRotation:Number;
			if (RandomNum == 1) {
				spawnx = upperCannon.cannonRifle.x;
				spawny = upperCannon.cannonRifle.y;
				bulletRotation = upperCannon.cannonRifle.rotation;
			}
			else {
				spawnx = lowerCannon.cannonRifle.x;
				spawny = lowerCannon.cannonRifle.y;
				bulletRotation  = lowerCannon.cannonRifle.rotation;
			}
			var n:PlayerBullet = new PlayerBullet(spawnx,spawny,bulletRotation);
            missileArray.push(n);
            missilelayer.addChild(n);
		}
		
		
		public function gotoNextWave():void {
			currentwave++;
			gui.addWave(1);
			for (var i:int = 0; i < WaveSettings.waveAmount[currentwave]; i++ ) {
				meteorArray.push(new Meteor(Calculate.randomRange(0, 3)));
				addChild(meteorArray[i]);
			}
		}
		
		
		public function startGame():void {
			meteorArray = new Array;
			currentwave = 0;
			gui.resetData();
			addChild(floor);
			floorBorder.x = 10;
			addChild(miniobjectlayer);
			flowObject = flowFactory.makeFlowObject(1);
			miniobjectlayer.addChild(flowObject);
			addChild(floorBorder);
			addChild(missilelayer);
			addChild(upperCannon);
			addChild(lowerCannon);
			for (var i:int = 0; i < 4; i++) {
				shieldArray[i] = new GameObject(15);
				addChild(shieldArray[i]);
				shieldArray[i].x = 40;
				shieldArray[i].y = 150 + ( i * 80);
			}
			addEventListener(Event.ENTER_FRAME, gameUpdate);
			addChild(gui);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		
		public function mouseUp(e:MouseEvent):void {
			shooting = false;
		}
		
		
		public function mouseDown(e:MouseEvent):void {
			shooting = true;
		}
		
		
		public function unloadGame():void {
			while (meteorArray.length != 0) {
				for each(var meteor:Meteor in meteorArray) {
					removeChild(meteor);
					meteorArray.splice(meteorArray.indexOf(meteor),1);
				}
			}
			for each(var shld:GameObject in shieldArray) {
				removeChild(shld);
				shieldArray.splice(shieldArray.indexOf(shld),1);
			}
			removeChild(floorBorder);
			removeChild(miniobjectlayer);
			removeChild(missilelayer);
			removeChild(floor);
			removeChild(background);
			upperCannon.removeEventListener(Event.ENTER_FRAME, upperCannon.rotateToMouse);
			lowerCannon.removeEventListener(Event.ENTER_FRAME, lowerCannon.rotateToMouse);
			removeChild(lowerCannon);
			removeChild(upperCannon);
			Main.storedHighscore.data.score[0] = gui.scoreamount;
			removeChild(gui);
			for (var b:int = 0; b < 2; b++) {
				removeChild(scrollbackground[b]);
			}
		}
	}

}