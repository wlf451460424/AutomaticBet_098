package com.xazc.single
{
	import mx.collections.ArrayCollection;

	/**
	 * 当前用户信息 
	 * @author qu
	 * 
	 */	
	public class CurrentUserInfo
	{
		public function CurrentUserInfo()
		{
			
		}
		
		//判断用户是否已经登录
		[Bindable]
		public static var isLogined:Boolean = false;
		
		//登录用户名
		[Bindable]
		public static var userName:String = "";
		
		//登录密码
		[Bindable]
		public static var userPassWord:String = "";
		
		//彩票平台购彩余额
		[Bindable]
		public static var userCPBalance:String = "0.0000" ;
		
		//彩票平台购彩锁定余额
		[Bindable]
		public static var userCPLockedBalance:String = "0.0000";
		
		//当前选择的彩种ID
		[Bindable]
		public static var lottreyID:String = "";
		//我的返点
		[Bindable]
		public static var MyRebate:String;
		//当前选择的彩种name
		[Bindable]
		public static var lottreyName:String = "";
		
		//当前期号
		[Bindable]
		public static var IssueNumber:String="";
		
		//上期开奖结果
		[Bindable]
		public static var Last_result:String;
		
		//方案类别
		[Bindable]
		public static var platTypeArrayList:ArrayCollection = new ArrayCollection([
			{name:"方案1",type:"随机出号",value:"101",palytype:"直选单式【五星】"}, 
			{name:"方案2",type:"高级开某投某",value:"102",palytype:"万位【定位胆】"},
			{name:"方案3",type:"冷热温出号",value:"103",palytype:"万位【定位胆】"}, 
			{name:"方案4",type:"定码轮换",value:"104",palytype:"直选单式【五星】"},
//			{name:"方案4",type:"高级开某投某",palytype:"组三复式【前三】"},
		]);
		
		//--方案类别-detail
		public static var plantType:ArrayCollection = new ArrayCollection([
						{type:"随机出号",value:"101"}, 
						{type:"高级开某投某",value:"102"}, 
						{type:"冷热温出号",value:"103"},
						{type:"定码轮换",value:"104"},
		]);
		
		//投注模式--圆角分厘
		public static var betType:ArrayCollection = new ArrayCollection([
			{type:"圆",value:"12"}, 
			{type:"角",value:"12"},
			{type:"分",value:"12"},
			{type:"厘",value:"12"},
		]);
		
		//方案类别--玩法类别
		public static var playName:ArrayCollection = new ArrayCollection([
			{type:"万位【定位胆】",value:"10_5"}, 
			{type:"千位【定位胆】",value:"10_4"}, 
			{type:"百位【定位胆】",value:"10_3"}, 
			{type:"十位【定位胆】",value:"10_2"}, 
			{type:"个位【定位胆】",value:"10_1"}, 
			{type:"直选复式【任二】 ",value:"37_0"}, 
			{type:"直选单式【任二】 ",value:"37_3"}, 
			{type:"直选复式【任三】",value:"38_0"}, 
			{type:"直选单式【任三】",value:"38_3"}, 
			{type:"直选复式【任四】",value:"65_0"}, 
			{type:"直选单式【任四】",value:"65_3"}, 
			{type:"直选复式【五星】",value:"01_0"},
			{type:"直选单式【五星】",value:"01_3"},
			{type:"直选复式【前四】",value:"30_0"}, 
			{type:"直选单式【前四】",value:"30_3"}, 
			{type:"直选复式【后四】",value:"32_0"}, 
			{type:"直选单式【后四】",value:"32_3"}, 
			{type:"直选复式【前二】",value:"18_0"}, 
			{type:"直选单式【前二】",value:"18_3"}, 
			{type:"直选复式【后二】",value:"07_0"}, 
			{type:"直选单式【后二】",value:"07_3"}, 
			{type:"直选复式【前三】",value:"12_0"},
			{type:"直选单式【前三】",value:"12_3"}, 
			{type:"组三复式【前三】",value:"14_0"}, 
			{type:"组六复式【前三】",value:"15_0"}, 
			
			{type:"直选复式【后三】",value:"03_0"}, 
			{type:"直选单式【后三】",value:"03_3"}, 
			{type:"组三复式【前三】",value:"27_0"}, 
			{type:"组六复式【前三】",value:"28_0"},
			
			{type:"直选复式【中三】",value:"25_0"}, 
			{type:"直选单式【中三】",value:"25_3"}, 
			{type:"组三复式【中三】",value:"05_0"},
			{type:"组六复式【中三】",value:"06_0"},
		]);
		
		//方案类别     投注模式--圆角分厘
		[Bindable]
		public static var plantDetailArrayList:ArrayCollection = new ArrayCollection([
			{plantIndex:"1",plantType:0,//方案序号；方案索引；
				playType:0,playName:0,mode:0,moshi:0,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,//玩法类型；玩法名称；复式单式；圆角分模式；开某投某的选择记录；开某投某是正投还是反投；
				zhushu:1,zhushu_suiji:1,betContent:"1|2|3|4|5",showContent:"12345",//注数；输入的随机注数；投注内容；显示内容；
				beishu:"1,2,4,8,16,32,64,128,256,512",wanfa:"01_3"//倍数；玩法mark;
			},//随机出号方案；
			{plantIndex:"1",plantType:1,
				playType:0,playName:0,mode:0,moshi:1,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,
				zhushu:5,zhushu_suiji:5,betContent:"0,1,2,3,4|*|*|*|*",showContent:"0,1,2,3,4|*|*|*|*",
				beishu:"1,2,4,8,16,32,64,128,256,512",wanfa:"10_5"
			},//高级开某投某
			{plantIndex:"1",plantType:2,//方案序号；方案索引；
				playType:0,playName:0,mode:0,moshi:1,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,//玩法类型；玩法名称；复式单式；圆角分模式；
				zhushu:1,zhushu_suiji:1,betContent:"1|*|*|*|*",showContent:"1|*|*|*|*",//注数；输入的随机注数；投注内容；显示内容；
				beishu:"1,2,4,8,16,32,64,128,256,512",wanfa:"10_5"//倍数；玩法mark;
			},//冷热温出号
			{plantIndex:"1",plantType:3,//方案序号；方案索引；
				playType:0,playName:0,mode:0,moshi:1,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,//玩法类型；玩法名称；复式单式；圆角分模式；
				zhushu:1,zhushu_suiji:1,betContent:"1|2|3|4|5",showContent:"12345",//注数；输入的随机注数；投注内容；显示内容；
				beishu:"1,2,4,8,16,32,64,128,256,512",wanfa:"01_3"//倍数；玩法mark;
			},//定码轮换
			
		]);
		//方案类别切换  默认初始值 ;  初始化都定位在：定位胆万位玩法上。
		[Bindable]
		public static var plantDetailArrayList_default:ArrayCollection = new ArrayCollection([
			{plantIndex:"1",plantType:0,
				playType:0,playName:0,mode:0,moshi:1,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,
				zhushu:1,zhushu_suiji:1,betContent:"1|2|3|4|5",showContent:"12345",
				beishu:"1,2,4,8,16,32,64,128,256,512",
				wanfa:"01_3"},//随机出号方案；
			{plantIndex:"1",plantType:1,
				playType:0,playName:0,mode:0,moshi:1,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,
				zhushu:5,zhushu_suiji:5,betContent:"0,1,2,3,4|*|*|*|*",showContent:"0,1,2,3,4|*|*|*|*",
				beishu:"1,2,4,8,16,32,64,128,256,512",
				wanfa:"10_5"},//高级开某投某
			{plantIndex:"1",plantType:2,
				playType:0,playName:0,mode:0,moshi:1,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,
				zhushu:1,zhushu_suiji:1,betContent:"1|*|*|*|*",showContent:"1|*|*|*|*",
				beishu:"1,2,4,8,16,32,64,128,256,512",
				wanfa:"10_5"},//冷热温出号
			{plantIndex:"1",plantType:3,
				playType:0,playName:0,mode:0,moshi:1,result_isSelected:[1,1,1,1,1,1,1,1,1,1],touzhu_mode:0,
				zhushu:1,zhushu_suiji:1,betContent:"1|2|3|4|5",showContent:"12345",
				beishu:"1,2,4,8,16,32,64,128,256,512",
				wanfa:"10_5"},//定码轮换
		]);
		
		//保存历史开奖结果，在后面统计的时候，可以快速的处理完显示出来；
		public static var histroyResult_List:Array = new Array();
	}
}