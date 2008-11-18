/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.arrows.PrimeOBox extends OBox{

	var k:Number = 3/100;
	var l:Number = 1/10;
	var num:Number = 1;
	var step:Number = 1;

	public function	PrimeOBox(parentBox:Box, n:Number){
		super(parentBox);
		num = n;
	}

	
	public function calculate(){
		DrawFormula.calculateText(finalBounds, text, style);
		var h1 = FontConstant.getHeight(style, "X");
		var w1 = FontConstant.getWidth(style, "X");
		
		step = w1/3;
		finalBounds.width=num*step;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
	}
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
	}

	
	public function draw(graph:MovieClip){
		graph.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.moveTo(finalBounds.x+step, finalBounds.y + finalBounds.height/3);
		graph.lineTo(finalBounds.x, finalBounds.y + finalBounds.height - finalBounds.height/3);
		if(num>1){
			graph.moveTo(finalBounds.x+2*step, finalBounds.y + finalBounds.height/3);
			graph.lineTo(finalBounds.x + step, finalBounds.y + finalBounds.height - finalBounds.height/3);
		}
		if(num>2){
			graph.moveTo(finalBounds.x+3*step, finalBounds.y + finalBounds.height/3);
			graph.lineTo(finalBounds.x +2*step, finalBounds.y + finalBounds.height - finalBounds.height/3);
		}
		
	}
	
	public function toString():String{
		return "PrimeOBox";
	}
	
}