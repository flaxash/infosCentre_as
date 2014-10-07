package fr.canope.hds.infosCentre.view 
{
	import flash.display.MovieClip;
	
	import fr.canope.hds.infosCentre.model.vo.Reservation;
	import fr.canope.hds.infosCentre.view.ActualitesMC;
	import fr.canope.hds.infosCentre.view.SalleMC;
	
	
	public class EcranMC extends MovieClip 
	{
		public var salle1_mc:SalleMC;
		public var salle2_mc:SalleMC;
		public var salle3_mc:SalleMC;
		public var salle4_mc:SalleMC;
		
		public var actualites_mc:ActualitesMC;
		public var message_mc:MessageMC;
		
		public var nomsSalles:Array = new Array("CIRRUS", "CUMULUS", "STRATUS", "OZONE");
		private var listeSalles:Array = new Array();
		
		public function EcranMC() {
			// constructor code
			with (listeSalles) {
				push(salle1_mc);
				push(salle2_mc);
				push(salle3_mc);
				push(salle4_mc);
				
			}
			afficheSalles();
			
		}
		private function afficheSalles():void {
			var maSalle:SalleMC;
			for (var i:uint;i<listeSalles.length;i++) {
				maSalle = SalleMC(listeSalles[i]);
				//trace (maSalle);
				maSalle.nomSalleTxt.text = nomsSalles[i];
				
			}
		}
		public function placeCreneau(resa:Reservation):void {
			var salleCible:SalleMC;
			
			switch (resa.salle) {
				case 3 :
					//cirrus
					salleCible = salle1_mc;
					break;
				case 5 :
					//cumulus
					salleCible = salle2_mc;
					break;
				case 4 :
					//stratus
					salleCible = salle3_mc;
					break;
				case 6:
					//ozone
					salleCible = salle4_mc;
					break;
				default :
					//on ne fait rien
					break;
			}
			salleCible.afficheReservation(resa);
		}
		
	}
	
}
