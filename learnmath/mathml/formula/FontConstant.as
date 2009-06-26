package learnmath.mathml.formula{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.text.TextField;
import learnmath.mathml.formula.*;
import flash.text.TextFormat;

public class FontConstant{
	
	public static var fontSize:Array;
	public static var startWidthSize:Number = 6;
	public static var fontSizeFactor:Number = 1.1;
		
	public static function init():void{
		if(fontSize==null){
			fontSize = new Array();
			fontSize[0] = startWidthSize;
			
			for(var i:int=1;i<40; i++){
				fontSize[i]= fontSize[i-1]*fontSizeFactor;
				fontSize[i-1] = Number(fontSize[i-1]);
			}
			fontSize[fontSize.length-1] = Number(fontSize[fontSize.length-1]);
			
		}
	}

	public static function getTextFormat(style:Style):TextFormat{
		init();
		var tf:TextFormat = new TextFormat();
		tf.font=style.font; 
		if(style.fontweight=='bold'){
			tf.bold = true;
		}
		if(style.fontstyle=='italic'){
			tf.italic = true;
		}
		tf.color = style.getHexColor();
		tf.size = fontSize[style.size];
		return tf;
	}

	public static function getWidth(style:Style, text:String):Number{
		init();
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = getTextFormat(style);
		tfield.text = text;
		var add:int = 4;
		if(style.fontstyle=='italic'){
			add = 7;
		}
		return tfield.getLineMetrics(0).width + add;
	}
	
	public static function getHeight(style:Style, text:String):Number{
		init();
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = getTextFormat(style);
		tfield.text = text;
		return tfield.getLineMetrics(0).height+4;
	}


}

}