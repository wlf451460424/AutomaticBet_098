package com.xazc.comm
{
	import com.xazc.service.SendMessageService;
	import com.xazc.single.CurrentBusinessInfo;
	
	import mx.controls.Alert;
	
	/**
	 * 方法调用实现类 
	 * @author qu
	 * 
	 */	
	public class ServerToolImpl implements ServerTool
	{
		private var sendMessageService:SendMessageService;
		
		/**
		 * 用户登录 (加密)
		 */		
		public function userLogin(params:Object, resultHandler:Function = null, faultHandler:Function = null):void
		{
			trace("*****登录*****");
			sendMessageService = new SendMessageService();
			params.InterfaceName = "AddUserLoginLogNew";
			sendMessageService.sendMessage(CurrentBusinessInfo.serverUrl_net+"/manager/service.ashx",params,resultHandler,faultHandler,1);
		}
		/**
		 * 用户登录 (加密)
		 */		
		public function userLoginExit(params:Object, resultHandler:Function = null, faultHandler:Function = null):void
		{
			trace("*****登录*****");
			sendMessageService = new SendMessageService();
			params.InterfaceName = "AddUserLoginLog";
			sendMessageService.sendMessage(CurrentBusinessInfo.serverUrl_net+"/manager/service.ashx",params,resultHandler,faultHandler,1);
		}
		/**
		 * 获取用户金额  (加密)
		 */		
		public function getUserAllMoney(params:Object, resultHandler:Function = null, faultHandler:Function = null):void
		{
			trace("*****获取用户金额 *****");
			sendMessageService = new SendMessageService();
			params.InterfaceName = "GetUserAllMoney";
			sendMessageService.sendMessage(CurrentBusinessInfo.serverUrl_net+"/manager/service.ashx",params,resultHandler,faultHandler,1);
		}
		/**
		 * 投注
		 */
		public function userBet(params:Object, resultHandler:Function = null, faultHandler:Function = null):void{
			trace("*****投注*****");
			sendMessageService = new SendMessageService();
			//params.InterfaceName = "UserBet";
			params.InterfaceName = "UserBet20160412";
			sendMessageService.sendMessage(CurrentBusinessInfo.serverUrl_net+"/manager/service.ashx",params,resultHandler,faultHandler,1);
		}
		/**
		 * 获取上期开奖结果 
		 */		
		public function getLastResult(params:Object, resultHandler:Function = null, faultHandler:Function = null):void
		{
			trace("*****获取上期开奖结果*****");
			sendMessageService = new SendMessageService();
			params.InterfaceName = "GetHisNumber";
			sendMessageService.sendMessage(CurrentBusinessInfo.serverUrl_net+"/manager/GetHisNumber.ashx",params,resultHandler,faultHandler);
		}
		
		/**
		 * 获取当前可售期号信息
		 */
		public function getCurrLotteryIssue(params:Object, resultHandler:Function=null, faultHandler:Function=null):void
		{
			trace("*****获取当前可售期号信息*****");
			sendMessageService = new SendMessageService();
			params.InterfaceName = "GetCurrLotteryIssue";
			sendMessageService.sendMessage(CurrentBusinessInfo.serverUrl_net+"/manager/service.ashx",params,resultHandler,faultHandler);
			
			
		}
	}
}