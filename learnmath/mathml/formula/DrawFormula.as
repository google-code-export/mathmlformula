/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.events.MouseEvent;
import flash.geom.*;

class DrawFormula{
	var parentBox:Box;
	static var index:Number = 0;
	var mc:MovieClip;
	
	
	public function DrawFormula(box:Box){
		parentBox=box;
	}
	
	public function clear(graph:MovieClip){
		if(mc!=null){
			removeMovieClip(mc);
		}
	}
	
	public function draw(graph:MovieClip, style:Style, leftMiddlePoint:Point):Rectangle{

		if(mc==null){
			mc = graph.createEmptyMovieClip("mc"+ index, graph.getNextHighestDepth());
		}

		ResizeBox.clear();
		parentBox.copyParentStyle(style);
		parentBox.calculateBox(leftMiddlePoint);
		ResizeBox.resizeChildren();
		parentBox.draw(mc);

		return parentBox.finalBounds.clone();
		
	}
	
	static function createText(graph:MovieClip, startPoint:Point, text:String, style:Style){
		var width = FontConstant.getWidth(style, text);
		var height = FontConstant.getHeight(style, text);
		graph.createTextField("g" + index, graph.getNextHighestDepth(), 0, 0, width, height);
		var l:TextField = eval("graph.g" + index);
		l.selectable = false;
		l._x = startPoint.x;
		l._y = startPoint.y;
		l.text = text;
		l.setTextFormat(FontConstant.getTextFormat(style, style.color));
		index = index + 1;
	}
	
	static function calculateText(bounds:Rectangle, text:String, style:Style){
		bounds.width = FontConstant.getWidth(style, text);
		bounds.height = FontConstant.getHeight(style, text);
	}
	
	static function drawRectangle(graph:MovieClip, bounds:Rectangle){
		graph.lineStyle(1, 0x000000, 100);
		graph.moveTo(bounds.x, bounds.y);
		graph.lineTo(bounds.x + bounds.width, bounds.y);
		graph.lineTo(bounds.x + bounds.width, bounds.y + bounds.height);
		graph.lineTo(bounds.x, bounds.y + bounds.height);
		graph.lineTo(bounds.x, bounds.y);

	}
	
}