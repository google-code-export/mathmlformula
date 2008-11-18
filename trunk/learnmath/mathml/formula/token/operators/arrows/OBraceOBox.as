/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.arrows.OBraceOBox extends OBox{

	var k:Number = 1/10;
	var l:Number = 1/10;
	var wl:Number = 1;

	public function	OBraceOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function calculate(){
		DrawFormula.calculateText(finalBounds, text, style);
		var h1 = FontConstant.getHeight(style, "X");
		var w1 = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
		wl = finalBounds.width * l;
		ResizeBox.addBox(this);
	}
	
	public function changeSizeFromParent(){
		var u:UnderBox = UnderBox(parentBox);
		var o:OverBox = OverBox(parentBox);
		var uo:UnderOverBox = UnderOverBox(parentBox);
		if(u!=null | o!=null | uo!=null){
			if(parentBox.finalBounds.width>finalBounds.width){
				finalBounds.width = parentBox.finalBounds.width;
				finalBounds.x = parentBox.finalBounds.x;
			}
		}
	}	
	
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
	}
	
	public function draw(graph:MovieClip){
		graph.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.moveTo(finalBounds.x, finalBounds.y + finalBounds.height*0.8);
		graph.curveTo(finalBounds.x, finalBounds.y + finalBounds.height*0.6, finalBounds.x+finalBounds.width/4 , finalBounds.y+ finalBounds.height*0.6);
		graph.curveTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.6,finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.4);
		graph.curveTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.6, finalBounds.x+finalBounds.width*3/4, finalBounds.y + finalBounds.height*0.6);
		graph.curveTo(finalBounds.x+finalBounds.width, finalBounds.y + finalBounds.height*0.6,finalBounds.x+finalBounds.width, finalBounds.y + finalBounds.height*0.8);
	}
	
	public function toString():String{
		return "OBraceOBox";
	}
	
}