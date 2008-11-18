/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.operators.*;
import flash.geom.*;

class learnmath.mathml.formula.script.SubSupBox extends Box{
	
	var base:Box;
	var sub:Box;
	var exp:Box;
	
	public function	SubSupBox(parentBox:Box){
		super(parentBox);
	}
	
	public function calculate(){
		var cP = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE = new Point();
		cE.x = originPoint.x + base.finalBounds.width;
		cE.y = originPoint.y - base.finalBounds.height/3;
		exp.calculateBox(cE);

		var cS = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		cS.y = originPoint.y + base.finalBounds.height/3;
		sub.calculateBox(cS);
		
		finalBounds.x = base.originPoint.x;
		finalBounds.y = exp.finalBounds.y;

		if(sub.finalBounds.width>exp.finalBounds.width){
			finalBounds.width = base.finalBounds.width + sub.finalBounds.width;
		}else{
			finalBounds.width = base.finalBounds.width + exp.finalBounds.width;
		}
		finalBounds.height = sub.finalBounds.y + sub.finalBounds.height - exp.finalBounds.y;
	}
	


	public function moveMyChildren(){
		var cP = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
		
		var cS = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		cS.y = originPoint.y + base.finalBounds.height/3;
		sub.moveOriginTo(cS);

		var cE = new Point();
		cE.x = originPoint.x + base.finalBounds.width;
		cE.y = originPoint.y - base.finalBounds.height/3;
		exp.moveOriginTo(cE);


	}
	
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle = this.style.getCopy();
		newStyle.size = newStyle.size -3;
		newStyle.fontweight='bold';
		sub.copyParentStyle(newStyle);
		exp.copyParentStyle(newStyle);
	}
	

	public function draw(graph:MovieClip){
		base.drawBox(graph);
		exp.drawBox(graph);
		sub.drawBox(graph);
	}


	public function toString():String{
		return "SubSupBox";
	}
}