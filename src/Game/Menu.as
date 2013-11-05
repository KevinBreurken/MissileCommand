package Game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Library.GameObject;
	import flash.system.fscommand;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import Library.MusicSystem;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Menu extends MovieClip
	{
		private var game:Game;
		private var highscore:HighScore;
		private var musicSystem:MusicSystem;
		private var background:GameObject;
		private var playButton:GameObject;
		private var quitButton:GameObject;
		private var fullscreenButton:GameObject;
		private var highscoreButton:GameObject;
		public function Menu() 
		{
			createMenu();
		}
		public function createMenu():void {
			musicSystem = new MusicSystem();
			background = new GameObject(1);
			playButton = new GameObject(2);
			quitButton = new GameObject(3);
			fullscreenButton = new GameObject(4);
			highscoreButton = new GameObject(5);
			
			addChild(musicSystem);
			addChild(background);
			addChild(playButton);
			addChild(quitButton);
			addChild(fullscreenButton);
			addChild(highscoreButton);
			
			playButton.setPosition(100, 500);
			quitButton.setPosition(470, 500);
			fullscreenButton.setPosition(350, 500);
			highscoreButton.setPosition(0, 0);
			
			musicSystem.SetMusic("Menu");
			playButton.addEventListener(MouseEvent.CLICK, clickedPlayButton);
			quitButton.addEventListener(MouseEvent.CLICK, clickedQuitButton);
			fullscreenButton.addEventListener(MouseEvent.CLICK, clickedFullscreenButton);
			highscoreButton.addEventListener(MouseEvent.CLICK, clickedHighscoreButton);
		}
		public function checkGame(e:Event):void {
			if (game.closegame) {
				removeChild(game);
				game = null;
				musicSystem.SetMusic("Menu");
			}
		}
		public function clickedPlayButton(e:MouseEvent):void {
			game = new Game();
			addChild(game);
			musicSystem.SetMusic("Game");
			addEventListener(Event.ENTER_FRAME, checkGame);
		}
		public function clickedQuitButton(e:MouseEvent):void {
			fscommand("quit");
		}
		public function clickedHighscoreButton(e:MouseEvent):void {
			highscore = new HighScore();
			addChild(highscore);
		}
		public function clickedFullscreenButton(e:MouseEvent):void {
			trace("Clicked Fullscreen");
			if (stage.displayState == StageDisplayState.NORMAL) {
				stage.displayState = StageDisplayState.FULL_SCREEN;
			}
			else {
				stage.displayState=StageDisplayState.NORMAL;
			}
		}
	}

}