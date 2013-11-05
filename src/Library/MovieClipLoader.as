package Library 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class MovieClipLoader extends MovieClip
	{
		public static function SetMovieClip(id:int):MovieClip {
				var mc:MovieClip;
				switch(id) {
					case 0:
						mc = null;
					break;
					case 1:
						mc = new BackgroundMenu();
					break;
					case 2:
						mc = new PlayButton();
					break;
					case 3:
						mc = new QuitButton();
					break;
					case 4:
						mc = new FullscreenButton();
					break;
					case 5:
						mc = new HighscoreButton();
					break;
					case 6:
						mc = new HighScoreScreen();
					break;
					case 7:
						mc = new CloseButton();
					break;
					case 8:
						mc = new GraphicsUI();
					break;
					case 9:
						mc = new Bullet();
					break;
					case 10:
						mc = new CannonRifle();
					break;
					case 11:
						mc = new Cannon_Base();
					break;
					case 12:
						mc = new Floor();
					break;
					case 13:
						mc = new FloorBorder();
					break;
					case 14:
						mc = new Background();
					break;
					case 15:
						mc = new Shield();
					break;
					case 16:
						mc = new MiniObject1();
					break;
					case 17:
						mc = new MiniObject2();
					break;
					case 18:
						mc = new MeteorObject();
					break;
				}	
				return mc;
			}
	}
}