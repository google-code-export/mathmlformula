/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.SqrtBox extends RowBox{
	
	var linethickness = 1;
	var kLine:Number = 6/100;		
	
	var widthR = 3;
	var kWR:Number = 17/100;		
	
	public function	SqrtBox(parentBox:Box){
		super(parentBox);
	}
	
	
	public function calculate(){
		super.calculate();

		widthR = finalBounds.height * kWR;

		finalBounds.width=finalBounds.width + widthR;
		var s = getTinethickness(linethickness, kLine);
		finalBounds.y = finalBounds.y - s;
		finalBounds.height=finalBounds.height + s;
		moveMyChildren();
	}


	public function moveMyChildren(){
		var childx = widthR;
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			
			var cP = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}



	public function draw(graph:MovieClip){
		super.draw(graph);
		var s = getTinethickness(linethickness, kLine);
		graph.lineStyle(s, getHexColor(), 100);
		graph.moveTo(finalBounds.x, finalBounds.y+ 2*widthR);
		graph.lineTo(finalBounds.x + (widthR/2), finalBounds.y + finalBounds.height);
		graph.lineTo(finalBounds.x + widthR, finalBounds.y + s/2+1);
		graph.lineTo(finalBounds.x + finalBounds.width, finalBounds.y + s/2+1);
	}

	public function toString():String{
		return "SqrtBox";
	}
	
}