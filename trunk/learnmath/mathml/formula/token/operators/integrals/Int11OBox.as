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
import learnmath.mathml.formula.util.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.integrals.Int11OBox extends IntOBox{

	public function	Int11OBox(parentBox:Box){
		//fpartint
		super(parentBox);
	}

	
	public function draw(graph:MovieClip){
		super.draw(graph);
		
		var x = finalBounds.x + finalBounds.width/2;
		var y = finalBounds.y + finalBounds.height/2;
		var rx = intWidth/4;
		
		graph.lineStyle(2*l*finalBounds.height, getHexColor(), 100);
		graph.moveTo(x + rx , y);
    		graph.lineTo(x - rx , y);

	}

	public function toString():String{
		return "Int11OBox";
	}
}