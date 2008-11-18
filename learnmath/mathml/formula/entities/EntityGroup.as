/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.entities.*;

class learnmath.mathml.formula.entities.EntityGroup{
	
	public function getEntities(){
		return "";
	}

	public function getAllCodes():Array{
		var allCodes = getEntities();
		var list:Array = new Array();
		
		var search = "<! ";
		var index = allCodes.indexOf(search);
		while(index>-1){
			index = index + 3;
			var code = allCodes.substring(index, allCodes.indexOf(" ", index));
			list[list.length] = code;
			
			index = allCodes.indexOf(search, index);
		}
		
		return list;
	}

	public function getAllUnicodes():Array{
		var allCodes = getEntities();
		var list:Array = new Array();
		
		var search = " &#x";
		var index = allCodes.indexOf(search);
		while(index>-1){
			index = index + 1;
			var unicode = allCodes.substring(index, allCodes.indexOf(" ", index));
			list[list.length] = unicode;
			
			index = allCodes.indexOf(search, index + 1);
		}
		
		return list;
	}

	// Ex:unicode = &#x02AEF;
	public function getCode(unicode:String):String{
		if(unicode==null) return null;
		var allCodes = getEntities();
		var index:Number = allCodes.indexOf(unicode);	
		if(index>-1){
			var firstIndex = allCodes.lastIndexOf("<!", index) + 3;	
			var code = allCodes.substring(firstIndex, allCodes.indexOf(" ", firstIndex));
			return "&" + code + ";";
		}
		return null;
	}

	// Ex:code = &code;
	public function getUnicode(code:String):String{
		if(code==null) return null;
		
		var allCodes = getEntities();
		var search = "<! " + code.substring(1, code.length-1) + " ";
		var index:Number = allCodes.indexOf(search);	
		if(index>-1){
			var firstIndex = allCodes.indexOf("&#x", index);	
			var unicode = allCodes.substring(firstIndex, allCodes.indexOf(" ", firstIndex));
			return unicode;
		}
		return null;
	}

	public function getChar(code:String):String{
		var unicode:String = getUnicode(code);
		if(unicode==null) return null;
		
		if(unicode.indexOf(";&#x")>-1){
			var index = unicode.indexOf(";&#x");
			var letter1:Number = Number(new Number("0x" + unicode.substring(3, index)).toString(10));
			var letter2:Number = Number(new Number("0x" + unicode.substring(index+4, unicode.length-1)).toString(10));
			var s = String.fromCharCode( letter1 ) + String.fromCharCode( letter2 );
			return s;
		}else{
			var letter:Number = Number(new Number("0x" + unicode.substring(3, unicode.length-1)).toString(10));
			return String.fromCharCode( letter );
		}
	}

}