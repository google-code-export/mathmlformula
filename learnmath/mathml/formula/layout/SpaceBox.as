package learnmath.mathml.formula.layout{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;
import flash.display.MovieClip;

public class SpaceBox extends Box{

	public var width:int = 1;
	public var height:int = 1;
	
	public function	SpaceBox(parentBox:Box){
		super(parentBox);
	}
	
	
	public override function calculate():void{
		finalBounds.width = width;
		finalBounds.height = height;
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}
	
	
	public override function draw(graph:MovieClip):void{
		//DrawFormula.drawRectangle(graph, finalBounds);
	}
	

	override public function toString():String{
		return "SpaceBox";
	}
	
	
}
}