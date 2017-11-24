package com.xazc.manager
{
	
	import com.xazc.event.CustomEvent;
	import com.xazc.single.Util;
	
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	/**
	 * 计时器管理器 <br/>
	 * - 项目唯一使用的秒计时器;<br/>
	 * - 完整的单例模式;<br/>
	 * - 提供带密码的加锁、解锁功能，避免被篡改;<br/>
	 * @author zhonghao
	 */
	public class TimerManager extends Timer
	{
		public static var CUSTOM_TIMER:String = "customTimer"
		
		private static var _instance:TimerManager;
		
		private var _pwd:String;			// 密码
		private var _lock:Boolean;			// 是否加锁
		
		private var _timeCount:uint = 0;	// 计时数
		private var _now:uint = 0;			// 当前时间
		
		private var gcDelay:int = 10;
		private var gcCount:int = 0;
		
		private var timeCount15Seconds:int = 0;
		private var timeCount8Seconds:int = 0;
		
		public function TimerManager(single:MySingleton)
		{
			super(250);
			this.addEventListener(TimerEvent.TIMER, timerHandler);
		}
		
		public static function getInstance():TimerManager
		{
			if(_instance == null)
			{
				_instance = new TimerManager(new MySingleton());
			}
			return _instance;
		}
		
		private function timerHandler(event:TimerEvent):void
		{
			_now = getTimer();
			var delay:int = _now - _timeCount;
			timeCount15Seconds += 250;
			timeCount8Seconds += 250;
			//每隔15秒发出事件
			if(timeCount15Seconds == 15000)
			{
				dispatchEvent(new CustomEvent(CustomEvent.SPACE_15SECONDES));
				timeCount15Seconds = 0;
			}
			//每隔8秒发出事件
			if(timeCount8Seconds == 8000)
			{
				dispatchEvent(new CustomEvent(CustomEvent.SPACE_8SECONDES));
				timeCount8Seconds = 0;
			}
			
			if(delay >= 1000)
			{
				var count:int = int(delay / 1000);
				_timeCount += count * 1000;
				
				dispatchEvent(new CustomEvent(CUSTOM_TIMER, count));
				
				gcCount += count;
				if(gcCount >= gcDelay)
				{
					gcCount -= gcDelay;
					System.gc();
					//					trace("System GC");
				}
			}
		}
		
		/**
		 * 加锁
		 */
		public function lock(pwd:String):void
		{
			if(_lock)
			{
				//throw new Error("TimerManager Error: You can`t lock a locked Timer!");
			}
			else
			{
				_lock = true;
				_pwd = pwd;
			}
		}
		/**
		 * 解锁
		 */
		public function unlock(pwd:String):void
		{
			if(_lock)
			{
				if(_pwd == pwd)
				{
					_lock = false;
				}	
				else
				{
					//throw new Error("TimerManager Error: Wrong Password");
				}	
			}
			else
			{
				//throw new Error("TimerManager Error: You can`t unlock a unlocked Timer!");
			}
		}
		
		override public function start():void
		{
			if(_lock)
			{
				//throw new Error("TimerManager Error: You can do no operation while locked!");
			}
			else
			{
				_timeCount = getTimer();
				_now = getTimer();
				timeCount15Seconds = 0;
				super.start();
			}
		}
		
		override public function stop():void
		{
			if(_lock)
			{
				throw new Error("TimerManager Error: You can do no operation while locked!");
			}
			else
			{
				timeCount15Seconds = 0;
				super.stop();
			}
		}
		
		override public function reset():void
		{
			if(_lock)
			{
				throw new Error("TimerManager Error: You can do no operation while locked!");
			}
			else
			{
				super.reset();	
			}
		}
		
		override public function set delay(value:Number):void
		{
			if(_lock)
			{
				throw new Error("TimerManager Error: You can do no operation while locked!");
			}
			else
			{
				super.delay = value;
			}
		}
		
		override public function set repeatCount(value:int):void
		{
			if(_lock)
			{
				throw new Error("TimerManager Error: You can do no operation while locked!");
			}
			else
			{
				super.repeatCount = value;
			}
		}
	}
}

class MySingleton{}