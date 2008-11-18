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

class learnmath.mathml.formula.token.operators.integrals.Int9OBox extends IntOBox{

	public function	Int9OBox(parentBox:Box){
		//awint
		super(parentBox);
	}

	
	public function draw(graph:MovieClip){
		super.draw(graph);
		
		
		var x = finalBounds.x + finalBounds.width/2;
		var y = finalBounds.y + finalBounds.height/2;
		var rx = intWidth/3;
		
		DrawUtil.drawArc(graph, x-rx, y, rx, 180, 180);

		graph.lineStyle(1.7*l*finalBounds.height, getHexColor(), 100);
		graph.moveTo(x + rx, y -1);
    		graph.lineTo(x + rx +rx/2, y+rx/2);
		graph.moveTo(x + rx , y -1);
    		graph.lineTo(x + rx -rx/2, y+rx/2);
	
	}
	

	public function toString():String{
		return "Int9OBox";
	}
}