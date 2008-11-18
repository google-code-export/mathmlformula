/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.FracBox extends Box{
	
	var num:Box;
	var denum:Box;
	var linethickness = 1;
	var kLine:Number = 6/100;		
	var bevelled = false;
		
	public function	FracBox(parentBox:Box){
		super(parentBox);
	}
	
	public function calculate(){
		num.calculateBox(new Point());
		denum.calculateBox(new Point());
		
		if(bevelled){
			finalBounds.width=num.finalBounds.width + 10 + denum.finalBounds.width;
			finalBounds.height=denum.finalBounds.height*3/4 + num.finalBounds.height*3/4;		
		}else{
			if(num.finalBounds.width>denum.finalBounds.width){
				finalBounds.width=num.finalBounds.width;
			}else{
				finalBounds.width=denum.finalBounds.width;
			}
			finalBounds.height=denum.finalBounds.height + num.finalBounds.height;		
		}
		
		moveMyChildren();
		finalBounds.y = num.finalBounds.y;
		
	}
	
	public function moveMyChildren(){
		if(bevelled){
			var cP = new Point();
			cP.x = originPoint.x ;
			cP.y = originPoint.y + (1/4)*num.finalBounds.height - (num.finalBounds.y + num.finalBounds.height - num.originPoint.y);
			num.moveOriginTo(cP);

			var cD = new Point();
			cD.x = originPoint.x + num.finalBounds.width + 10;
			cD.y = originPoint.y - (1/4)*denum.finalBounds.height + (denum.originPoint.y-denum.finalBounds.y);
			denum.moveOriginTo(cD);
		}else{
			var cP = new Point();
			cP.x = originPoint.x + (finalBounds.width - num.finalBounds.width)/2;
			cP.y = originPoint.y - (num.finalBounds.y + num.finalBounds.height - num.originPoint.y);
			num.moveOriginTo(cP);

			var cD = new Point();
			cD.x = originPoint.x + (finalBounds.width - denum.finalBounds.width)/2;
			cD.y = originPoint.y + (denum.originPoint.y-denum.finalBounds.y);
			denum.moveOriginTo(cD);
		}
	}	


	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		num.copyParentStyle(this.style);
		denum.copyParentStyle(this.style);
	}
	

	public function draw(graph:MovieClip){
		num.drawBox(graph);

		var s = getTinethickness(linethickness, kLine);
		graph.lineStyle(s, getHexColor(), 100);
		if(bevelled){
			graph.moveTo(num.finalBounds.x+num.finalBounds.width+10, num.finalBounds.y);
			graph.lineTo(num.finalBounds.x+num.finalBounds.width, denum.finalBounds.y+denum.finalBounds.height);
		}else{
			graph.moveTo(originPoint.x, originPoint.y);
			graph.lineTo(originPoint.x + finalBounds.width, originPoint.y);
		}

		denum.drawBox(graph);

	}
	
	public function toString():String{
		return "FracBox "+finalBounds + " [ num " + num.toString() + ",  denum " + denum.toString();
	}
	
}