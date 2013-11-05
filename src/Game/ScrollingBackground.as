package Game 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class ScrollingBackground extends MovieClip
	{
		private var g:MovieClip;
		
		public function ScrollingBackground(num:int) 
		{
			g = new BackgroundArt();
			addChild(g);
			g.x = num * 800;
			g.y = -17;
		}
		
		public function scrollBackground():void {
			if (g.x < -800) {
				g.x = 800;
			}
			g.x -= 2;
		}
	}
}