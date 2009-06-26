package learnmath.mathml.formula.token{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.token.operators.*;
import learnmath.mathml.formula.token.operators.integrals.*;
import learnmath.mathml.formula.token.operators.arrows.*;
import learnmath.mathml.formula.token.operators.normal.*;
import flash.geom.*;
import flash.display.MovieClip;

public class OBox extends TokenBox{
	public var text:String = "";
	
	public var stretchy:Boolean = true;
	public var maxsize:int = -1;
	public var minsize:int = -1;

	public function	OBox(parentBox:Box):void{
		super(parentBox);
	}

	override public function calculate():void{
		DrawFormula.calculateText(finalBounds, text, style);
		finalBounds.y = finalBounds.y - finalBounds.height/2;
	}
	
	
	override public function draw(graph:MovieClip):void{
		var s:Point = new Point();
		s.x = originPoint.x;
		s.y = originPoint.y - finalBounds.height/2;
		//DrawFormula.createText(graph, s, text, style);
		drawText(graph, s, text);

	}

	public static function getOBox(text:String, parentBox:Box):OBox{
		text = EntityManager.replaceWithKnownCode(text);
		if(text=='&Integral;' || text=='∫'){
			return new IntOBox(parentBox);
		}else if(text=='&Int;'){
			return new Int1OBox(parentBox);
		}else if(text=='&tint;'){
			return new Int2OBox(parentBox);
		}else if(text=='&qint;'){
			return new Int3OBox(parentBox);
		}else if(text=='&oint;'){
			return new Int4OBox(parentBox);
		}else if(text=='&Conint;'){
			return new Int5OBox(parentBox);
		}else if(text=='&Cconint;'){
			return new Int6OBox(parentBox);
		}else if(text=='&cwconint;'){
			return new Int7OBox(parentBox);
		}else if(text=='&awconint;'){
			return new Int8OBox(parentBox);
		}else if(text=='&awint;'){
			return new Int9OBox(parentBox);
		}else if(text=='&cwint;'){
			return new Int10OBox(parentBox);
		}else if(text=='&fpartint;'){
			return new Int11OBox(parentBox);
			
		}else if(text=='&sum;' || text=='∑'){
			return new SumOBox(parentBox);
		}else if(text=='&prod;' || text=='∏'){
			return new ProdOBox(parentBox);
		}else if(text=='&coprod;'){
			return new CoProdOBox(parentBox);
		}else if(text=='&Intersection;'){
			return new IntersectOBox(parentBox);
		}else if(text=='&Union;'){
			return new UnionOBox(parentBox);
			
		}else if(text=='&prime;'){
			return new PrimeOBox(parentBox, 1);
		}else if(text=='&Prime;'){
			return new PrimeOBox(parentBox, 2);
		}else if(text=='&tprime;'){
			return new PrimeOBox(parentBox, 3);
		}else if(text=='&dot;'){
			var box:OBox =  new OBox(parentBox);
			box.text = "\u2022";
			return box;
		}else if(text=='&ddot;'){
			box =  new OBox(parentBox);
			box.text = "\u2022\u2022";
			return box;
		}else if(text=='&TripleDot;'){
			box =  new OBox(parentBox);
			box.text = "\u2022\u2022\u2022";
			return box;
		}else if(text=='&OverBar;'){
			return new LineOBox(parentBox);
		}else if(text=='&UnderBar;'){
			return new LineOBox(parentBox);
		}else if(text=='&Hat;'){
			return new HatOBox(parentBox);
		}else if(text=='&Tilde;'){
			return new TildeOBox(parentBox);
		}else if(text=='&rarr;' || text=='→'){
			return new RArrOBox(parentBox);
		}else if(text=='&larr;' || text=='←'){
			return new LArrOBox(parentBox);
		}else if(text=='&harr;' || text=='↔'){
			return new HArrOBox(parentBox);
		}else if(text=='&rharu;'){
			return new RharuOBox(parentBox);
		}else if(text=='&lharu;'){
			return new LharuOBox(parentBox);
		}else if(text=='&frown;'){
			return new FrownOBox(parentBox);
		}else if(text=='&smile;'){
			return new SmileOBox(parentBox);
		}else if(text=='&UnderParenthesis;'){
			return new UParanthesisOBox(parentBox);
		}else if(text=='&OverBrace;'){
			return new OBraceOBox(parentBox);
		}else if(text=='&UnderBrace;'){
			return new UBraceOBox(parentBox);
		}else if(text=='&OverBracket;'){
			return new OBracketOBox(parentBox);
		}else if(text=='&UnderBracket;'){
			return new UBracketOBox(parentBox);

		}else if(text=='&mnplus;'){
			return new DMinusPlusOBox(parentBox);
		}else if(text=='&CircleMinus;'){
			return new CircleMinusOBox(parentBox);
		}else if(text=='&CircleTimes;'){
			return new CircleTimesOBox(parentBox);
		}else if(text=='&Gg;'){
			return new GgOBox(parentBox);
		}else if(text=='&Ll;'){
			return new LlOBox(parentBox);
		}else if(text=='&par;'){
			return new ParOBox(parentBox);
		}else if(text=='&NotGreaterGreater;'){
			return new NotGGOBox(parentBox);
		}else if(text=='&NotLessLess;'){
			return new NotLLOBox(parentBox);
		}else if(text=='&nless;'){
			return new NLessOBox(parentBox);
		}else if(text=='&ngtr;'){
			return new NGtrOBox(parentBox);
		}else if(text=='&nleqq;'){
			return new NLeqqOBox(parentBox);
		}else if(text=='&ngeqq;'){
			return new NGeqqOBox(parentBox);
		}
		var newObox:OBox =  new OBox(parentBox);
		newObox.text = EntityManager.replaceAllCode(text);
		return newObox;
	}
	
	
}

}