/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;

class learnmath.mathml.formula.token.NBox extends TokenBox{
	var number:Number;
	
	
	public function	NBox(parentBox:Box){
		super(parentBox);
	}

	public function calculate(){
		DrawFormula.calculateText(finalBounds, "" + number, style);
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}
	
	public function draw(graph:MovieClip){
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height/2;
		DrawFormula.createText(graph, s, "" + number, style);
	}
	
}