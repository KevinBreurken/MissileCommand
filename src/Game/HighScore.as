package Game 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import Library.GameObject;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class HighScore extends MovieClip
	{
		
		private var highscoreScreen:GameObject;
		private var closeButton:GameObject;
		
		//Lines of Highscores
		private var textscoreArray:Array;
		private var highscoreArray:Array;
		public function HighScore() 
		{
			highscoreArray = new Array();
			textscoreArray = new Array();
			highscoreScreen = new GameObject(6);
			addChild(highscoreScreen);
			closeButton = new GameObject(7);
			addChild(closeButton);
			closeButton.addEventListener(MouseEvent.CLICK, closeHighscoreScreen);
			for (var i:int = 0; i < 1; i++) {
				textscoreArray[i] = new TextField;
				addChild(textscoreArray[i]);
				textscoreArray[i].x = 250;
				textscoreArray[i].y = (60 * i) + 180;
				textscoreArray[i].text = "Score: " + Main.storedHighscore.data.score[i];
			}
		}
		public function closeHighscoreScreen(e:MouseEvent):void {
			removeChild(highscoreScreen);
			removeChild(closeButton);
			for (var i:int = 0; i < textscoreArray.length; i++) {
				removeChild(textscoreArray[i]);
			}
		}
	}
}