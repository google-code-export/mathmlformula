/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;

class learnmath.mathml.formula.layout.FencedBox extends RowBox{
	
	var linethickness = 1;
	
	// accepted char: () [] {} | &langle; &rangle; &lceil;&rceil;  &lfloor; &rfloor; &Verbar;
	var open = "(";
	var close = ")";
	var lfw = 10;
	var rfw = 10;
	
	var l:Number = 3/100;
	
	
	public function	FencedBox(parentBox:Box){
		super(parentBox);
	}
	
	public function calculate(){
		super.calculate();
		
		calculateFenceWidth();

		finalBounds.width=lfw + rfw;
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
		moveMyChildren()
	}


	public function moveMyChildren(){
		var childx = lfw;
		for(var i:Number =0; i<children.length;i++){
			var child:Box = children[i];
			
			var cP = new Point();
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y;
			
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}


	function calculateFenceWidth(){
		if(open==""){
			lfw=1;
		}else{
			lfw = finalBounds.height/6;
		}
		if(close==""){
			rfw=1;
		}else{
			rfw = finalBounds.height/6;
		}
	}
	
	
	
	public function draw(graph:MovieClip){
		super.draw(graph);
		var s = getTinethickness(linethickness, l)*3/4;
		graph.lineStyle(s, getHexColor(), 100);
		drawFence(graph, 0, open, lfw);
		drawFence(graph, finalBounds.width -rfw, close, rfw);
	}
	
	function drawFence(graph:MovieClip, x:Number, sign:String, fw){
		if(sign=="["){
			graph.moveTo(x+finalBounds.x+fw, finalBounds.y+2);
			graph.lineTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
			graph.lineTo(x+finalBounds.x+fw, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="]"){
			graph.moveTo(x+finalBounds.x, finalBounds.y+2);
			graph.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + 2);
			graph.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + finalBounds.height - 2);
			graph.lineTo(x+finalBounds.x, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="|"){
			graph.moveTo(x+finalBounds.x+fw/2, finalBounds.y + 1);
			graph.lineTo(x+finalBounds.x+fw/2, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="{"){
			graph.moveTo(x+finalBounds.x+4*fw/5, finalBounds.y + 1);
			graph.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y + 1,x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height/4);
			graph.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height/2-2,x+finalBounds.x, finalBounds.y+finalBounds.height/2);
			graph.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height/2+2, x+finalBounds.x+2*fw/5, finalBounds.y+3*finalBounds.height/4);
			graph.curveTo(x+finalBounds.x+2*fw/5, finalBounds.y+finalBounds.height -1,x+finalBounds.x+4*fw/5, finalBounds.y + finalBounds.height - 1);
		}else if(sign=="}"){
			graph.moveTo(x+finalBounds.x +1*fw/5, finalBounds.y + 1);
			graph.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y + 1,x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height/4);
			graph.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height/2-2,x+finalBounds.x +fw, finalBounds.y+finalBounds.height/2);
			graph.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height/2+2, x+finalBounds.x+3*fw/5, finalBounds.y+3*finalBounds.height/4);
			graph.curveTo(x+finalBounds.x +3*fw/5, finalBounds.y+finalBounds.height -1,x+finalBounds.x+1*fw/5, finalBounds.y + finalBounds.height - 1);
		}else if(sign=="&langle;"){
			graph.moveTo(x+finalBounds.x+4*fw/5, finalBounds.y+2);
			graph.lineTo(x+finalBounds.x, finalBounds.y + finalBounds.height/2);
			graph.lineTo(x+finalBounds.x+4*fw/5, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&rangle;"){
			graph.moveTo(x+finalBounds.x +1*fw/5, finalBounds.y+2);
			graph.lineTo(x+finalBounds.x +fw, finalBounds.y + finalBounds.height/2);
			graph.lineTo(x+finalBounds.x +1*fw/5, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&lceil;" | sign=="\u2308"){
			graph.moveTo(x+finalBounds.x+fw, finalBounds.y+2);
			graph.lineTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&rceil;" | sign=="\u2309"){
			graph.moveTo(x+finalBounds.x, finalBounds.y+2);
			graph.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + 2);
			graph.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&lfloor;" | sign=="\u230A"){
			graph.moveTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
			graph.lineTo(x+finalBounds.x+fw, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&rfloor;" | sign=="\u230B"){
			graph.moveTo(x+finalBounds.x +2*fw/3, finalBounds.y + 2);
			graph.lineTo(x+finalBounds.x +2*fw/3, finalBounds.y + finalBounds.height - 2);
			graph.lineTo(x+finalBounds.x , finalBounds.y + finalBounds.height - 2);
		}else if(sign=="&Verbar;"){
			graph.moveTo(x+finalBounds.x+fw/3, finalBounds.y + 2);
			graph.lineTo(x+finalBounds.x+fw/3, finalBounds.y + finalBounds.height - 2);
			graph.moveTo(x+finalBounds.x+2*fw/3, finalBounds.y + 1);
			graph.lineTo(x+finalBounds.x+2*fw/3, finalBounds.y + finalBounds.height - 2);
		}else if(sign=="("){
			graph.moveTo(x+finalBounds.x+fw, finalBounds.y+1);
			graph.curveTo(x+finalBounds.x, finalBounds.y+finalBounds.height/2,finalBounds.x+fw, finalBounds.y+finalBounds.height-1);
		}else if(sign==")"){
			graph.moveTo(x+finalBounds.x, finalBounds.y+1);
			graph.curveTo(x+finalBounds.x+fw, finalBounds.y+finalBounds.height/2,x+finalBounds.x, finalBounds.y+finalBounds.height-1);
		}
	}
	
	public function toString():String{
		return "FencedBox";
	}
}