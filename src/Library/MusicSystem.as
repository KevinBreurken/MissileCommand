package Library 
{
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class MusicSystem extends MovieClip
	{
		[Embed(source = '/../res/MenuMusic.mp3')]		 
		private var menuSound : Class; 		 
		private var menumusic : Sound; 
		[Embed(source = '/../res/GameMusic.mp3')]		 
		private var gameSound : Class;
		private var gamemusic : Sound;
		
		private var soundChannel : SoundChannel;
		
		public function MusicSystem() 
		{
			menumusic = (new menuSound) as Sound;
			gamemusic = (new gameSound) as Sound;
			soundChannel = new SoundChannel();
		}
		public function SetMusic(songname:String):void{
			switch(songname) {
				case "Game":
					soundChannel = gamemusic.play(0, int.MAX_VALUE);
				break;
				case "Menu":
					soundChannel = menumusic.play(0, int.MAX_VALUE);
				break;
			}
		}
	}
}