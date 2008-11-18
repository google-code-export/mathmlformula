/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.TableBox extends Box{
	
	var children:Array;
	var rowalign:String = "";			// (top | bottom | center) 
	var columnalign:String = ""; 			// (left | center | right)
	var rowspacing:Number = -1;			// exact units or -1 default
	var columnspacing:Number = -1;			// exact units or -1 default
	var framespacing:Number = -1;			// exact units or -1 default
	
	var childrenWidth:Array;
	var finalColumnWidth:Array;
		
	public function	TableBox(parentBox:Box){
		super(parentBox);
		children = new Array();
		childrenWidth = new Array();
	}
	
	public function addRow(newBox:Box){
		children[children.length] = newBox;
	}
	

	public function calculate(){
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			var cP = new Point();
			child.calculateBox(cP);
			
			var trBox:TrBox = TrBox(child);
			childrenWidth[childrenWidth.length] = trBox.getChildrenWidth();
		}
		
		calculateMaxColumnWidth();
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			var trBox:TrBox = TrBox(child);
			trBox.setFinalColumnWidth(finalColumnWidth);
		}
		
		finalBounds.width=0;
		finalBounds.height=2*getFramespacing();
		
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			finalBounds.height = finalBounds.height + child.finalBounds.height;
			if(i<(children.length-1)){
				finalBounds.height = finalBounds.height + getRowspacing();
			}
			
			finalBounds.width = Math.max(finalBounds.width, child.finalBounds.width);
		}
		
		finalBounds.width = finalBounds.width + 2*getFramespacing();
		finalBounds.y = originPoint.y - finalBounds.height/2
		moveMyChildren();
	}


	public function moveMyChildren(){
		var childy = finalBounds.y + getFramespacing();
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];

			var cP = new Point();
			cP.x = originPoint.x + getFramespacing();
			cP.y = childy + child.finalBounds.height/2;

			child.moveOriginTo(cP);
			childy = childy + child.finalBounds.height + getRowspacing();
		}
	}
	
	public function getRowspacing():Number{
		if(rowspacing==-1){
			var h = FontConstant.getHeight(style, "X");
			return 0.5*h;
		}
		return rowspacing;
	}
	

	public function getFramespacing():Number{
		if(framespacing==-1){
			var w = FontConstant.getWidth(style, "X");
			return 0.2*w;
		}
		return framespacing;
	}
	

	public function calculateMaxColumnWidth(){
		finalColumnWidth = childrenWidth[0];
		for(var i:Number =1; i<childrenWidth.length;i++){
			var childrenW = childrenWidth[i];
			for(var j:Number =0; j<childrenWidth.length;j++){
				finalColumnWidth[j] = Math.max(finalColumnWidth[j], childrenW[j]);
			}
			
		}
	}


	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
						
			var trBox:TrBox = TrBox(child);
			if(trBox.rowalign==""){ trBox.rowalign = rowalign; }
			if(trBox.columnalign==""){ trBox.columnalign = columnalign; }
			if(trBox.columnspacing==-1){ trBox.columnspacing = columnspacing; }

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
		var s = "TableBox "+finalBounds+" [";
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