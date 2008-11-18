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

class learnmath.mathml.formula.token.operators.integrals.IntOBox extends OBox{

	var addSize:Number = 8;
	var k:Number = 4/10;
	var l:Number = 1/45;
	var r:Number = 1/10;

	var intWidth = 0;
	var step = 0;
	
	public function	IntOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function calculate(){
		var h1 = FontConstant.getHeight(style, "X");
		finalBounds.width=k*h1;
		intWidth = k*h1;
		finalBounds.height=h1;
		finalBounds.y=finalBounds.y-finalBounds.height/2;
		ResizeBox.addBox(this);
	}
	
	public function changeSizeFromParent(){
		resizeFromParent();
		
		var s:SubSupBox = SubSupBox(parentBox);
		if(s.sub!=null){
			var cP = new Point();
			cP.x = s.sub.originPoint.x - finalBounds.width/4;
			cP.y = s.sub.originPoint.y;
			s.sub.moveOriginTo(cP);

			if((s.exp.finalBounds.x + s.exp.finalBounds.width)>s.sub.finalBounds.x + s.sub.finalBounds.width){
				s.finalBounds.width = s.exp.finalBounds.x + s.exp.finalBounds.width - s.base.finalBounds.x;
			}else{
				s.finalBounds.width = s.sub.finalBounds.x + s.sub.finalBounds.width - s.base.finalBounds.x;
			}
		}
		
	}
	


	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		this.style.size = this.style.size + addSize;
	}
	
	public function draw(graph:MovieClip){
		drawIntegral(graph, finalBounds.x, finalBounds.y, finalBounds.width, finalBounds.height)
	}

	function drawIntegral(graph:MovieClip , x:Number, y:Number, w:Number, h:Number){
		var rr = r*w;
		var g = r*h/3;
		
		graph.lineStyle(l*h, getHexColor(), 100);
		graph.moveTo(x + w, y + rr);
    		graph.curveTo(x + w - rr, y ,x + w - 2*rr, y + rr);
    		
    		DrawUtil.drawOval(graph, x + w -rr/2, y + rr, rr/2, rr/2);

		graph.moveTo(x + w - 2*rr, y + rr);
    		graph.curveTo(x + w/2 + g, y+h/2, x+2*rr, y + h - rr);
    		
		graph.moveTo(x + w - 2*rr, y + rr);
    		graph.curveTo(x + w/2 - g, y+h/2, x+2*rr, y + h - rr);
    		
    		graph.moveTo(x + w - 2*rr, y + rr);
    		graph.lineTo(x+2*rr, y + h - rr);

		graph.moveTo(x+2*rr, y + h - rr);
    		graph.curveTo(x+ rr, y + h , x, y + h - rr);

    		DrawUtil.drawOval(graph, x + rr/2, y + h - rr, rr/2, rr/2);
    		
    	}

	public function toString():String{
		return "IntOBox";
	}
}