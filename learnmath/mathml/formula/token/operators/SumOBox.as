/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.SumOBox extends OBox{

	var addSize:Number = 3;
	var k:Number = 20/45;
	var l:Number = 1/50;

	public function	SumOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function calculate(){
		var h = FontConstant.getHeight(style, "X");
		finalBounds.width=k*h;
		finalBounds.height=h;
		finalBounds.y=finalBounds.y-finalBounds.height/2;
		ResizeBox.addBox(this);
	}
	
	public function changeSizeFromParent(){
		resizeFromParent();
	}
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		this.style.size = this.style.size + addSize;
	}
	
	public function draw(graph:MovieClip){
		var h = finalBounds.height;
		var w = finalBounds.width
		var d = l*h;
		if(d<1){
			d=1;
		}
		var h1 = h/6;
		var g = 3*d;
		
		graph.lineStyle(1, getHexColor(), 100);

		graph.beginFill(getHexColor());

		graph.moveTo(finalBounds.x+w, finalBounds.y + g+ h1);
		graph.lineTo(finalBounds.x+w, finalBounds.y + g);
		graph.lineTo(finalBounds.x, finalBounds.y + g);
		graph.lineTo(finalBounds.x+w/2+d*0.7, finalBounds.y+h/2 + g);
		graph.lineTo(finalBounds.x, finalBounds.y+h);
		graph.lineTo(finalBounds.x+w, finalBounds.y+h);
		graph.lineTo(finalBounds.x+w, finalBounds.y+h-h1);
		
		graph.lineTo(finalBounds.x+w-g, finalBounds.y+h-g);
		graph.lineTo(finalBounds.x+g, finalBounds.y+h-g);
		graph.lineTo(finalBounds.x+w/2+g, finalBounds.y+h/2);
		graph.lineTo(finalBounds.x+g, finalBounds.y + d + g);
		graph.lineTo(finalBounds.x+w-g, finalBounds.y+d + g);
		graph.moveTo(finalBounds.x+w, finalBounds.y + h1 + g);
		

		graph.endFill();		
		
		
		
	}
	
	public function toString():String{
		return "SumOBox";
	}
	
}