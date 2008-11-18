/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.RowBox extends Box{
	
	var children:Array;
		
	public function	RowBox(parentBox:Box){
		super(parentBox);
		children = new Array();
	}
	
	public function addChild(newBox:Box){
		children[children.length] = newBox;
	}
	

	public function calculate(){
		var childx = 0;
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			
			var cP = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			child.calculateBox(cP);
			
			childx = childx + child.finalBounds.width;
		}
		
		finalBounds.width=0;
		finalBounds.height=0;
		finalBounds.y = children[0].finalBounds.y;
		var minYPoint = children[0].finalBounds.y
		
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			
			finalBounds.width = finalBounds.width + child.finalBounds.width;
			if((child.finalBounds.y + child.finalBounds.height)>minYPoint){
				minYPoint = child.finalBounds.y + child.finalBounds.height
			}
			
			if(child.finalBounds.y<finalBounds.y){
				finalBounds.y = child.finalBounds.y;
			}
		}
		
		finalBounds.height = minYPoint - finalBounds.y;
	}


	public function moveMyChildren(){
		var childx = 0;
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			
			var cP = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			child.copyParentStyle(this.style);
		}
	}
	
	
	public function draw(graph:MovieClip){
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			child.drawBox(graph);
		}
		//DrawFormula.drawRectangle(graph, finalBounds);
	}
	
	public function toString():String{
		var s = "RowBox "+finalBounds+" [";
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			s = s + child.toString() ;
			if((i+1)!=children.length){
				s = s + ",";
			}
		}
		s = s + "]";
		return s;
	}
	
	
}