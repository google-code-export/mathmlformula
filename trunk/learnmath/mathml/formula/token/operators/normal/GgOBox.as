/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.normal.GgOBox extends OBox{

	var k:Number = 8/100;
	var wl:Number = 1;

	public function	GgOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function calculate(){
		DrawFormula.calculateText(finalBounds, text, style);
		var h1 = FontConstant.getHeight(style, "X");
		var w1 = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*1.3;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
	}
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
	}
	
	public function draw(graph:MovieClip){
		graph.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		wl = finalBounds.width*0.6;
		
		var step = wl*0.35;
		graph.moveTo(finalBounds.x+finalBounds.width/2-wl/2, finalBounds.y + finalBounds.height*0.5-wl/3);
		graph.lineTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.5);
		
		graph.moveTo(finalBounds.x+finalBounds.width/2-wl/2, finalBounds.y + finalBounds.height*0.5+wl/3);
		graph.lineTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.5);

		graph.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + step, finalBounds.y + finalBounds.height*0.5-wl/3);
		graph.lineTo(finalBounds.x+finalBounds.width/2 + step, finalBounds.y + finalBounds.height*0.5);
		
		graph.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + step, finalBounds.y + finalBounds.height*0.5+wl/3);
		graph.lineTo(finalBounds.x+finalBounds.width/2 + step, finalBounds.y + finalBounds.height*0.5);

		graph.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + 2*step, finalBounds.y + finalBounds.height*0.5-wl/3);
		graph.lineTo(finalBounds.x+finalBounds.width/2 + 2*step, finalBounds.y + finalBounds.height*0.5);
		
		graph.moveTo(finalBounds.x+finalBounds.width/2-wl/2 + 2*step, finalBounds.y + finalBounds.height*0.5+wl/3);
		graph.lineTo(finalBounds.x+finalBounds.width/2 + 2*step, finalBounds.y + finalBounds.height*0.5);

	}
	
	public function toString():String{
		return "GgOBox";
	}
	
}