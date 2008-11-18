/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.RootBox extends Box{
	
	var base:Box;
	var index:Box;
	
	var linethickness = 1;
	var kLine:Number = 6/100;		
	
	var widthR = 3;
	var kWR:Number = 17/100;		
	
	public function	RootBox(parentBox:Box){
		super(parentBox);
	}
	
	public function calculate(){
		var cP = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
		base.calculateBox(cP);

		var cI = new Point();
		cI.x = originPoint.x;
		cI.y = originPoint.y - base.finalBounds.height/4 ;
		index.calculateBox(cI);
		
		widthR = base.finalBounds.height * kWR;

		finalBounds.width = index.finalBounds.width + widthR/2 + base.finalBounds.width
		if(base.finalBounds.y<index.finalBounds.y){
			finalBounds.y = base.finalBounds.y;
		}else{
			finalBounds.y = index.finalBounds.y;
		}
		
		finalBounds.height = base.finalBounds.y + base.finalBounds.height - finalBounds.y;

		moveMyChildren();
	}

	public function moveMyChildren(){
		var cP = new Point();
		cP.x = originPoint.x + index.finalBounds.width + widthR*1/2;
		cP.y = originPoint.y;
		base.moveOriginTo(cP);
			
		var cI = new Point();
		cI.x = originPoint.x;
		cI.y = originPoint.y - base.finalBounds.height/4 ;
		index.moveOriginTo(cI);
	}

	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		
		base.copyParentStyle(this.style);
		var newStyle = this.style.getCopy();
		newStyle.size = newStyle.size-3;
		index.copyParentStyle(newStyle);
	}
	
	
	public function draw(graph:MovieClip){
		var s = getTinethickness(linethickness, kLine);
		graph.lineStyle(s, getHexColor(), 100);
		graph.moveTo(base.finalBounds.x-widthR, base.finalBounds.y + 2*widthR);
		graph.lineTo(base.finalBounds.x-widthR/2, base.finalBounds.y + base.finalBounds.height);
		graph.lineTo(base.finalBounds.x, base.finalBounds.y + s/2);
		graph.lineTo(base.finalBounds.x + base.finalBounds.width, base.finalBounds.y + s/2);

		base.draw(graph);
		index.drawBox(graph);
	}
	
	public function toString():String{
		return "RootBox";
	}
}