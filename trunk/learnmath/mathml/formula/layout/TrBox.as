/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.TrBox extends Box{
	
	var children:Array;
	var rowalign:String = "";			//(top | bottom | center)
	var columnalign:String = ""; 			//(left | center | right)
	var columnspacing:Number = -1;			// exact units or -1 default		
	
	var childrenWidth:Array;
	var finalColumnWidth:Array;
		
	public function	TrBox(parentBox:Box){
		super(parentBox);
		children = new Array();
		childrenWidth = new Array();
	}
	
	public function addTd(newBox:Box){
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

			childx = childx + child.finalBounds.width + getColumnspacing();
			childrenWidth[childrenWidth.length] = child.finalBounds.width;
		}
		
	}


	public function calculateFinalBounds(){
	
		finalBounds.height=0;
		finalBounds.y = children[0].finalBounds.y;
		var maxYPoint = children[0].finalBounds.y + children[0].finalBounds.height;

		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			
			maxYPoint = Math.max(maxYPoint, child.finalBounds.y + child.finalBounds.height);
			finalBounds.y = Math.min(finalBounds.y, child.finalBounds.y);
		}
				
		finalBounds.height = maxYPoint - finalBounds.y;
		
		var lastChild = children[children.length-1];
		finalBounds.width=lastChild.finalBounds.x + lastChild.finalBounds.width - originPoint.x;
	}
	
	public function setFinalColumnWidth(_finalColumnWidth:Array){
		finalColumnWidth = _finalColumnWidth;
		moveMyChildren();
		calculateFinalBounds();
	}

	public function moveMyChildren(){
		var childx = 0;
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];

			var w = child.finalBounds.width;
			var maxW = finalColumnWidth[i];
			var dx = (maxW-w)/2

			var tdBox:TdBox = TdBox(child);
			if(tdBox.columnalign=="left"){
				dx = 0;
			}else if(tdBox.columnalign=="right"){
				dx = (maxW-w);
			}
			
			
			var cP = new Point();
			cP.x = originPoint.x + childx + dx;
			cP.y = originPoint.y;
			child.moveOriginTo(cP);
			
			childx = childx + maxW + getColumnspacing();
		}
	
	}
	
	public function getChildrenWidth():Array{
		return childrenWidth;
	}
	
	public function getColumnspacing():Number{
		if(columnspacing==-1){
			var w = FontConstant.getWidth(style, "X");
			return 0.5*w;
		}
		return columnspacing;
	}
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			
			var tdBox:TdBox = TdBox(child);
			if(tdBox.rowalign==""){ tdBox.rowalign = rowalign; }
			if(tdBox.columnalign==""){ tdBox.columnalign = columnalign; }

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
		var s = "TrBox "+finalBounds+" [";
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