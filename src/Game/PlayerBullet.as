package Game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class PlayerBullet extends MovieClip
	{
		public var g:BulletArt;
		public var isdead:Boolean;
		
		public function PlayerBullet(x:int,y:int,rot:Number) 
		{
			g = new BulletArt();
			addChild(g);
			this.x = x;
			this.y = y;
			this.rotation = rot;
		}
		
		public function moveBullet():void {
			g.y -= 20;
		}
	}
}