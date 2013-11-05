package Library
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class GameObject extends MovieClip
	{
		public var g:MovieClip;
		public var colcheck:Boolean;
		
		public function GameObject(id:int) 
		{
			g = new MovieClip();
			g = MovieClipLoader.SetMovieClip(id);
			addChild(g);
		}
		
		public function setPosition(x:int, y:int):void {
			g.x = x;
			g.y = y;
		}
		
		public function movePosition(x:int, y:int):void {
			g.x += x;
			g.y += y;
		}
		
		public function setScale(x:Number, y:Number):void {
			g.scaleX = x;
			g.scaleY = y;
		}
	}
}