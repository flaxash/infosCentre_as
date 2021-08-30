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
		//public var salle5_mc:SalleMC;
		//public var salle6_mc:SalleMC;
		
		public var actualites_mc:ActualitesMC;
		public var message_mc:MessageMC;
		
		public var nomsSalles:Array = new Array("FORMATION 1", "FORMATION 2", "FORMATION 3", "OPEN SPACE");
		private var listeSalles:Array = new Array();
		
		public function EcranMC() {
			// constructor code
			with (listeSalles) {
				push(salle1_mc);
				push(salle2_mc);
				push(salle3_mc);
				push(salle4_mc);
				//push(salle5_mc);
				//push(salle6_mc);
				
			}
			afficheSalles();
			//salle5_mc.visible=false;
			//salle6_mc.visible=false;
			
		}
		private function afficheSalles():void {
			var maSalle:SalleMC;
			for (var i:uint=0;i<listeSalles.length;i++) {
				maSalle = SalleMC(listeSalles[i]);
				trace ("texte maSalle :" + maSalle + " est :" +nomsSalles[i]);
				maSalle.nomSalleTxt.text = nomsSalles[i];
				
			}
		}
		public function placeCreneau(resa:Reservation):void {
			var salleCible:SalleMC;
			
			switch (resa.salle) 
			{
				case 13 :
					//formation 1
					salleCible = salle1_mc;
					break;
				case 19 :
					//formation 2
					salleCible = salle2_mc;
					break;
				case 12 :
					//formation 3
					salleCible = salle3_mc;
					break;
				case 18:
					//Open space
					salleCible = salle4_mc;
					break;
				case 5:
					//num. éduc.
					//salleCible = salle5_mc;
					break;
				case 6:
					//esp. médiation
					//salleCible = salle6_mc;
					break;
				
				default :
					//on ne fait rien
					salleCible = null;
					break;
			}
			if (salleCible) {
				salleCible.afficheReservation(resa);
				salleCible.visible = true;
			}
		}
		public function effaceTout():void 
		{
			var maSalle:SalleMC;
			for (var i:uint=0;i<listeSalles.length;i++) {
				maSalle = SalleMC(listeSalles[i]);
				//trace (maSalle);
				maSalle.effaceReservations();
				trace ("données effacées pour salle : " + maSalle.name);
			}
			//salle5_mc.visible=false;
			//salle6_mc.visible=false;
		}
		
	}
	
}
