/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.CoProdOBox extends OBox{

	var addSize:Number = 3;
	var k:Number = 30/45;
	var l:Number = 3/45;
	var z:Number = 2/10;

	public function	CoProdOBox(parentBox:Box){
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
				
		var s = d;
		if(s<2){
			s=2;
		}
		if(s>5){
			s=5;
			d=5;
		}
		graph.lineStyle(s, getHexColor(), 100);

		graph.moveTo(finalBounds.x+w, finalBounds.y + h - d);
		graph.lineTo(finalBounds.x, finalBounds.y + h - d);
		
		graph.lineStyle(2*s, getHexColor(), 100);
		graph.moveTo(finalBounds.x+ w*z, finalBounds.y + d*5/2);
		graph.lineTo(finalBounds.x+ w*z, finalBounds.y + h - d*3/2 );
		
		graph.lineStyle(s, getHexColor(), 100);
		graph.moveTo(finalBounds.x+ w*z-d, finalBounds.y + 2*d);
		graph.lineTo(finalBounds.x+ w*z+d, finalBounds.y + 2*d );
		
		graph.lineStyle(2*s, getHexColor(), 100);
		graph.moveTo(finalBounds.x + w*(1-z), finalBounds.y + d*5/2);
		graph.lineTo(finalBounds.x + w*(1-z), finalBounds.y + h - d*3/2);
		
		graph.lineStyle(s, getHexColor(), 100);
		graph.moveTo(finalBounds.x + w*(1-z) -d, finalBounds.y + 2*d);
		graph.lineTo(finalBounds.x + w*(1-z) +d, finalBounds.y + 2*d );
	}

	public function toString():String{
		return "CoProdOBox";
	}
}