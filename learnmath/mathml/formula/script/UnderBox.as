/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;

class learnmath.mathml.formula.script.UnderBox extends Box{
	
	var base:Box;
	var sub:Box;
	
	var k:Number = 6/10;
	
	
	public function	UnderBox(parentBox:Box){
		super(parentBox);
	}
	
	public function calculate(){
		var cP = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE = new Point();
		cE.x = originPoint.x ;
		cE.y = originPoint.y + base.finalBounds.height * k;
		sub.calculateBox(cE);
		
		//center exp
		var dif = (base.finalBounds.width - sub.finalBounds.width)/2;
		if(dif>0){
			cE.x = originPoint.x + dif;
			sub.moveOriginTo(cE);
		}else{
			cP.x = originPoint.x - dif;
			base.moveOriginTo(cP);
		}
		finalBounds.y = base.finalBounds.y;
		if(base.finalBounds.width > sub.finalBounds.width){
			finalBounds.width = base.finalBounds.width;
		}else{
			finalBounds.width = sub.finalBounds.width;
		}
		finalBounds.height = (sub.finalBounds.y + sub.finalBounds.height) - base.finalBounds.y;
	}
	

	public function moveMyChildren(){
		var dif = (base.finalBounds.width - sub.finalBounds.width)/2;
		var cP = new Point();
		var cE = new Point();
		cP.y = originPoint.y;
		cE.y = originPoint.y + base.finalBounds.height * k;

		if(dif>0){
			cE.x = originPoint.x + dif;
			cP.x = originPoint.x;
		}else{
			cP.x = originPoint.x - dif;
			cE.x = originPoint.x;
		}

		base.moveOriginTo(cP);
		sub.moveOriginTo(cE);

	}

	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle = this.style.getCopy();
		newStyle.size = newStyle.size - 6;
		newStyle.fontweight='bold';
		sub.copyParentStyle(newStyle);
	}
	
	public function draw(graph:MovieClip){
		base.drawBox(graph);
		sub.drawBox(graph);
	}
	
	public function toString():String{
		return "UnderBox";
	}
}