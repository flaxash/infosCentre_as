package fr.canope.hds.infosCentre.view
{
	import com.greensock.TweenLite;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ActualitesMC extends MovieClip
	{
		private var monLoader:XMLLoader = new XMLLoader("http://www.cddp92.ac-versailles.fr/aLaUne/listeImages.xml",{onComplete:xmlLoaded});
		private var queueImages:LoaderMax;
		
		private var timerImages:Timer;
		
		private var imageAffichee:uint;
		private var nbImages:uint;
		
		private var mesLiensImages:Array;
		
		public function ActualitesMC()
		{
			super();
			monLoader.load();
			mesLiensImages = new Array();
		}
		private function xmlLoaded (event:LoaderEvent):void {
			//trace(monLoader.content.actualite.@image);
			for each (var monXml:XML in monLoader.content.actualite) {
				mesLiensImages.push(String(monXml.@image))
			}
			trace(mesLiensImages);
			loadImages();
		}
		private function loadImages():void {
			queueImages = new LoaderMax({onComplete:completeHandler});
			var i:uint = 0;
			for each (var chemin:String in mesLiensImages) {				
				queueImages.append( new ImageLoader(chemin, {name:"photo"+i, container:this, alpha:0}) );
				i++;
			}
			queueImages.load();
		}
		private function completeHandler(e:LoaderEvent):void {
			nbImages = queueImages.numChildren;
			imageAffichee = 0;
			
			setTimer();
		}
		private function setTimer():void {
			timerImages = new Timer(5000);
			timerImages.addEventListener(TimerEvent.TIMER,onTick);
			timerImages.start();
		}
		private function onTick(te:TimerEvent):void {
			trace("tick");
			for (var i:uint=0;i<nbImages;i++) {
				var image:DisplayObject = this.getChildByName("photo"+i);
				TweenLite.to(image,1,{alpha:0});
				if (i==imageAffichee) {
					TweenLite.to(image,1,{alpha:1});
				} else {
					TweenLite.to(image,1,{alpha:0});
				}
			}
			imageAffichee++;
			imageAffichee = imageAffichee%nbImages;
		}
	}
}