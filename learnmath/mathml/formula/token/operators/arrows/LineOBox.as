package learnmath.mathml.formula.token.operators.arrows{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;
import flash.display.MovieClip;

public class LineOBox extends OBox{

	protected var k:Number = 0.1;
	protected var l:Number = 0.1;
	protected var wl:Number = 1;
	protected var prec:Number = 0.55;
	
	public function	LineOBox(parentBox:Box):void{
		super(parentBox);
	}

	
	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, text, style);
		var h1:Number = FontConstant.getHeight(style, "X");
		var w1:Number = FontConstant.getWidth(style, "X");

		finalBounds.width=1.5*w1;
		wl = finalBounds.width * l;
		if(minsize>-1){
			if(finalBounds.width<(minsize*w1)){
				finalBounds.width = minsize*w1;
			}
		}

		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
		ResizeBox.addBox(this);
	}
	
	override public function changeSizeFromParent():void{
		var u:UnderBox = new UnderBox(parentBox);
		var o:OverBox = new OverBox(parentBox);
		var uo:UnderOverBox = new UnderOverBox(parentBox);
		if(parentBox is UnderBox || parentBox is OverBox || parentBox is UnderOverBox){
			var w1:Number = FontConstant.getWidth(style, "X");

			if(stretchy){
				var mSize:int = finalBounds.width;
				var newX:Number = finalBounds.x;
				if(parentBox.finalBounds.width>finalBounds.width){
					mSize = parentBox.finalBounds.width;
					if(maxsize>-1 && mSize>(maxsize*w1)){
						mSize = maxsize*w1;
					}
					finalBounds.width = mSize;
					finalBounds.x = parentBox.finalBounds.x  + (parentBox.finalBounds.width-mSize)/2;
				}
			}
			
		}
	}
	
	
	override public function copyParentStyle(_styleParent:Style):void{
		super.copyParentStyle(_styleParent);
	}
	
	override public function draw(graph:MovieClip):void{
		graph.graphics.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.graphics.moveTo(finalBounds.x+wl, finalBounds.y + finalBounds.height*prec);
		graph.graphics.lineTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height*prec);
	}
	
	override public function toString():String{
		return "LineOBox";
	}
	
}

}