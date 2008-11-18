/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.ErrorBox extends RowBox{
	
	public function	ErrorBox(parentBox:Box){
		super(parentBox);
	}
	
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			child.copyParentStyle(this.style);
		}
	}

	public function toString():String{
		return "ErrorBox";
	}
	
}