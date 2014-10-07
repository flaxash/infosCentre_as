package fr.canope.hds.infosCentre.view
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import fr.canope.hds.infosCentre.model.vo.Reservation;
	
	public class SalleMC extends MovieClip
	{
		
		public var nomSalleTxt:TextField;
		public var cible_mc:MovieClip;
		
		private var nbReservations:uint;
		private var  nbMaxReservations:uint = 3;
		
		private var arrayReservations:Array = new Array();
		private var position_y:Number = 0;
		
		
		public function SalleMC()
		{
			super();
		
		}
		
		public function afficheReservation (resa:Reservation):void {
			arrayReservations.push(resa);
			var monBloc:BlocHoraireMC = new BlocHoraireMC();
			monBloc.horairesTxt.text = resa.debut + " - " + resa.fin ;
			monBloc.nomTxt.text = resa.titre;
			monBloc.x = cible_mc.x;
			monBloc.y = cible_mc.y + position_y;
			this.addChild(monBloc);
			position_y += 150;
		}
		
		
	}
}