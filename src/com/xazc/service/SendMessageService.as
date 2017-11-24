package com.xazc.service
{
	
	import com.hurlant.CryptoUtil;
	import com.xazc.single.CurrentBusinessInfo;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class SendMessageService
	{
		private var httpService:HTTPService;
		
		private var request:URLRequest;
		
		private var loader:URLLoader;
		
		
		private static var _instance:SendMessageService;
		
		public function SendMessageService()
		{
		}
		
		public static function getInstance():SendMessageService
		{
			return _instance ||= new SendMessageService();
		}
		
		public function send(issusUrl:String, params:Object, resultHandler:Function = null, faultHandler:Function = null):void
		{
			if(!httpService)
				httpService = new HTTPService();
			httpService.url = issusUrl;
			httpService.method = "POST";
			httpService.resultFormat = "object";
			httpService.addEventListener(ResultEvent.RESULT, resultHandler);
			if(faultHandler != null)
				httpService.addEventListener(FaultEvent.FAULT, faultHandler);
			httpService.send(params);
		}
		public function sendMessage(issusUrl:String, params:Object, resultHandler:Function = null, faultHandler:Function = null,desType:int = 0):void
		{
			//添加平台编号
			params.ProjectPublic_PlatformCode = 3;
			var obj:Object = new Object();
			trace(JSON.stringify(params));
			if(0==desType){
				obj.message = JSON.stringify(params);
			}else{
				obj.message = JSON.stringify(params);
				obj.message = CryptoUtil.DESEncrypt(obj.message,CurrentBusinessInfo.desKey1,CurrentBusinessInfo.desKey2);
			}
			trace(obj.message);
			if(!httpService)
				httpService = new HTTPService();
			httpService.url = issusUrl;
			httpService.method = "POST";
			httpService.resultFormat = "object";
			httpService.addEventListener(ResultEvent.RESULT, resultHandler);
			if(faultHandler != null)
				httpService.addEventListener(FaultEvent.FAULT, faultHandler);
			httpService.send(obj);
		}
		
		public function sendRequestMessage(issusUrl:String,params:Object,resultRequestHandler:Function=null,errorRequestHandler:Function=null):void{
			
			//添加平台编号
			params.ProjectPublic_PlatformCode = 3;
			var obj:Object = new Object();
			if(!request){
				request=new URLRequest();
			}
			if(!loader){
				loader=new URLLoader();
			}
			var vars:URLVariables= new URLVariables();
			vars["message"]= JSON.stringify(params);
			request.data=vars;
			request.method = URLRequestMethod.POST;
			request.url=issusUrl;
			loader.load(request);
			loader.addEventListener(Event.COMPLETE,resultRequestHandler);
			if(errorRequestHandler !=null){
				loader.addEventListener(IOErrorEvent.IO_ERROR,errorRequestHandler);
			}
		}
		
		public function removeResultHandlerFun(resultHandler:Function = null):void
		{
			httpService.removeEventListener(ResultEvent.RESULT, resultHandler);
		}
		
		public function removeErrorHandlerFun(faultHandler:Function = null):void
		{
			httpService.removeEventListener(FaultEvent.FAULT, faultHandler);
		}
	}
}