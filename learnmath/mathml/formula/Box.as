package learnmath.mathml.formula{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.MovieClip;
import flash.geom.*;

public class Box{
	
	public var originPoint:Point;
	public var finalBounds:Rectangle;
	public var style:Style;
	protected var children:Array;
	
	protected var parentBox:Box;
	
	public function Box(_parentBox:Box):void{
		parentBox = _parentBox;
		finalBounds = new Rectangle();
		originPoint = new Point();
		style = new Style();
	}
	
	public function initBounds(_originPoint:Point):void{
		finalBounds.x = _originPoint.x;
		finalBounds.y = _originPoint.y;
		finalBounds.width = 0;
		finalBounds.height = 0;
		originPoint.x = _originPoint.x;
		originPoint.y = _originPoint.y;
	}

	public function calculateBox(_originPoint:Point):void{
		initBounds(_originPoint);
		calculate();
	}

	public function calculate():void{
	}
	

	public function moveOriginTo(newOriginPoint:Point):void{
		finalBounds.x = newOriginPoint.x;
		finalBounds.y = finalBounds.y + (newOriginPoint.y - originPoint.y);

		originPoint.x = newOriginPoint.x;
		originPoint.y = newOriginPoint.y;
		moveMyChildren();
	}
	
	public function moveMyChildren():void{
	}
	

	public function changeSizeFromParent():void{
	}

	public function resizeFromParent():void{
		//parent box must be msubsup
		// parent of msubsup can be only type RowBox and if the next child is greater take this  height.
		var p:Box = parentBox.parentBox;
		var nextChild:Box;
		if (p!=null){
		for(var i:int =0; i<p.children.length;i++){
			var child:Box = p.children[i];
			if(child==parentBox){
				nextChild = p.children[i+1];
				break;
			}
		}
		if(nextChild!=null){
			var dxs:Number = parentBox.finalBounds.y - nextChild.finalBounds.y;
			var dxi:Number = nextChild.finalBounds.y + nextChild.finalBounds.height - parentBox.finalBounds.y - parentBox.finalBounds.height;
			if(dxs>0 && dxi>0){
				var min:Number = dxs;
				if(dxi<min){
					min = dxi;
				}
				
				min = 0.8*min;
				
				parentBox.finalBounds.y = parentBox.finalBounds.y - min;
				parentBox.finalBounds.height = parentBox.finalBounds.height + min*2;
				
				finalBounds.y = finalBounds.y - min;
				finalBounds.height = finalBounds.height + min*2;
				
				parentBox.moveMyChildren();
				
			}
		}
		
		}
	}



	public function copyParentStyle(_styleParent:Style):void{
		if(style.font==null && _styleParent.font!=null){
			style.font = _styleParent.font;
		}
		if(style.size==0 && _styleParent.size>0){
			style.size = _styleParent.size;
		}
		if(style.color==null && _styleParent.color!=null){
			style.color = _styleParent.color;
		}
		if(style.fontweight==null && _styleParent.fontweight!=null){
			style.fontweight = _styleParent.fontweight;
		}
		if(style.fontstyle==null && _styleParent.fontstyle!=null){
			style.fontstyle = _styleParent.fontstyle;
		}
	}
	
	public function getHexColor():uint{
		return parseInt(style.color.substring(1), 16);
	}

	public function drawBox(graph:MovieClip):void{
		DrawFormula.drawBackground(graph, finalBounds, style);
		draw(graph);
		//DrawFormula.drawRectangle(graph, finalBounds);
	}

	public function draw(graph:MovieClip):void{
	}


	public function toString():String{
		return "Box";
	}

	public function getTinethickness(l:Number, kLine:Number):Number{
		var s:Number = 1;
		if(l==1){
			s = finalBounds.height * kLine;
		}
		if(s<1){
			s=1;
		}else if(s>4){
			s=4;
		}
		return s;
	}
	
//added for editor

	public var selectionStart:Number =0;
	public var selectionEnd:Number =0;

	public function drawText(graph:MovieClip, p:Point, text:String):void{
		if(selectionStart>text.length){
			selectionStart=text.length;
		}
		if(selectionStart<0){
			selectionStart=0;
		}
		if(selectionEnd>text.length){
			selectionEnd=text.length;
		}
		if(selectionEnd<0){
			selectionEnd=0;
		}
		if(selectionStart==selectionEnd){
			DrawFormula.createText(graph, p, text, style);
		}else if((selectionStart==0 && selectionEnd==text.length) || (selectionEnd==0 && selectionStart==text.length)){
			var newStyle:Style = style.getCopy();
			newStyle.color = "#ff0000";
			DrawFormula.createText(graph, p, text, newStyle);
		}else if(selectionEnd<selectionStart){
			drawTextS(graph, text, selectionEnd, selectionStart, p)
		}else{
			drawTextS(graph, text, selectionStart, selectionEnd, p)
		}
	}
	
	public function drawTextS(graph:MovieClip, text:String, startS:Number, endS:Number,  p:Point):void{
			var t:String = text.substring(0,startS);
			DrawFormula.createText(graph, p, t, style);
			var w1:Number = FontConstant.getWidth(style, t);

			t = text.substring(startS, endS);
			var newStyle:Style = this.style.getCopy();
			newStyle.color = "#ff0000";
			var newP:Point = new Point();
			newP.x = p.x + w1-4;
			newP.y = p.y;
			DrawFormula.createText(graph, newP, t, newStyle);
			var w2:Number = FontConstant.getWidth(style, t);

			newP.x = p.x + w1 + w2-8;
			newP.y = p.y;
			t = text.substring(endS);
			DrawFormula.createText(graph, newP, t, style);
	}
	
}

}