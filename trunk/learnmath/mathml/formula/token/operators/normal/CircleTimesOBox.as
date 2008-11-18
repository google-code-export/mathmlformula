/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.normal.CircleTimesOBox extends OBox{

	var k:Number = 5/100;
	var wl:Number = 2;

	public function	CircleTimesOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function calculate(){
		DrawFormula.calculateText(finalBounds, text, style);
		var h1 = FontConstant.getHeight(style, "X");
		var w1 = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*0.84;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2;
	}
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
	}
	
	public function draw(graph:MovieClip){
		graph.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		var x = finalBounds.x + finalBounds.width/2;
		var y = finalBounds.y + finalBounds.height*0.55;
		var rx = finalBounds.width/2 -1;
		
		DrawUtil.drawOval(graph, x, y, rx, rx);		

		wl = rx/1.44;
		graph.moveTo(finalBounds.x+finalBounds.width/2-wl, finalBounds.y + finalBounds.height*0.55 - wl);
		graph.lineTo(finalBounds.x+finalBounds.width/2+wl, finalBounds.y + finalBounds.height*0.55 + wl);

		graph.moveTo(finalBounds.x+finalBounds.width/2+wl, finalBounds.y + finalBounds.height*0.55 - wl);
		graph.lineTo(finalBounds.x+finalBounds.width/2-wl, finalBounds.y + finalBounds.height*0.55 + wl);
	}
	
	public function toString():String{
		return "CircleTimesOBox";
	}
	
}