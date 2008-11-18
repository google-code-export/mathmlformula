/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;

class learnmath.mathml.formula.script.SubBox extends Box{
	
	var base:Box;
	var sub:Box;
	
	public function	SubBox(parentBox:Box){
		super(parentBox);
	}
	
	public function calculate(){
		var cP = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);
		
		var cE = new Point();
		cE.x = originPoint.x + base.finalBounds.width;
		cE.y = originPoint.y + base.finalBounds.height/3;
		sub.calculateBox(cE);

		finalBounds.x = base.finalBounds.x;
		finalBounds.y = base.finalBounds.y;
		finalBounds.width = base.finalBounds.width + sub.finalBounds.width;
		finalBounds.height = sub.finalBounds.y + sub.finalBounds.height - base.finalBounds.y;
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
	}


	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle = this.style.getCopy();
		newStyle.size = newStyle.size -3;
		newStyle.fontweight='bold';
		sub.copyParentStyle(newStyle);
	}
	
	public function draw(graph:MovieClip){
		base.drawBox(graph);
		sub.drawBox(graph);
	}
}