package com.xazc.single
{
	import mx.collections.ArrayCollection;

	/**
	 * 当前商户配置信息 
	 * @author qu
	 * 
	 */	
	public class CurrentBusinessInfo
	{
		public function CurrentBusinessInfo()
		{
		}
		//Des加密key1值
		public static  var desKey1:String = "X2E5X8SY";
		//Des加密key2值
		public static  var desKey2:String = "5BCEVJIO";
		
		//期号服务器连接
		public static var issueUrl:String = '';
		//期号服务器连接（自有）
		public static var issueUrl2:String = '';
		//java前台服务器连接
		public static var serverUrl:String = '';
		//.net前台服务器连接
		public static var serverUrl_net:String = 'http://192.168.1.55';
		//客户端项目更新检测路径
		public static  var updateUrl:String = '';
		//注册地址
		public static  var registerUrl:String = '';
		
		//平台选择
		public static var platArrayList:ArrayCollection = new ArrayCollection([
			{type:"在线娱乐——1",value:"0"}, 
			{type:"在线娱乐——2",value:"1"},
			{type:"在线娱乐——3",value:"2"},
		]);
		
		//彩种配置
		public static var lottreyArrayList:ArrayCollection = new ArrayCollection([
			{name:"巴西1.5分彩",value:"51"}, 
			{name:"菲律宾1.5分彩",value:"66"},
			{name:"重庆时时彩",value:"12"},
			{name:"QQ分分彩",value:"58"},
			{name:"新疆时时彩",value:"14"},
		]);
	}
}