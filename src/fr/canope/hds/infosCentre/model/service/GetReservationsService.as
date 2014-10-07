package fr.canope.hds.infosCentre.model.service
{
	import fr.canope.hds.infosCentre.model.service.GetXmlService;
	import fr.canope.hds.infosCentre.model.vo.Reservation;
	
	import org.osflash.signals.Signal;
	
	public class GetReservationsService
	{
		private var myService:GetXmlService;
		private var reservationsDuJour:Array; 
		
		public var signalServiceReady:Signal  = new Signal(Array);
		
		public function GetReservationsService()
		{
			myService = new GetXmlService();
			myService.signalXml.add(onXmlLoaded);
			
		}
		public function getReservations():void {
			myService.load();
			
		}
		private function onXmlLoaded(myXML:XML):void 
		{
			
			trace("xml loaded");
			reservationsDuJour = new Array();
			var tempResa : Reservation;
			for each (var resa:XML in myXML.reservation) 
			{ 
				tempResa = new Reservation();
				tempResa.titre = resa.@nom;
				tempResa.salle = resa.@salle;
				tempResa.debut = resa.@debut;
				tempResa.fin = resa.@fin;
				reservationsDuJour.push(tempResa);
			}
			trace ("il y a " + reservationsDuJour.length + " reservations aujourd'hui");
			signalServiceReady.dispatch(reservationsDuJour);
		}
		
	}
}