package fr.canope.hds.infosCentre.view
{
	import com.greensock.TweenLite;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	
	import com.adobe.utils.ArrayUtil;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ActualitesMC extends MovieClip
	{
		private var monLoader:XMLLoader = new XMLLoader("https://www.reseau-canope.fr/atelier-hauts-de-seine/aLaUne/listeImages.xml",{onComplete:xmlLoaded, onError:xmlError, onFail:xmlError});
		private var queueImages:LoaderMax;
		
		private var timerImages:Timer;
		private var timerXML:Timer;		
		
		private var imageAffichee:uint;
		private var nbImages:uint;
		
		private var mesLiensImages:Array;
		private var arrayUtil:ArrayUtil;
		
		public function ActualitesMC()
		{
			super();
			setTimerXML();
			mesLiensImages = new Array();
			monLoader.load();
		}
		
		private function xmlLoaded (event:LoaderEvent):void {
			trace(monLoader.content.actualite.@image);
			var newLiensImages:Array=new Array();
			for each (var monXml:XML in monLoader.content.actualite) {
					if (monXml.@image) { newLiensImages.push(String(monXml.@image)) }
			}
			trace(newLiensImages);
			//vérifie que les images ne sont pas déjà là
			if (!arraysAreEqual(mesLiensImages,newLiensImages)) {
					mesLiensImages=newLiensImages;
					loadImages();
			} 
			
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
		private function xmlError (e:LoaderEvent):void {
			//do nothing
			
		}		
		private function setTimerXML():void {
			// 5mn = 300 000 ms
			timerXML = new Timer(300000);
			timerXML.addEventListener(TimerEvent.TIMER,onTickXML);
			timerXML.start();
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
		private function onTickXML(te:TimerEvent):void {
			monLoader.load();
		}
		private function arraysAreEqual(arr1:Array, arr2:Array):Boolean
		{
			if(arr1.length != arr2.length)
			{
				return false;
			}
			
			var len:Number = arr1.length;
			
			for(var i:Number = 0; i < len; i++)
			{
				if(arr1[i] !== arr2[i])
				{
					return false;
				}
			}
			
			return true;
		}
	}
}