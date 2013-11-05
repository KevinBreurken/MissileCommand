package Library 
{
	import flash.display.MovieClip;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class GUI extends MovieClip
	{
		[Embed(source="../../lib/alterebro-pixel-font.ttf", 
		fontName = "myFont", 
		mimeType = "application/x-font", 
		fontWeight="normal", 
		fontStyle="normal", 
		//unicodeRange="englishRange", 
		advancedAntiAliasing="true", 
		embedAsCFF = "false")]
		
		private var myEmbeddedFont:Class;
		private var textformat:TextFormat = new TextFormat( "myFont", 70 );
		
		private var displayart:GameObject;
		
		private var healthdisplay:TextField;
		private var wavedisplay:TextField;
		private var scoredisplay:TextField;
		
		public var healthamount:int;
		private var waveamount:int;
		public var scoreamount:int;
		
		public function GUI() 
		{
			displayart = new GameObject(8);
			healthdisplay = new TextField();
			wavedisplay = new TextField();
			scoredisplay = new TextField();
			addChild(displayart);
			addChild(healthdisplay);
			addChild(wavedisplay);
			addChild(scoredisplay);
			healthdisplay.defaultTextFormat = textformat;
			healthdisplay.embedFonts = true;
			wavedisplay.defaultTextFormat = textformat;
			wavedisplay.embedFonts = true;
			scoredisplay.defaultTextFormat = textformat;
			scoredisplay.embedFonts = true;
			displayart.setScale(0.8, 0.7);
			displayart.setPosition(500, 430);
			setTextPosition();
			updateText();
		}
		
		public function updateText():void {
			healthdisplay.text = "" + healthamount;
			scoredisplay.text = "" + scoreamount;
			wavedisplay.text = "" + waveamount;
		}
		
		public function addHealth(amount:int):void {
			healthamount -= amount;
			updateText();
		}
		
		public function resetData():void {
			healthamount = 10;
			waveamount = 0;
			scoreamount = 0;
			updateText();
		}
		
		public function addWave(amount:int):void {
			waveamount += amount;
			updateText();
		}
		
		public function addScore(amount:int):void {
			scoreamount += amount;
			updateText();
		}
		
		public function setTextPosition():void {
			healthdisplay.x = 708;
			healthdisplay.y = 430;
			wavedisplay.x = 730;
			wavedisplay.y = 520;
			scoredisplay.x = 550;
			scoredisplay.y = 530;
		}
	}
}