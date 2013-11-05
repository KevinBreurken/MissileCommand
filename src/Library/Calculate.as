package Library 
{
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Calculate 
	{
		public static function randomRange(minNum:Number, maxNum:Number):Number {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	}

}