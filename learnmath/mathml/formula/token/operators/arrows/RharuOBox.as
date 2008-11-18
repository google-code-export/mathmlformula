/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.token.operators.arrows.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.arrows.RharuOBox extends LineOBox{

	public function	RharuOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function draw(graph:MovieClip){
		super.draw(graph)
		
		graph.moveTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height/2);
		graph.lineTo(finalBounds.x+finalBounds.width-3*wl, finalBounds.y + finalBounds.height/2-2*wl);
	}
	
	public function toString():String{
		return "RharuOBox";
	}
	
}