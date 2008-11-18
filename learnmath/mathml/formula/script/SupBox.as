/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;

class learnmath.mathml.formula.script.SupBox extends Box{
	
	var base:Box;
	var exp:Box;
	
	public function	SupBox(parentBox:Box){
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

		finalBounds.x = base.finalBounds.x;
		finalBounds.y = exp.finalBounds.y;
		finalBounds.width = base.finalBounds.width + exp.finalBounds.width;
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - exp.finalBounds.y;
	}
	

	public function moveMyChildren(){
		var cP = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
		
		var cS = new Point();
		cS.x = originPoint.x + base.finalBounds.width;
		cS.y = originPoint.y - base.finalBounds.height/3;
		exp.moveOriginTo(cS);

	}
	

	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle = this.style.getCopy();
		newStyle.size = newStyle.size -3;
		newStyle.fontweight='bold';
		exp.copyParentStyle(newStyle);
	}
	
	public function draw(graph:MovieClip){
		base.drawBox(graph);
		exp.drawBox(graph);
	}

}