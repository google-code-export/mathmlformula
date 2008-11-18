/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.token.operators.*;
import learnmath.mathml.formula.token.operators.integrals.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.integrals.Int3OBox extends IntOBox{

	
	public function	Int3OBox(parentBox:Box){
		super(parentBox);
	}

	
	public function calculate(){
		var h1 = FontConstant.getHeight(style, "X");
		step = h1*1/10;
		finalBounds.width=k*h1 + 3*step;
		intWidth = k*h1;
		finalBounds.height=h1;
		finalBounds.y=finalBounds.y-finalBounds.height/2;
		ResizeBox.addBox(this);
	}
	
	public function draw(graph:MovieClip){
		drawIntegral(graph, finalBounds.x, finalBounds.y, finalBounds.width-3*step, finalBounds.height)
		drawIntegral(graph, finalBounds.x+ step, finalBounds.y, finalBounds.width-3*step, finalBounds.height)
		drawIntegral(graph, finalBounds.x+ 2*step, finalBounds.y, finalBounds.width-3*step, finalBounds.height)
		drawIntegral(graph, finalBounds.x+ 3*step, finalBounds.y, finalBounds.width-3*step, finalBounds.height)
	}

	public function toString():String{
		return "Int3OBox";
	}
}