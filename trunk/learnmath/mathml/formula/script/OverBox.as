/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;

class learnmath.mathml.formula.script.OverBox extends Box{
	
	var base:Box;
	var exp:Box;
	
	var k:Number = 6/10;
	
	public function	OverBox(parentBox:Box){
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
		
		//center exp
		var dif = (base.finalBounds.width - exp.finalBounds.width)/2;
		if(dif>0){
			cE.x = originPoint.x + dif;
			exp.moveOriginTo(cE);
		}else{
			cP.x = originPoint.x - dif;
			base.moveOriginTo(cP);
		}
		finalBounds.y = exp.finalBounds.y;
		if(base.finalBounds.width > exp.finalBounds.width){
			finalBounds.width = base.finalBounds.width;
		}else{
			finalBounds.width = exp.finalBounds.width;
		}
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - exp.finalBounds.y;
	}
	

	public function moveMyChildren(){
		var dif = (base.finalBounds.width - exp.finalBounds.width)/2;
		var cP = new Point();
		var cE = new Point();
		cP.y = originPoint.y;
		cE.y = originPoint.y - base.finalBounds.height * k;

		if(dif>0){
			cE.x = originPoint.x + dif;
			cP.x = originPoint.x;
		}else{
			cP.x = originPoint.x - dif;
			cE.x = originPoint.x;
		}

		base.moveOriginTo(cP);
		exp.moveOriginTo(cE);

	}
	
	
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle = this.style.getCopy();
		newStyle.size = newStyle.size - 6;
		newStyle.fontweight='bold';
		exp.copyParentStyle(newStyle);
	}
	
	public function draw(graph:MovieClip){
		base.drawBox(graph);
		exp.drawBox(graph);
	}
}