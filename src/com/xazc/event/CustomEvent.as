package com.xazc.event
{
	import flash.events.Event;
	
	/**
	 * 用户自定义事件
	 * - 你可以添加一个任意类型的用户参数(body)随着事件转发
	 */
	public class CustomEvent extends Event
	{	
		private var _body:Object;
		
		//清空号码 ，切换时发送gameID
		public static const COUNT_ZERO:String = "count_zero";
		//发送一行号码
		public static const GET_NUMBERS:String = "get_numbers";
		//发送百位号码
		public static const BAIWEI_NUMBERS:String = "baiwei_numbers";
		//发送十位号码
		public static const SHIWEI_NUMBERS:String = "shiwei_numbers";
		//发送个位号码
		public static const GEWEI_NUMBERS:String = "gewei_numbers";
		//发送粘贴号码
		public static const STICK_NUMBERS:String = "stick_numbers";
		
		public static const SPACE_15SECONDES:String = "space15Seconds";
		
		public static const SPACE_8SECONDES:String = "space8Seconds";
		
		//弹出提示框事件
		public static const SHOW_LAST_BET_RESULT:String  = "showLastBetResult";
		
		//显示最新开奖结果列表
		public static const CHANGE_RESULT_LISTS:String = "changeResultLists";
		//显示最新开奖结果列表(龙虎位数)
		public static const LONGHU_CHANGE_RESULT_LISTS:String = "longhuchangeResultLists";
		/**开奖成功播放开奖动画开始*/
		public static const STARTPLAYLOTTERYANIMATION:String = "startPlaylotteryAnimation";
		/**开奖成功播放开奖动画结束*/
		public static const ENDPLAYLOTTERYANIMATION:String = "endPlaylotteryAnimation";
		/**获取开奖链表播放开奖动画*/
		public static const GETBETLISTGOTOPLAYLOTTERYANIMATION:String = "getBetListGoToPlayLotteryAnimation";
		/**
		 *下级返点修改成功数据跟新 
		 */		
		public static const SETUSERREBATESUCCESS:String = "setuserrebatesuccess";
		
		/**
		 *	追号确认 
		 */		
		public static const BETTING_APPENDNUM_SUBMIT:String = "bettingAppendNumSubmit";
		/**
		 *	添加选号
		 */		
		public static const ADD_BETNUM_BTNCLICK:String = "add_betnum_btnclick";
		/**
		 *	撤单
		 */		
		public static const REPEAL_BET_LIST:String = "repeal_bet_list";
		/**
		 *	投注金额 
		 */		
		public static const BETTING_TOTALMONEY:String = "bettingTotalMoney";
		
		/**
		 *	追号修改 
		 */		
		public static const BETTING_APPENDNUM_CHANGE:String = "bettingAppendNumChange";
		
		/**
		 *	关闭 
		 */		
		public static const BETTING_APPENDNUM_CLOSE:String = "bettingAppendNumClose";
		public static const MODULE_UNLOAD:String = "moduleUnLoad";
		
		
		//发送站内信  添加用户
		public static const ADDUSERNAME_MSSAGE:String  = "addUserNameMssage";
		//收件箱  点击未读  获取详情之后  关闭详情页  刷新收件箱状态！
		public static const INMSSAGE_STATUS:String  = "updateInMessageStatus";
		
		//分红契约 结算成功后  关闭结算弹窗  刷新分红契约列表！
		public static const UPDATE_DIVIDENDCONTRACT_LIST:String  = "updateDividendContract";
		
		public function CustomEvent(type:String, body:Object = null, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_body = body;
		}
		
		/**
		 * 获取事件携带的用户参数
		 * - 请在监听端进行类型转换及处理 
		 */
		public function get body():Object
		{
			return _body;
		}
		
		/**
		 * 克隆函数 
		 */
		override public function clone():Event
		{
			return new CustomEvent(type, body, bubbles, cancelable);
		}
		
		/**
		 * 字符串化函数 
		 */
		override public function toString():String
		{
			return formatToString("CustomEvent", "type", "body", "bubbles", "cancelable");
		}
	}
}