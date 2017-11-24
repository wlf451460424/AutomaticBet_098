package com.xazc.single
{
	import mx.collections.ArrayCollection;

	public class PlaytypeAndPlaynameBase
	{
		public function PlaytypeAndPlaynameBase()
		{
		}
		//随机出号101，玩法和id
		public static var  provinceCity:String='[{"id":"4","text":"五星","city":[{"id":"01_3","text":"直选单式","tip":"12345"},{"id":"01_0","text":"直选复式","tip":"12345"}]},' +
			'{"id":"10","text":"前四","city":[{"id":"30_3","text":"直选单式","tip":"1234"},{"id":"30_0","text":"直选复式","tip":"1234"}]},' +
			'{"id":"11","text":"后四","city":[{"id":"32_3","text":"直选单式","tip":"1234"},{"id":"32_0","text":"直选复式","tip":"1234"}]},' +
			'{"id":"7","text":"前三","city":[{"id":"12_3","text":"直选单式","tip":"123"},{"id":"12_0","text":"直选复式","tip":"123"},{"id":"14_0","text":"组三复式","tip":"12"},{"id":"15_0","text":"组六复式","tip":"123"}]},' +
			'{"id":"8","text":"中三","city":[{"id":"25_3","text":"直选单式","tip":"123"},{"id":"25_0","text":"直选复式","tip":"123"},{"id":"27_0","text":"组三复式","tip":"12"},{"id":"28_0","text":"组六复式","tip":"123"}]},' +
			'{"id":"9","text":"后三","city":[{"id":"03_3","text":"直选单式","tip":"123"},{"id":"03_0","text":"直选复式","tip":"123"},{"id":"05_0","text":"组三复式","tip":"12"},{"id":"06_0","text":"组六复式","tip":"123"}]},' +
			'{"id":"5","text":"前二","city":[{"id":"18_3","text":"直选单式","tip":"12"},{"id":"18_0","text":"直选复式","tip":"12"}]},' +
			'{"id":"6","text":"后二","city":[{"id":"07_3","text":"直选单式","tip":"12"},{"id":"07_0","text":"直选复式","tip":"12"}]},' +
			'{"id":"1","text":"定位胆","city":[{"id":"10_5","text":"万位","tip":"1"},{"id":"10_4","text":"千位","tip":"1"},{"id":"10_3","text":"百位","tip":"1"},{"id":"10_2","text":"十位","tip":"1"},{"id":"10_1","text":"个位","tip":"1"}]},' +
			'{"id":"2","text":"任二","city":[{"id":"37_3","text":"直选单式","tip":"12"},{"id":"37_0","text":"直选复式","tip":"12"}]},' +
			'{"id":"3","text":"任三","city":[{"id":"38_3","text":"直选单式","tip":"123"},{"id":"38_0","text":"直选复式","tip":"123"}]},' +
			'{"id":"4","text":"任四","city":[{"id":"65_3","text":"直选单式","tip":"1234"},{"id":"65_0","text":"直选复式","tip":"1234"}]},' +
			'{"id":"4","text":"五星","city":[{"id":"01_3","text":"直选单式","tip":"12345"},{"id":"01_0","text":"直选复式","tip":"12345"}]}]';
		
		//开某投某102 结果对应的内容
		public static var betType:ArrayCollection = new ArrayCollection([
			{resultNum:"0",zhengContent:"0,1,2,3,4",fanContent:"0,9,8,7,6"}, 
			{resultNum:"1",zhengContent:"1,2,3,4,5",fanContent:"1,0,9,8,7"}, 
			{resultNum:"2",zhengContent:"2,3,4,5,6",fanContent:"2,1,0,9,8"}, 
			{resultNum:"3",zhengContent:"3,4,5,6,7",fanContent:"3,2,1,0,9"}, 
			{resultNum:"4",zhengContent:"4,5,6,7,8",fanContent:"4,3,2,1,0"}, 
			{resultNum:"5",zhengContent:"5,6,7,8,9",fanContent:"5,4,3,2,1"}, 
			{resultNum:"6",zhengContent:"6,7,8,9,0",fanContent:"6,5,4,3,2"}, 
			{resultNum:"7",zhengContent:"7,8,9,0,1",fanContent:"7,6,5,4,3"}, 
			{resultNum:"8",zhengContent:"8,9,0,1,2",fanContent:"8,7,6,5,4"}, 
			{resultNum:"9",zhengContent:"9,8,7,6,5",fanContent:"9,8,7,6,5"}, 
		]);
	}
}