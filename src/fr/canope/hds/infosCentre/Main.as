package fr.canope.hds.infosCentre {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import fr.canope.hds.infosCentre.model.service.GetReservationsService;
	import fr.canope.hds.infosCentre.view.SalleMC;
	
	public class Main extends MovieClip {
		
		public var salle1_mc:SalleMC;
		public var salle2_mc:SalleMC;
		public var salle3_mc:SalleMC;
		public var salle4_mc:SalleMC;
		
		public function Main() {
			// constructor code
			trace("constructeur validé");
			var reservationsGetter : GetReservationsService = new GetReservationsService();
			reservationsGetter.signalServiceReady.add(onResults);
		}
		private function onResults(results:Array):void {
			
		}
		
	}
	
}
