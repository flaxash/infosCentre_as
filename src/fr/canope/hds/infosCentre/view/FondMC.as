package fr.canope.hds.infosCentre.view
{
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class FondMC extends MovieClip
	{
		public var photo_mc:MovieClip;
		
		private var xmin:Number;
		private var xmax:Number;
		
		public function FondMC()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,onStageReady);
		}
		private function onStageReady(e:Event):void {
			xmin = stage.stageWidth - photo_mc.width;
			xmax = 0;
			var tl:TimelineMax = new TimelineMax({repeat:-1});
			tl.add(new TweenLite(photo_mc, 60, {x: xmin, ease:Linear.easeInOut}));
			tl.add(new TweenLite(photo_mc, 60, {x:xmax, ease:Linear.easeInOut}));
			tl.play();
			
		}
	}
}