/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.PhantomBox extends RowBox{
	
	public function	PhantomBox(parentBox:Box){
		super(parentBox);
	}
	
	
	public function draw(graph:MovieClip){
	}

	public function toString():String{
		return "PhantomBox";
	}
	
}