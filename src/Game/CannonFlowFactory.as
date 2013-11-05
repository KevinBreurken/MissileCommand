package Game 
{
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class CannonFlowFactory 
	{
		public function makeFlowObject( type : int ) : FlowObject
        {
			var flowobj : FlowObject;
            if(type == 1)
            {
                flowobj = new FlowObject(1);
            }
            else if(type == 2)
            {
            flowobj = new FlowObject(2);
            }  
			flowobj.x = 20;
            return flowobj;
        }
	}
}
