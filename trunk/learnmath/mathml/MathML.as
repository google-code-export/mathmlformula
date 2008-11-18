/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.layout.*;
import learnmath.mathml.formula.script.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.util.*;
import flash.geom.*;

class learnmath.mathml.MathML{
	
	var _xml:XML;
	var dE:DrawFormula;
		
	public function MathML(xml:XML){
		this._xml = xml;

		var node:XMLNode = _xml.childNodes[0];
		if(node.nodeName!=null && node.nodeName.toLowerCase().indexOf("math")>-1){
			var index:Number = 0;
			for(var i:Number =0; i<node.childNodes.length;i++){
				if(node.childNodes[i].nodeName!=null){
					index = i;
					break;
				}
			}
			node = node.childNodes[index];
		}else{
			var index:Number = 0;
			for(var i:Number =0; i<_xml.childNodes.length;i++){
				if(_xml.childNodes[i].nodeName!=null){
					index = i;
					break;
				}
			}
			node= _xml.childNodes[index];
		}
		
		var rootBox = loadNode(node, null);
		dE = new DrawFormula(rootBox);
	}
	
	public function drawFormula(graph:MovieClip, style:Style, start:Point):Rectangle{
		dE.clear(graph);
		return dE.draw(graph, style, start);
	}
	
	private function loadNode(node:XMLNode, parentBox:Box):Box{
		var name:String = node.nodeName.toLowerCase();
		var box:Box;
		if(name=='mrow'){
			box = loadMrow(node, parentBox);
		}else if(name=='mfenced'){
			box = loadMfenced(node, parentBox);
		}else if(name=='mphantom'){
			box = loadMPhantom(node, parentBox);
		}else if(name=='merror'){
			box = loadMError(node, parentBox);
		}else if(name=='mfrac'){
			box = loadMfrac(node, parentBox);
		}else if(name=='msqrt'){
			box = loadMSqrt(node, parentBox);
		}else if(name=='mroot'){
			box = loadMRoot(node, parentBox);
		}else if(name=='mover'){
			box = loadMOver(node, parentBox);
		}else if(name=='msup'){
			box = loadMSup(node, parentBox);
		}else if(name=='munder'){
			box = loadMUnder(node, parentBox);
		}else if(name=='msub'){
			box = loadMSub(node, parentBox);
		}else if(name=='msubsup'){
			box = loadMSubSup(node, parentBox);
		}else if(name=='munderover'){
			box = loadMUnderOver(node, parentBox);
		}else if(name=='mi'){
			box = loadMi(node, parentBox);
		}else if(name=='mn'){
			box = loadMn(node, parentBox);
		}else if(name=='mo'){
			box = loadMo(node, parentBox);
		}else if(name=='mtext'){
			box = loadMtext(node, parentBox);
		}else if(name=='mtable'){
			box = loadMTable(node, parentBox);
		}else if(name=='mtr'){
			box = loadMTr(node, parentBox);
		}else if(name=='mtd'){
			box = loadMTd(node, parentBox);
		}
		loadAttributes(node, box);
		
		return box;
	}
	
	private function loadAttributes(node:XMLNode, box:Box){
		if(node.attributes["color"]!=null){
			box.style.color = node.attributes["color"];
		}
		if(node.attributes["fontweight"]!=null){
			box.style.fontweight = node.attributes["fontweight"];
		}
		if(node.attributes["fontstyle"]!=null){
			box.style.fontstyle = node.attributes["fontstyle"];
		}
		if(node.attributes["fontsize"]!=null){
			box.style.size = int(node.attributes["fontsize"]);
		}
		if(node.attributes["fontfamily"]!=null){
			box.style.font = node.attributes["fontfamily"];
		}
	}
	
	private function loadMrow(node:XMLNode, parentBox:Box):Box{
		var nodeBox:RowBox = new RowBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				var child:Box = loadNode(node.childNodes[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		return nodeBox;
	}
	
	private function loadMTable(node:XMLNode, parentBox:Box):Box{
		var nodeBox:TableBox = new TableBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				if(node.childNodes[i].nodeName.toLowerCase()=="mtr"){
					var child:Box = loadNode(node.childNodes[i], nodeBox);
					nodeBox.addRow(child);
				}
			}
		}
		if(node.attributes["rowalign"]!=null){
			nodeBox.rowalign = StringUtil.trim(node.attributes["rowalign"]);
		}
		if(node.attributes["columnalign"]!=null){
			nodeBox.columnalign = StringUtil.trim(node.attributes["columnalign"]);
		}
		if(node.attributes["rowspacing"]!=null){
			nodeBox.rowspacing = Number(StringUtil.trim(node.attributes["rowspacing"]));
		}
		if(node.attributes["columnspacing"]!=null){
			nodeBox.columnspacing = Number(StringUtil.trim(node.attributes["columnspacing"]));
		}
		if(node.attributes["framespacing"]!=null){
			nodeBox.framespacing = Number(StringUtil.trim(node.attributes["framespacing"]));
		}
		
		return nodeBox;
	}
	

	private function loadMTr(node:XMLNode, parentBox:Box):Box{
		var nodeBox:TrBox = new TrBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				if(node.childNodes[i].nodeName.toLowerCase()=="mtd"){
					var child:Box = loadNode(node.childNodes[i], nodeBox);
					nodeBox.addTd(child);
				}
			}
		}
		if(node.attributes["rowalign"]!=null){
			nodeBox.rowalign = StringUtil.trim(node.attributes["rowalign"]);
		}
		if(node.attributes["columnalign"]!=null){
			nodeBox.columnalign = StringUtil.trim(node.attributes["columnalign"]);
		}
		return nodeBox;
	}


	private function loadMTd(node:XMLNode, parentBox:Box):Box{
		var nodeBox:TdBox = new TdBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				var child:Box = loadNode(node.childNodes[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		if(node.attributes["rowalign"]!=null){
			nodeBox.rowalign = StringUtil.trim(node.attributes["rowalign"]);
		}
		if(node.attributes["columnalign"]!=null){
			nodeBox.columnalign = StringUtil.trim(node.attributes["columnalign"]);
		}
		if(node.attributes["rowspan"]!=null){
			nodeBox.rowspan = Number(StringUtil.trim(node.attributes["rowspan"]));
		}
		if(node.attributes["columnspan"]!=null){
			nodeBox.columnspan = Number(StringUtil.trim(node.attributes["columnspan"]));
		}
		return nodeBox;
	}

	private function loadMfenced(node:XMLNode, parentBox:Box):Box{
		var nodeBox:FencedBox = new FencedBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				var child:Box = loadNode(node.childNodes[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		if(node.attributes["linethickness"]!=null){
			nodeBox.linethickness = int(node.attributes["linethickness"]);
		}
		if(node.attributes["open"]!=null){
			nodeBox.open = node.attributes["open"];
		}
		if(node.attributes["close"]!=null){
			nodeBox.close = node.attributes["close"];
		}
		return nodeBox;
	}
	
	private function loadMPhantom(node:XMLNode, parentBox:Box):Box{
		var nodeBox:PhantomBox = new PhantomBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				var child:Box = loadNode(node.childNodes[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		return nodeBox;
	}

	private function loadMError(node:XMLNode, parentBox:Box):Box{
		var nodeBox:ErrorBox = new ErrorBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				var child:Box = loadNode(node.childNodes[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		nodeBox.style.color = "#ff0000";
		return nodeBox;
	}

	private function loadMfrac(node:XMLNode, parentBox:Box):Box{
		var nodeBox:FracBox = new FracBox(parentBox);
		if(node.attributes["linethickness"]!=null){
			nodeBox.linethickness = int(node.attributes["linethickness"]);
		}
		if(node.attributes["bevelled"]!=null){
			nodeBox.bevelled = node.attributes["bevelled"];
		}
		var numNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.num = numNode;
		var denumNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.denum = denumNode;
		return nodeBox;
	}

	private function loadMSqrt(node:XMLNode, parentBox:Box):Box{
		var nodeBox:SqrtBox = new SqrtBox(parentBox);
		for(var i:Number =0; i<node.childNodes.length;i++){
			if(node.childNodes[i].nodeName!=null){
				var child:Box = loadNode(node.childNodes[i], nodeBox);
				nodeBox.addChild(child);
			}
		}
		if(node.attributes["linethickness"]!=null){
			nodeBox.linethickness = int(node.attributes["linethickness"]);
		}
		return nodeBox;
	}

	private function loadMRoot(node:XMLNode, parentBox:Box):Box{
		var nodeBox:RootBox = new RootBox(parentBox);
		var baseNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.index = expNode;
		if(node.attributes["linethickness"]!=null){
			nodeBox.linethickness = int(node.attributes["linethickness"]);
		}
		return nodeBox;
	}
	
	private function loadMSup(node:XMLNode, parentBox:Box):Box{
		var nodeBox:SupBox = new SupBox(parentBox);
		var baseNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}

	private function loadMOver(node:XMLNode, parentBox:Box):Box{
		var nodeBox:OverBox = new OverBox(parentBox);
		var baseNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}
	
	private function loadMSub(node:XMLNode, parentBox:Box):Box{
		var nodeBox:SubBox = new SubBox(parentBox);
		var baseNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.sub = expNode;
		return nodeBox;
	}

	private function loadMUnder(node:XMLNode, parentBox:Box):Box{
		var nodeBox:UnderBox = new UnderBox(parentBox);
		var baseNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.base = baseNode;
		var expNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.sub = expNode;
		return nodeBox;
	}

	private function loadMSubSup(node:XMLNode, parentBox:Box):Box{
		var nodeBox:SubSupBox = new SubSupBox(parentBox);
		var baseNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.base = baseNode;
		var subNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.sub = subNode;
		var expNode = loadNode(node.childNodes[2], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}

	private function loadMUnderOver(node:XMLNode, parentBox:Box):Box{
		var nodeBox:UnderOverBox = new UnderOverBox(parentBox);
		var baseNode = loadNode(node.childNodes[0], nodeBox);
		nodeBox.base = baseNode;
		var subNode = loadNode(node.childNodes[1], nodeBox);
		nodeBox.sub = subNode;
		var expNode = loadNode(node.childNodes[2], nodeBox);
		nodeBox.exp = expNode;
		return nodeBox;
	}

	private function loadMi(node:XMLNode, parentBox:Box):Box{
		var nodeBox:IBox = new IBox(parentBox);
		nodeBox.text = StringUtil.trim(node.childNodes[0].nodeValue);
		return nodeBox;
	}

	private function loadMo(node:XMLNode, parentBox:Box):Box{
		return OBox.getOBox(StringUtil.trim(node.childNodes[0].nodeValue), parentBox);
	}
	
	private function loadMtext(node:XMLNode, parentBox:Box):Box{
		var nodeBox:TBox = new TBox(parentBox);
		nodeBox.text = StringUtil.trim(node.childNodes[0].nodeValue);
		return nodeBox;
	}

	private function loadMn(node:XMLNode, parentBox:Box):Box{
		var nodeBox:NBox = new NBox(parentBox);
		nodeBox.number = StringUtil.trim(node.childNodes[0].nodeValue);
		return nodeBox;
	}
}