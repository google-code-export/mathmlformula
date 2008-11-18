/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.UnionOBox extends OBox{

	var addSize:Number = 3;
	var k:Number = 30/45;
	var l:Number = 2/10;
	var z:Number = 2/10;

	public function	UnionOBox(parentBox:Box){
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
		var d = l*w;
				
		graph.lineStyle(d, getHexColor(), 100);
		
		var r = (w - 2*d)/2;
		
		graph.moveTo(finalBounds.x + d, finalBounds.y + d);
		graph.lineTo(finalBounds.x + d, finalBounds.y + h - r - d);

		graph.moveTo(finalBounds.x + w - d, finalBounds.y + d);
		graph.lineTo(finalBounds.x + w - d, finalBounds.y + h - r - d);

    		DrawUtil.drawArc(graph, finalBounds.x + d, finalBounds.y + h - r - d, r, 180, 180);
    		

	}

	public function toString():String{
		return "UnionOBox";
	}
}