package fr.canope.hds.infosCentre {

	import flash.display.MovieClip;
	import flash.display.StageDisplayState;
	import flash.events.Event;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import com.adobe.utils.ArrayUtil;

	import fr.canope.hds.infosCentre.model.service.GetReservationsService;
	import fr.canope.hds.infosCentre.view.EcranMC;
	import fr.canope.hds.infosCentre.view.FondMC;
	import fr.canope.hds.infosCentre.model.vo.Reservation;

	public class Main extends MovieClip {

		public var ecran_mc: EcranMC;
		public var fond_mc: FondMC;

		private var resultArray: Array = new Array();

		private var timerLoading: Timer;
		private var intervalLoading: int = 30; //en s

		private var reservationsGetter: GetReservationsService = new GetReservationsService();

		public function Main() {
			this.addEventListener(Event.ADDED_TO_STAGE, onStageReady);
			// constructor code
			trace("constructeur validé");
			reservationsGetter.signalServiceReady.add(onResults);
			reservationsGetter.getReservations();
			// Timer pour mise à jour des données toutes les 5 mn	
			timerLoading = new Timer(intervalLoading * 1000);
			timerLoading.addEventListener(TimerEvent.TIMER, onTick);
			timerLoading.start();
		}
		private function onResults(results: Array): void {
			//trace(results);
			//trace(resultArray.length > 0 ? resultArray[0].titre : "vide");
			trace(compareResults(results, resultArray));
			if (!compareResults(results, resultArray)) {
				trace("mise à jour des données nécessaire");
				var maResa: Reservation;
				ecran_mc.effaceTout();
				for (var i: uint = 0; i < results.length; i++) {
					maResa = results[i] as Reservation;
					//trace(maResa);
					ecran_mc.placeCreneau(maResa);
				}
			}
			resultArray = results;
		}

		private function onStageReady(e: Event): void {
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		private function onTick(te: TimerEvent): void {
			reservationsGetter.getReservations();
			trace("chargement des données pour mise à jour");
		}
		private function compareResults(arr1: Array, arr2: Array): Boolean {
			if (arr1.length != arr2.length) {
				return false;
			}
			var len: Number = arr1.length;

			for (var i: Number = 0; i < len; i++) {
				var resa1: Reservation = arr1[i];
				var resa2: Reservation = arr2[i];
				if (resa1.titre !== resa2.titre) {
					return false;
				}
				if (resa1.debut !== resa2.debut) {
					return false;
				}
				if (resa1.fin !== resa2.fin) {
					return false;
				}
				if (resa1.salle !== resa2.salle) {
					return false;
				}
			}

			return true;

		}
	}
}