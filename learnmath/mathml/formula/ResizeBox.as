/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.geom.*;
import learnmath.mathml.formula.*;

class learnmath.mathml.formula.ResizeBox{
	

	static var children:Array = new Array();
	

	public static function clear(){
		children = new Array();
	}

	public static function addBox(box:Box){
		children[children.length] = box;
	}


	public static function resizeChildren(){
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			child.changeSizeFromParent();
		}
	}


}