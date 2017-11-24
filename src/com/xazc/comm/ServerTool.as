package com.xazc.comm
{
	/**
	 * Http请求服务端交互方法接口 
	 * @author qu
	 * 
	 */	
	public interface ServerTool
	{
		/**
		 * 用户登录 
		 */		
		function userLogin(params:Object, resultHandler:Function = null, faultHandler:Function = null):void;
		/**
		 * 用户登录 
		 */		
		function userLoginExit(params:Object, resultHandler:Function = null, faultHandler:Function = null):void;
		/**
		 * 获取用户金额 
		 */
		function getUserAllMoney(params:Object, resultHandler:Function = null, faultHandler:Function = null):void;
		/**
		 * 投注
		 */
		function userBet(params:Object, resultHandler:Function = null, faultHandler:Function = null):void;
		/**
		 * 获取上期开奖结果 
		 */		
		function getLastResult(params:Object, resultHandler:Function = null, faultHandler:Function = null):void;
		/**
		 * 获取当前可售期号信息
		 */		
		function getCurrLotteryIssue(params:Object, resultHandler:Function = null, faultHandler:Function = null):void;
		
	}
}