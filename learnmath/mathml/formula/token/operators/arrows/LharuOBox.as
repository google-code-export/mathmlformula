/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.token.operators.arrows.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.arrows.LharuOBox extends LineOBox{

	public function	LharuOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function draw(graph:MovieClip){
		super.draw(graph)
		
		graph.moveTo(finalBounds.x+wl, finalBounds.y + finalBounds.height*prec);
		graph.lineTo(finalBounds.x+3*wl, finalBounds.y + finalBounds.height*prec-2*wl);
	}
	
	public function toString():String{
		return "LharuOBox";
	}
	
}