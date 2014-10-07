package fr.canope.hds.infosCentre {
	
	import flash.display.MovieClip;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	
	import fr.canope.hds.infosCentre.model.service.GetReservationsService;
	import fr.canope.hds.infosCentre.view.EcranMC;
	import fr.canope.hds.infosCentre.view.FondMC;
	import fr.canope.hds.infosCentre.model.vo.Reservation;
	
	public class Main extends MovieClip {
		
		public var ecran_mc:EcranMC;
		public var fond_mc:FondMC;
		
		
		public function Main() {
			this.addEventListener(Event.ADDED_TO_STAGE,onStageReady);			
			// constructor code
			trace("constructeur validé");
			var reservationsGetter : GetReservationsService = new GetReservationsService();
			reservationsGetter.signalServiceReady.add(onResults);
			reservationsGetter.getReservations();
		}
		private function onResults(results:Array):void {
			//trace(results);
			var maResa:Reservation;
			for (var i:uint=0;i<results.length;i++) {
				maResa = results[i] as Reservation;
				//trace(maResa);
				ecran_mc.placeCreneau(maResa);
			}
		}
	
		private function onStageReady(e:Event):void {
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
	}
}
