/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.entities.*;

class learnmath.mathml.formula.entities.Isodia extends EntityGroup{
	
	//Non-Russian Cyrillic for MathML 2.0
	
	public function getEntities(){
		return allCodes;
	}

static var allCodes = "<! acute            &#x000B4; >" + 
"<! breve            &#x002D8; >" + 
"<! caron            &#x002C7; >" + 
"<! cedil            &#x000B8; >" + 
"<! circ             &#x002C6; >" + 
"<! dblac            &#x002DD; >" + 
"<! die              &#x000A8; >" + 
"<! dot              &#x002D9; >" + 
"<! grave            &#x00060; >" + 
"<! macr             &#x000AF; >" + 
"<! ogon             &#x002DB; >" + 
"<! ring             &#x002DA; >" + 
"<! tilde            &#x002DC; >" + 
"<! uml              &#x000A8; >";
}