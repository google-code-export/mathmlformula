package learnmath.mathml.formula.token.operators.normal{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;
import flash.display.MovieClip;

public class NGtrOBox extends OBox{

	private var k:Number = 0.04;
	private var wl:Number = 1;

	public function	NGtrOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Number = FontConstant.getHeight(style, "X");
		var w1:Number = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*1.3;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
	}
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.25, finalBounds.y + finalBounds.height*0.65);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.75, finalBounds.y + finalBounds.height*0.5);
		
		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.25, finalBounds.y + finalBounds.height*0.35);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.75, finalBounds.y + finalBounds.height*0.5);

		graph.graphics.moveTo(finalBounds.x+finalBounds.width*0.75, finalBounds.y + finalBounds.height*0.1);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width*0.25, finalBounds.y + finalBounds.height*0.9);
	}
	
	override public function toString():String{
		return "GgOBox";
	}
	
}

}