package learnmath.mathml.formula.layout{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import flash.geom.*;
import flash.display.MovieClip;

public class PaddedBox extends RowBox{

	public var widthS:String = "";
	public var lspaceS:String = "";
	public var heightS:String = "";
	public var depthS:String = "";

	public var width:int;
	public var lspace:int;
	public var height:int;
	public var depth:int;

	public var moveY:int = 0;
	
	public function	PaddedBox(parentBox:Box){
		super(parentBox);
	}
	
	
	public override function calculate():void{
		super.calculate();
		
		width = calcValue(widthS, finalBounds.width);
		lspace = calcValue(lspaceS, finalBounds.width);
		height = calcValue(heightS, finalBounds.height);
		depth = calcValue(depthS, finalBounds.height);
		
		if(lspace>0){
			finalBounds.width = finalBounds.width + lspace;
		}
		if(width>0 && width>finalBounds.width){
			finalBounds.width = width;
		}
		if(depth>0){
			finalBounds.height = finalBounds.height + depth;
		}
		if(height>0 && height>finalBounds.height){
			moveY = height - finalBounds.height;
			finalBounds.height = height;
		}
		moveMyChildren();
	}
	
	override public function moveMyChildren():void{
		var cP:Point = new Point();
		cP.x = originPoint.x;
		cP.y = originPoint.y;
	
		var childx:Number = 0;
		var childy:Number = 0;
		if(lspace>0){
			childx = lspace;
		}
		if(moveY>0){
			childy = moveY;
		}
		for(var i:int =0; i<children.length;i++){
			var child:Box = children[i];
			
			cP.x = originPoint.x + childx;
			cP.y = originPoint.y + childy;
			child.moveOriginTo(cP);
			childx = childx + child.finalBounds.width;
		}
	}	
	
	public override function draw(graph:MovieClip):void{
		super.draw(graph);
		//DrawFormula.drawRectangle(graph, finalBounds);
	}
	

	override public function toString():String{
		return "PaddedBox";
	}
	
	
	public function calcValue(number:String, def:int):int{
		if(number.indexOf("%")>-1){
			var s:String = number.substring(0, number.indexOf("%"));
			var n:int = int(s);
			return n/100*def;
		}else{
			return int(number);
		}
	}
}

}