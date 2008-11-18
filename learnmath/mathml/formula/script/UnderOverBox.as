/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;

class learnmath.mathml.formula.script.UnderOverBox extends Box{
	
	var base:Box;
	var sub:Box;
	var exp:Box;
	
	var k:Number = 6/10;
	
	
	public function	UnderOverBox(parentBox:Box){
		super(parentBox);
	}
	
	public function calculate(){
		var cP = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE = new Point();
		cE.x = originPoint.x ;
		cE.y = originPoint.y - base.finalBounds.height * k;
		exp.calculateBox(cE);
		
		var cS = new Point();
		cS.x = originPoint.x ;
		cS.y = originPoint.y + base.finalBounds.height * k;
		sub.calculateBox(cS);

		//center exp
		
		var max = base.finalBounds.width;
		if(exp.finalBounds.width>max){
			max = exp.finalBounds.width;
		}
		if(sub.finalBounds.width>max){
			max = sub.finalBounds.width;
		}
		
		cP.x = originPoint.x + (max - base.finalBounds.width)/2;
		base.moveOriginTo(cP);

		cE.x = originPoint.x + (max - exp.finalBounds.width)/2;
		exp.moveOriginTo(cE);

		cS.x = originPoint.x + (max - sub.finalBounds.width)/2;
		sub.moveOriginTo(cS);

		finalBounds.y = exp.finalBounds.y;
		finalBounds.width = max;
		finalBounds.height = sub.finalBounds.y + sub.finalBounds.height - exp.finalBounds.y;
	}
	

	public function moveMyChildren(){
		var cP = new Point();
		cP.y = originPoint.y;
		
		var cE = new Point();
		cE.y = originPoint.y - base.finalBounds.height * k;
		
		var cS = new Point();
		cS.y = originPoint.y + base.finalBounds.height * k;
	
		var max = base.finalBounds.width;
		if(exp.finalBounds.width>base.finalBounds.width){
			max = exp.finalBounds.width;
		}
		if(sub.finalBounds.width>base.finalBounds.width){
			max = sub.finalBounds.width;
		}
		
		cP.x = originPoint.x + (max - base.finalBounds.width)/2;
		base.moveOriginTo(cP);

		cE.x = originPoint.x + (max - exp.finalBounds.width)/2;
		exp.moveOriginTo(cE);

		cS.x = originPoint.x + (max - sub.finalBounds.width)/2;
		sub.moveOriginTo(cS);
	}
	
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle = this.style.getCopy();
		newStyle.size = newStyle.size -6;
		newStyle.fontweight='bold';
		sub.copyParentStyle(newStyle);
		exp.copyParentStyle(newStyle);
	}
	
	public function draw(graph:MovieClip){
		base.drawBox(graph);
		exp.drawBox(graph);
		sub.drawBox(graph);
	}
}