/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;

class learnmath.mathml.formula.token.TBox extends TokenBox{
	var text:String;
	
	public function	TBox(parentBox:Box){
		super(parentBox);
	}

	public function calculate(){
		text = EntityManager.replaceAllCode(text);
		DrawFormula.calculateText(finalBounds, text, style);
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}

	public function draw(graph:MovieClip){
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height/2;
		DrawFormula.createText(graph, s, text, style);
	}

}