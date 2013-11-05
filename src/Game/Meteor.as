package Game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import Library.GameObject;
	import Library.Calculate;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Meteor extends MovieClip
	{
		public var dead:Boolean;
		public var meteor:GameObject;
		private var speed:int;
		public function Meteor(spawnlocation:int) 
		{
			speed = Calculate.randomRange(6, 12);
			meteor = new GameObject(18);
			addChild(meteor);
			meteor.y = 175 + ( spawnlocation * 80) + Calculate.randomRange(-12,12);
			meteor.x = 1000 + Calculate.randomRange(0,500);
		}
		public function meteorUpdate():void {
			meteor.movePosition( -speed, 0);
		}
	}

}