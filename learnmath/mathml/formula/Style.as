class learnmath.mathml.formula.Style{
	var size:Number;
	var color:String;
	var font:String;
	var fontweight:String;
	var fontstyle:String;
	
	public function getCopy():Style{
		var newStyle = new Style();
		newStyle.font = this.font;
		newStyle.size = this.size;
		newStyle.color = this.color;
		newStyle.fontweight = this.fontweight;
		newStyle.fontstyle = this.fontstyle;
		return newStyle;
	}
	
	public function getHexColor():Number{
		if(color==null) return 0;
		return parseInt(color.substring(1), 16);
	}


}