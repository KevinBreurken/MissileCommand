package Library 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class SoundSystem 
	{
		[Embed(source="../../res/shoot.mp3")]
		private var cannonsoundclass : Class; 		 
		private var cannonsound : Sound;
		
		public var soundChannel:SoundChannel;
		public function SoundSystem() 
		{
			cannonsound = (new cannonsoundclass) as Sound;
			soundChannel = new SoundChannel();
		}
		
		public function playShot():void {
			soundChannel = cannonsound.play(1,1);
		}
	}
}