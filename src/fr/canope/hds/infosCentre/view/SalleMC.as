package fr.canope.hds.infosCentre.view
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class SalleMC extends MovieClip
	{
		public var resultTxt:TextField;
		
		public var nomSalleTxt:TextField;
		
		public var horairesAMTxt:TextField;
		public var nomAMTxt:TextField;
		
		public var horairesPMTxt:TextField;
		public var nomPMTxt:TextField;
		
		public function SalleMC()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onStageReady);
			
		}
		private function onStageReady(e:Event):void {
			trace (resultTxt);
		}
		
		public function afficheHeureMatin(s:String):void {
			horairesAMTxt.text = s;
		}
		
		public function afficheNomMatin(s:String):void {
			nomAMTxt.text = s;
		}
		
		public function afficheHeureSoir(s:String):void {
			horairesPMTxt.text = s;
		}
		
		public function afficheNomSoir(s:String):void {
			nomPMTxt.text = s;
		}
		
	}
}