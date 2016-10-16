package fr.canope.hds.infosCentre.model.service
{
	
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.osflash.signals.Signal;
	
	//classe pour charger le xml en ligne 
	public class GetXmlService
	{
		private var loaderXml : URLLoader = new URLLoader();
		//private var requeteUrl : URLRequest = new URLRequest("http://www.cd92.ac-versailles.fr/mrbs/web/xmlrequest+n.php")
		private var requeteUrl : URLRequest = new URLRequest("http://www.canope92.fr/mrbs/web/xmlrequest.php")
		private var xmlResult:XML;
		public var signalXml:Signal = new Signal(XML);
		
		public function GetXmlService()
		{
			trace("xmlService instancié");
			
		}
		public function load():void {
			//on charge le xml
			loaderXml.addEventListener(Event.COMPLETE, onXmlComplete);
			loaderXml.load(requeteUrl);
		}
		private function onXmlComplete (event:Event):void {
			trace(new XML(loaderXml.data));
			signalXml.dispatch(new XML(loaderXml.data));
		
		}
	}
}