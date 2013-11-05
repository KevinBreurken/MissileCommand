package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.SharedObject;
	import Game.Menu;
	import flash.display.StageScaleMode;
	import Game.WaveSettings;
	import Library.SoundSystem;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		public static var storedHighscore:SharedObject = SharedObject.getLocal("AS3Highscore");
		private var wavesettings:WaveSettings = new WaveSettings();
		private var menu:Menu;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			if (!Main.storedHighscore.data.hasOwnProperty("score")) {
				Main.storedHighscore.data.score = new Array;
				Main.storedHighscore.data.score = [0,0,0,0,0];
				Main.storedHighscore.flush();
				trace("data was empty, but now its filled");
			}
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			menu = new Menu();
			addChild(menu);
		}

	}

}