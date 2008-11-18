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

class learnmath.mathml.formula.token.operators.integrals.Int6OBox extends Int2OBox{

	public function	Int6OBox(parentBox:Box){
		super(parentBox);
	}

	
	public function draw(graph:MovieClip){
		super.draw(graph);
		var x = finalBounds.x + finalBounds.width/2;
		var y = finalBounds.y + finalBounds.height/2;
		var rx = intWidth/4;		
		
		DrawUtil.drawOval(graph, x, y, rx*1.66, rx);
	}

	public function toString():String{
		return "Int6OBox";
	}
}