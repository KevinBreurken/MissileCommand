package Game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Library.GameObject;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Cannon extends MovieClip
	{
		public var cannonRifle:CannonRifle;
		public var cannonbase:GameObject;
		public function Cannon(type:int) 
		{
			addEventListener(Event.ADDED_TO_STAGE, stageHandler);
			cannonRifle = new CannonRifle();
			cannonbase = new GameObject(11);
			addChild(cannonbase);
			addChild(cannonRifle);
			cannonbase.setScale(0.7, 0.7);
			switch(type) {
				case 1:
					cannonbase.setPosition(0, -100);
					cannonRifle.x = 50;
					cannonRifle.y = 50;
				break;
				case 2:
					cannonbase.setPosition(480, -100);
					cannonRifle.x = 50;
					cannonRifle.y = 550;
				break;
			}
			trace(cannonRifle.x);
			cannonbase.rotation = 90;
		}
		public function stageHandler(e:Event):void {
			addEventListener(Event.ENTER_FRAME, rotateToMouse);
		}
		public function rotateToMouse(e:Event):void {
			var angle:Number = getDegreeFromPoint(cannonRifle.x, cannonRifle.y, stage.mouseX, stage.mouseY) + 90;
			if (angle < 0) {
				angle = 0;
			}
			if (angle > 180) {
				angle = 180;
			}
			cannonRifle.rotationZ = angle;
			///Math.atan(opp/adj)/(Math.PI/180)
		}
		private function getDegreeFromPoint(x1:Number, y1:Number, x2:Number, y2:Number):Number {
			return Math.atan2((y2 - y1), (x2 - x1)) / (Math.PI/180);
		}
	}

} 