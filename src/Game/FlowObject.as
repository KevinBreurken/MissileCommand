package Game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import Library.GameObject;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class FlowObject extends MovieClip
	{
		private var pathnum:int;
		private var gameobject:GameObject;
		public var isDestroyed:Boolean;
		public function FlowObject(type:int):void 
		{
			isDestroyed = false;
			var object:GameObject;
			switch(type) {
				case 1:
					object = new GameObject(16);
					pathnum = 1;
					object.y = 30;
				break;
			case 2:
					object = new GameObject(17);
					pathnum = 2;
					object.y = 500;
				break;
			}
			addChild(object);
			gameobject = object;
			addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		public function onUpdate(e:Event):void {
			switch(pathnum) {
				case 1:
					gameobject.movePosition(0, 8);
					if (gameobject.g.y >= 500) {
						removeEventListener(Event.ENTER_FRAME,onUpdate);
						removeChild(gameobject);
						isDestroyed = true;
					}
				break;
				case 2:
					gameobject.movePosition(0, -8);
					if (gameobject.g.y <= -385) {
						removeEventListener(Event.ENTER_FRAME,onUpdate);
						removeChild(gameobject);
						isDestroyed = true;
					}
				break;
			}
		}
		
	}

}