/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;

class learnmath.mathml.formula.FontConstant{
	
	static var fontSize;
	static var startWidthSize:Number = 6;
	static var fontSizeFactor = 1.1;
		
	static function init(){
		if(fontSize==null){
			fontSize = new Array();
			fontSize[0] = startWidthSize;
			
			for(var i=1;i<40; i++){
				fontSize[i]= fontSize[i-1]*fontSizeFactor;
				fontSize[i-1] = int(fontSize[i-1]);
				//trace(i + " - " + fontSize[i-1]);
			}
			fontSize[fontSize.length-1] = int(fontSize[fontSize.length-1]);
			
		}
	}

	static function getTextFormat(style:Style):TextFormat{
		init();
		var tf = new TextFormat();
		tf.font=style.font; // _sans; _serif; _typewriter
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

	static function getWidth(style:Style, text:String):Number{
		init();
		return getTextFormat(style).getTextExtent(text).textFieldWidth;
	}
	
	static function getHeight(style:Style, text:String):Number{
		init();
		return getTextFormat(style).getTextExtent(text).textFieldHeight;
	}

	static function getAscent(style:Style, text:String):Number{
		init();
		return getTextFormat(style).getTextExtent(text).ascent;
	}

}