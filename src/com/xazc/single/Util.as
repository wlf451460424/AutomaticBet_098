package com.xazc.single
{
	import com.hurlant.CryptoUtil;
	
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	import mx.events.ToolTipEvent;
	
	public class Util extends EventDispatcher
	{
		private static var _instance:Util;
		
		public function Util()
		{
		}
		
		public static function getInstance():Util
		{
			return _instance ||= new Util();
		}
		public function resuleFormatToJSon(resultString:String,desType:int=0):Object
		{
			//JSON.parse(resultString,null)
			var temp:Object;
			if(0==desType){//不加密解密
				temp = new Object;
				temp = JSON.parse(resultString,null);
			}else{//解密
				temp = new Object;
				trace(CryptoUtil.DESDecrypt(resultString,CurrentBusinessInfo.desKey1,CurrentBusinessInfo.desKey2));
				temp =JSON.parse(CryptoUtil.DESDecrypt(resultString,CurrentBusinessInfo.desKey1,CurrentBusinessInfo.desKey2),null);
			}
			
			return temp;
		}
		
		//生成投注内容  (随机出号方案，生成随机号码)
		public function produced_BetContent(playtypeId:String,zhushu:int,random_obj:Object):Object
		{
			var temp:Object = new Object();
			var game_id:String = playtypeId.split("_")[0];//玩法id
			var game_type:String = playtypeId.split("_")[1];//玩法type
			
			var numArr:Array;
			
			//如果要创建一个从x到y的随机数，就可以这样写
			//Math.round(Math.random()*(y-x))+x;
			
			switch(game_id)
			{
				case "10"://一星（定位胆）
					if(zhushu>10)zhushu = 10;
					//根据注数，先生成号码；
					numArr = new Array();
					while(numArr.length<zhushu){
						var a:int = Math.round(Math.random()*9);
						if(numArr.indexOf(a)==-1)numArr.push(a);
					}
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+",";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					if(game_type=="5")temp.BetContent = str + "|*|*|*|*";
					if(game_type=="4")temp.BetContent = "*|" + str +"|*|*|*";
					if(game_type=="3")temp.BetContent = "*|*|" + str +"|*|*";
					if(game_type=="2")temp.BetContent = "*|*|*|" + str +"|*";
					if(game_type=="1")temp.BetContent = "*|*|*|*|" + str;
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /,/g; 
					temp.ShowContent = str.replace(myPattern,"  ");
					temp.zhushu=zhushu;
					break;
				case "01"://五星
					//单式
					if(game_type=="3"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							for(var i:int=0;i<5;i++){
								var a:int = Math.round(Math.random()*9);
								obj += a;}
							numArr.push(obj);
						}
					}
					//复式
					if(game_type=="0"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							for(var i:int=0;i<5;i++){
								var a:int = Math.round(Math.random()*9);
								if(i != 4)obj += a+"|";
								else obj += a;}
							numArr.push(obj);
						}
					}
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					temp.BetContent = str;
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.ShowContent = str.replace(myPattern,"  ");
					break;
				case "32"://后四
				case "30"://前四
					//单式和复式内容格式一样，一并操作，值区分BetMode
					//根据注数，先生成号码；
					numArr = new Array();
					while(numArr.length<zhushu){
						var obj:String = new String();
						for(var i:int=0;i<4;i++){
							var a:int = Math.round(Math.random()*9);
							if(i != 3)obj += a+"|";
							else obj += a;}
						numArr.push(obj);
					}
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					temp.BetContent = str;
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern_1:RegExp = /\|/g; 
					if(game_type=="3"){str = str.replace(myPattern_1,"")}//单式
					var myPattern:RegExp = /#/g; 
					temp.ShowContent = str.replace(myPattern,"  ");
					
					break;
				case "03"://后三单式和复式
				case "12"://前三单式和复式
				case "25"://中三单式和复式
					//单式和复式内容格式一样，一并操作，值区分BetMode
					//根据注数，先生成号码；
					numArr = new Array();
					while(numArr.length<zhushu){
						var obj:String = new String();
						for(var i:int=0;i<3;i++){
							var a:int = Math.round(Math.random()*9);
							if(i != 2)obj += a+"|";
							else obj += a;}
						numArr.push(obj);
					}
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					temp.BetContent = str;
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern_1:RegExp = /\|/g; 
					if(game_type=="3"){str = str.replace(myPattern_1,"")}//单式
					var myPattern:RegExp = /#/g; 
					temp.ShowContent = str.replace(myPattern,"  ");
					break;
				case "05"://后三组三复式
				case "14"://前三组三复式
				case "27"://中三组三复式
					//根据注数，先生成号码；
					numArr = new Array();
					while(numArr.length<zhushu){
						var obj:String = new String();
						var arr_1:Array=["0","1","2","3","4","5","6","7","8","9"];
						var index:int = Math.round(Math.random()*(arr_1.length-1));
						var b:String=arr_1[index];
						arr_1.splice(index,1);
						var bb:String = arr_1[Math.round(Math.random()*(arr_1.length-1))];
						obj = b+","+bb;
						numArr.push(obj);
					}
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					temp.BetContent = str;
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.ShowContent = str.replace(myPattern,"  ");
					break;
				case "06"://后三组六复式
				case "15"://前三组六复式
				case "28"://中三组六复式
					//根据注数，先生成号码；
					numArr = new Array();
					while(numArr.length<zhushu){
						var obj:String = new String();
						var arr_1:Array = ["0","1","2","3","4","5","6","7","8","9"];
						var index_1:int = Math.round(Math.random()*(arr_1.length-1));
						var b:String = arr_1[index_1];
						arr_1.splice(index_1,1);
						var index_2:int = Math.round(Math.random()*(arr_1.length-1));
						var bb:String = arr_1[index_2];
						arr_1.splice(index_2,1);
						var index_3:int = Math.round(Math.random()*(arr_1.length-1));
						var bbb:String = arr_1[index_3];
						arr_1.splice(index_3,1);
						obj = b+","+bb+","+bbb;
						numArr.push(obj);
					}
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					temp.BetContent = str;
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.ShowContent = str.replace(myPattern,"  ");
					break;
				case "07"://后二
				case "18"://前二
					//单式和复式内容格式一样，一并操作，值区分BetMode
					//根据注数，先生成号码；
					numArr = new Array();
					while(numArr.length<zhushu){
						var obj:String = new String();
						for(var i:int=0;i<2;i++){
							var a:int = Math.round(Math.random()*9);
							if(i != 1)obj += a+"|";
							else obj += a;}
						numArr.push(obj);
					}
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					temp.BetContent = str;
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern_1:RegExp = /\|/g; 
					if(game_type=="3"){str = str.replace(myPattern_1,"")}//单式
					var myPattern:RegExp = /#/g; 
					temp.ShowContent = str.replace(myPattern,"  ");
					break;
				case "37"://任二
					if(random_obj.num<2){
						temp.BetContent = "";
						temp.ShowContent = "";
						temp.zhushu = "";
						break;
					}
					//复式
					if(game_type=="0"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							var obj_geshi:String = random_obj.geshi;//保存格式，防止一次修改后，每次重复
							for(var i:int=0;i<random_obj.num;i++){
								var aa:String = (Math.round(Math.random()*9)).toString();
								obj_geshi = obj_geshi.replace("^",aa);}
							numArr.push(obj_geshi);
						}
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						temp.BetContent = str;
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.ShowContent = str.replace(myPattern,"  ");
						
						//特殊处理，计算煮熟
						if(random_obj.num == 2)temp.zhushu=1*zhushu;
						if(random_obj.num == 3)temp.zhushu=3*zhushu;
						if(random_obj.num == 4)temp.zhushu=6*zhushu;
						if(random_obj.num == 5)temp.zhushu=10*zhushu;
					}
					//单式
					if(game_type=="3"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							for(var i:int=0;i<2;i++){
								var a:int = Math.round(Math.random()*9);
								if(i != 1)obj += a+",";
								else obj += a;}
							obj += "$" +random_obj.geshi;
							numArr.push(obj);
						}
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						var myPattern_0:RegExp = /万/g;
						var myPattern_1:RegExp = /千/g;
						var myPattern_2:RegExp = /百/g;
						var myPattern_3:RegExp = /十/g;
						var myPattern_4:RegExp = /个/g;
						var new_str:String = str;
						new_str = new_str.replace(myPattern_0,"0");
						new_str = new_str.replace(myPattern_1,"1");
						new_str = new_str.replace(myPattern_2,"2");
						new_str = new_str.replace(myPattern_3,"3");
						new_str = new_str.replace(myPattern_4,"4");
						temp.BetContent = new_str;
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.ShowContent = str.replace(myPattern,"  ");
						
						//特殊处理，计算煮熟
						if(random_obj.num == 2)temp.zhushu=1*zhushu;
						if(random_obj.num == 3)temp.zhushu=3*zhushu;
						if(random_obj.num == 4)temp.zhushu=6*zhushu;
						if(random_obj.num == 5)temp.zhushu=10*zhushu;
					}
					break;
				case "65"://任四
					if(random_obj.num<4){
						temp.BetContent = "";
						temp.ShowContent = "";
						temp.zhushu = "";
						break;
					}
					//复式
					if(game_type=="0"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							var obj_geshi:String = random_obj.geshi;//保存格式，防止一次修改后，每次重复
							for(var i:int=0;i<random_obj.num;i++){
								var aa:String = (Math.round(Math.random()*9)).toString();
								obj_geshi = obj_geshi.replace("^",aa);}
							numArr.push(obj_geshi);
						}
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						temp.BetContent = str;
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.ShowContent = str.replace(myPattern,"  ");
						
						//特殊处理，计算煮熟
						if(random_obj.num == 4)temp.zhushu=zhushu;
						if(random_obj.num == 5)temp.zhushu=5*zhushu;
					}
					//单式
					if(game_type=="3"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							for(var i:int=0;i<4;i++){
								var a:int = Math.round(Math.random()*9);
								if(i != 3)obj += a+",";
								else obj += a;}
							obj += "$" +random_obj.geshi;
							numArr.push(obj);
						}
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						var myPattern_0:RegExp = /万/g;
						var myPattern_1:RegExp = /千/g;
						var myPattern_2:RegExp = /百/g;
						var myPattern_3:RegExp = /十/g;
						var myPattern_4:RegExp = /个/g;
						var new_str:String = str;
						new_str = new_str.replace(myPattern_0,"0");
						new_str = new_str.replace(myPattern_1,"1");
						new_str = new_str.replace(myPattern_2,"2");
						new_str = new_str.replace(myPattern_3,"3");
						new_str = new_str.replace(myPattern_4,"4");
						temp.BetContent = new_str;
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.ShowContent = str.replace(myPattern,"  ");
						
						//特殊处理，计算煮熟
						//特殊处理，计算煮熟
						if(random_obj.num == 4)temp.zhushu=zhushu;
						if(random_obj.num == 5)temp.zhushu=5*zhushu;
					}
					break;
				case "38"://任三
					if(random_obj.num<3){
						temp.BetContent = "";
						temp.ShowContent = "";
						temp.zhushu = "";
						break;
					}
					//复式
					if(game_type=="0"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							var obj_geshi:String = random_obj.geshi;//保存格式，防止一次修改后，每次重复
							for(var i:int=0;i<random_obj.num;i++){
								var aa:String = (Math.round(Math.random()*9)).toString();
								obj_geshi = obj_geshi.replace("^",aa);}
							numArr.push(obj_geshi);
						}
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						temp.BetContent = str;
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.ShowContent = str.replace(myPattern,"  ");
						
						//特殊处理，计算煮熟
						if(random_obj.num == 3)temp.zhushu=zhushu;
						if(random_obj.num == 4)temp.zhushu=4*zhushu;
						if(random_obj.num == 5)temp.zhushu=10*zhushu;
					}
					//单式
					if(game_type=="3"){
						//根据注数，先生成号码；
						numArr = new Array();
						while(numArr.length<zhushu){
							var obj:String = new String();
							for(var i:int=0;i<3;i++){
								var a:int = Math.round(Math.random()*9);
								if(i != 2)obj += a+",";
								else obj += a;}
							obj += "$" +random_obj.geshi;
							numArr.push(obj);
						}
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						var myPattern_0:RegExp = /万/g;
						var myPattern_1:RegExp = /千/g;
						var myPattern_2:RegExp = /百/g;
						var myPattern_3:RegExp = /十/g;
						var myPattern_4:RegExp = /个/g;
						var new_str:String = str;
						new_str = new_str.replace(myPattern_0,"0");
						new_str = new_str.replace(myPattern_1,"1");
						new_str = new_str.replace(myPattern_2,"2");
						new_str = new_str.replace(myPattern_3,"3");
						new_str = new_str.replace(myPattern_4,"4");
						temp.BetContent = new_str;
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.ShowContent = str.replace(myPattern,"  ");
						
						//特殊处理，计算煮熟
						if(random_obj.num == 3)temp.zhushu=zhushu;
						if(random_obj.num == 4)temp.zhushu=4*zhushu;
						if(random_obj.num == 5)temp.zhushu=10*zhushu;
					}
					break;
			}
			return temp;
		}
		
		//生成投注内容  (定码方案，生成号码)
		public function verify_BetContent(content:String,playtypeId:String,random_obj:Object):Object
		{
			var temp:Object = new Object();
			var game_id:String = playtypeId.split("_")[0];//玩法id
			var game_type:String = playtypeId.split("_")[1];//玩法type
			
			var numArr:Array;
			
			temp.saveBoolean = "0";
			temp.content = "";
			temp.zhushu = 0;
			temp.betContent = "";
			
			switch(game_id)
			{
				case "10"://一星（定位胆）
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					
					if(numArr.length >10){
						str = " 格式错误，定位胆最多为10注；";
						temp.saveBoolean = "0";
						temp.content = content+str;
						temp.zhushu = "0";
						return temp;
					}
					for(var i:int=0;i<numArr.length;i++){
						if(numArr[i].toString().length >1){
							str = " 格式错误，每注为1位数字；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						for(var j:int=0;j<numArr.length;j++){
							if (i != j && numArr[i]==numArr[j]) {
								str = " 格式错误，每注不能重复；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
					}
					
					temp.saveBoolean = "1";
					temp.zhushu = numArr.length;
					
					//拼成对应格式的字符串；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+",";
						else str += numArr[j];}
					//根据规则，拼成对应格式的字符串内容；
					if(game_type=="5")temp.betContent = str + "|*|*|*|*";
					if(game_type=="4")temp.betContent = "*|" + str +"|*|*|*";
					if(game_type=="3")temp.betContent = "*|*|" + str +"|*|*";
					if(game_type=="2")temp.betContent = "*|*|*|" + str +"|*";
					if(game_type=="1")temp.betContent = "*|*|*|*|" + str;
					//显示的内容；
					var myPattern:RegExp = /,/g; 
					temp.content = str.replace(myPattern," ");
					break;
				case "01"://五星
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					
					for(var i:int=0;i<numArr.length;i++){
						if(numArr[i].toString().length != 5){
							str = " 格式错误，每注为5位数字；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						for(var j:int=0;j<numArr.length;j++){
							if (i != j && numArr[i]==numArr[j]) {
								str = " 格式错误，每注不能重复；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
					}
					//单式  不用处理，本身格式就是12345 23456
					if(game_type=="3"){
						temp.saveBoolean = "1";
						temp.zhushu = numArr.length;
						
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						temp.betContent = str;
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
					}
					//复式 处理格式成1|2|3|4|5 2|3|4|5|6
					if(game_type=="0"){
						temp.saveBoolean = "1";
						temp.zhushu = numArr.length;
						
						//拼成对应格式的字符串；显示的时候单式和复式是一样的，
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
						
						//根据规则，拼成对应格式的字符串内容；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							var aaArr:Array = numArr[j].toString().split("");
							var aaStr:String = new String();
							for(var aa:int=0;aa<aaArr.length;aa++){
								if(aa != aaArr.length-1)aaStr += aaArr[aa]+"|";
								else aaStr += aaArr[aa];
							}
							numArr[j] = aaStr;
							
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						temp.betContent = str;
					}
					break;
				case "32"://后四
				case "30"://前四
					//单式和复式内容格式一样，一并操作，值区分BetMode
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					
					for(var i:int=0;i<numArr.length;i++){
						if(numArr[i].toString().length != 4){
							str = " 格式错误，每注为4位数字；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						for(var j:int=0;j<numArr.length;j++){
							if (i != j && numArr[i]==numArr[j]) {
								str = " 格式错误，每注不能重复；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
					}
					
					//单式和复式内容格式一样，一并操作，值区分BetMode
					temp.saveBoolean = "1";
					temp.zhushu = numArr.length;
					
					//拼成对应格式的字符串；显示的时候单式和复式是一样的，
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.content = str.replace(myPattern,"  ");
					
					//根据规则，拼成对应格式的字符串内容；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						var aaArr:Array = numArr[j].toString().split("");
						var aaStr:String = new String();
						for(var aa:int=0;aa<aaArr.length;aa++){
							if(aa != aaArr.length-1)aaStr += aaArr[aa]+"|";
							else aaStr += aaArr[aa];
						}
						numArr[j] = aaStr;
						
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					temp.betContent = str;
					break;
				case "03"://后三单式和复式
				case "12"://前三单式和复式
				case "25"://中三单式和复式
					//单式和复式内容格式一样，一并操作，值区分BetMode
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					
					for(var i:int=0;i<numArr.length;i++){
						if(numArr[i].toString().length != 3){
							str = " 格式错误，每注为3位数字；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						for(var j:int=0;j<numArr.length;j++){
							if (i != j && numArr[i]==numArr[j]) {
								str = " 格式错误，每注不能重复；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
					}
					
					//单式和复式内容格式一样，一并操作，值区分BetMode
					temp.saveBoolean = "1";
					temp.zhushu = numArr.length;
					
					//拼成对应格式的字符串；显示的时候单式和复式是一样的，
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.content = str.replace(myPattern,"  ");
					
					//根据规则，拼成对应格式的字符串内容；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						var aaArr:Array = numArr[j].toString().split("");
						var aaStr:String = new String();
						for(var aa:int=0;aa<aaArr.length;aa++){
							if(aa != aaArr.length-1)aaStr += aaArr[aa]+"|";
							else aaStr += aaArr[aa];
						}
						numArr[j] = aaStr;
						
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					temp.betContent = str;
					break;
				case "05"://后三组三复式
				case "14"://前三组三复式
				case "27"://中三组三复式
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					
					for(var i:int=0;i<numArr.length;i++){
						if(numArr[i].toString().length != 2){
							str = " 格式错误，每注为3位数字；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						for(var j:int=0;j<numArr.length;j++){
							if (i != j && numArr[i]==numArr[j]) {
								str = " 格式错误，每注不能重复；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						if (numArr[i].toString().split()[0] == numArr[i].toString().split()[1]) {
							str = " 格式错误，组三复式每注的内容不能重复；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					
					//单式和复式内容格式一样，一并操作，值区分BetMode
					temp.saveBoolean = "1";
					temp.zhushu = 2*numArr.length;//每一注组三号码内容是2注；
					
					//拼成对应格式的字符串；显示的时候单式和复式是一样的，
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.content = str.replace(myPattern,"  ");
					
					//根据规则，拼成对应格式的字符串内容；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						var aaArr:Array = numArr[j].toString().split("");
						var aaStr:String = new String();
						for(var aa:int=0;aa<aaArr.length;aa++){
							if(aa != aaArr.length-1)aaStr += aaArr[aa]+",";
							else aaStr += aaArr[aa];
						}
						numArr[j] = aaStr;
						
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					temp.betContent = str;
					break;
				case "06"://后三组六复式
				case "15"://前三组六复式
				case "28"://中三组六复式
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					
					for(var i:int=0;i<numArr.length;i++){
						if(numArr[i].toString().length != 3){
							str = " 格式错误，每注为3位数字；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						for(var j:int=0;j<numArr.length;j++){
							if (i != j && numArr[i]==numArr[j]) {
								str = " 格式错误，每注不能重复；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						if (numArr[i].toString().split("")[0] == numArr[i].toString().split("")[1] || numArr[i].toString().split("")[0] == numArr[i].toString().split("")[2]
						 || numArr[i].toString().split("")[1] == numArr[i].toString().split("")[2]) {
							str = " 格式错误，组六复式每注的内容不能重复；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					
					//单式和复式内容格式一样，一并操作，值区分BetMode
					temp.saveBoolean = "1";
					temp.zhushu = numArr.length;
					
					//拼成对应格式的字符串；显示的时候单式和复式是一样的，
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.content = str.replace(myPattern,"  ");
					
					//根据规则，拼成对应格式的字符串内容；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						var aaArr:Array = numArr[j].toString().split("");
						var aaStr:String = new String();
						for(var aa:int=0;aa<aaArr.length;aa++){
							if(aa != aaArr.length-1)aaStr += aaArr[aa]+",";
							else aaStr += aaArr[aa];
						}
						numArr[j] = aaStr;
						
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					temp.betContent = str;
					break;
				case "07"://后二
				case "18"://前二
					//单式和复式内容格式一样，一并操作，值区分BetMode
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					
					for(var i:int=0;i<numArr.length;i++){
						if(numArr[i].toString().length != 2){
							str = " 格式错误，每注为2位数字；";
							temp.saveBoolean = "0";
							temp.content = content+str;
							temp.zhushu = "0";
							return temp;
						}
					}
					for(var i:int=0;i<numArr.length;i++){
						for(var j:int=0;j<numArr.length;j++){
							if (i != j && numArr[i]==numArr[j]) {
								str = " 格式错误，每注不能重复；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
					}
					
					//单式和复式内容格式一样，一并操作，值区分BetMode
					temp.saveBoolean = "1";
					temp.zhushu = numArr.length;
					
					//拼成对应格式的字符串；显示的时候单式和复式是一样的，
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					//方案编辑的时候，显示所有的逗号为空格；
					var myPattern:RegExp = /#/g; 
					temp.content = str.replace(myPattern,"  ");
					
					//根据规则，拼成对应格式的字符串内容；
					var str:String = new String();
					for(var j:int=0;j<numArr.length;j++){
						var aaArr:Array = numArr[j].toString().split("");
						var aaStr:String = new String();
						for(var aa:int=0;aa<aaArr.length;aa++){
							if(aa != aaArr.length-1)aaStr += aaArr[aa]+"|";
							else aaStr += aaArr[aa];
						}
						numArr[j] = aaStr;
						
						if(j != numArr.length-1)str += numArr[j]+"#";
						else str += numArr[j];}
					temp.betContent = str;
					break;
				case "37"://任二
					if(random_obj.num<2){
						str = " 万千百十个最少选择2个位数；";
						temp.saveBoolean = "0";
						temp.content = content+str;
						temp.zhushu = "0";
						return temp;
					}
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					//复式
					if(game_type=="0"){
						for(var i:int=0;i<numArr.length;i++){
							if(numArr[i].toString().length != random_obj.num){
								str = " 格式错误，每注为" + random_obj.num + "位数字；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
						temp.saveBoolean = "1";
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//方案编辑的时候
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
						
						//根据规则，拼成对应格式的字符串内容；
						var newArr:Array = new Array();
						for(var j:int=0;j<numArr.length;j++){
							var obj_geshi:String = random_obj.geshi;//保存格式，防止一次修改后，每次重复
							for(var i:int=0;i<random_obj.num;i++){
								obj_geshi = obj_geshi.replace("^",numArr[j].toString().split("")[i]);
							}
							newArr.push(obj_geshi);
						}
						var str:String = new String();
						for(var j:int=0;j<newArr.length;j++){
							if(j != newArr.length-1)str += newArr[j]+"#";
							else str += newArr[j];}
						temp.betContent = str;
					}
					//单式
					if(game_type=="3"){
						for(var i:int=0;i<numArr.length;i++){
							if(numArr[i].toString().length != 2){
								str = " 格式错误，每注为2位数字；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
						temp.saveBoolean = "1";
						//拼成对应格式的字符串；显示内容
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
						
						//根据规则，拼成对应格式的字符串内容； 投注内容
						var newArr:Array = new Array();
						for(var j:int=0;j<numArr.length;j++){
							var obj:String = new String();
							for(var i:int=0;i<2;i++){
								if(i != 1)obj += numArr[j].toString().split("")[i]+",";
								else obj += numArr[j].toString().split("")[i];}
							obj += "$" +random_obj.geshi;
							newArr.push(obj);
						}
						var new_str:String = new String();
						for(var j:int=0;j<newArr.length;j++){
							if(j != newArr.length-1)new_str += newArr[j]+"#";
							else new_str += newArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						var myPattern_0:RegExp = /万/g;
						var myPattern_1:RegExp = /千/g;
						var myPattern_2:RegExp = /百/g;
						var myPattern_3:RegExp = /十/g;
						var myPattern_4:RegExp = /个/g;
						new_str = new_str.replace(myPattern_0,"0");
						new_str = new_str.replace(myPattern_1,"1");
						new_str = new_str.replace(myPattern_2,"2");
						new_str = new_str.replace(myPattern_3,"3");
						new_str = new_str.replace(myPattern_4,"4");
						temp.betContent = new_str;
					}
					//特殊处理，计算煮熟
					if(random_obj.num == 2)temp.zhushu=1*numArr.length;
					if(random_obj.num == 3)temp.zhushu=3*numArr.length;
					if(random_obj.num == 4)temp.zhushu=6*numArr.length;
					if(random_obj.num == 5)temp.zhushu=10*numArr.length;
					break;
				case "65"://任四
					if(random_obj.num<4){
						str = " 万千百十个最少选择4个位数；";
						temp.saveBoolean = "0";
						temp.content = content+str;
						temp.zhushu = "0";
						return temp;
					}
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					//复式
					if(game_type=="0"){
						for(var i:int=0;i<numArr.length;i++){
							if(numArr[i].toString().length != random_obj.num){
								str = " 格式错误，每注为" + random_obj.num + "位数字；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
						temp.saveBoolean = "1";
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//方案编辑的时候
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
						
						//根据规则，拼成对应格式的字符串内容；
						var newArr:Array = new Array();
						for(var j:int=0;j<numArr.length;j++){
							var obj_geshi:String = random_obj.geshi;//保存格式，防止一次修改后，每次重复
							for(var i:int=0;i<random_obj.num;i++){
								obj_geshi = obj_geshi.replace("^",numArr[j].toString().split("")[i]);
							}
							newArr.push(obj_geshi);
						}
						var str:String = new String();
						for(var j:int=0;j<newArr.length;j++){
							if(j != newArr.length-1)str += newArr[j]+"#";
							else str += newArr[j];}
						temp.betContent = str;
					}
					//单式
					if(game_type=="3"){
						for(var i:int=0;i<numArr.length;i++){
							if(numArr[i].toString().length != 4){
								str = " 格式错误，每注为4位数字；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
						temp.saveBoolean = "1";
						//拼成对应格式的字符串；显示内容
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
						
						//根据规则，拼成对应格式的字符串内容； 投注内容
						var newArr:Array = new Array();
						for(var j:int=0;j<numArr.length;j++){
							var obj:String = new String();
							for(var i:int=0;i<4;i++){
								if(i != 3)obj += numArr[j].toString().split("")[i]+",";
								else obj += numArr[j].toString().split("")[i];}
							obj += "$" +random_obj.geshi;
							newArr.push(obj);
						}
						var new_str:String = new String();
						for(var j:int=0;j<newArr.length;j++){
							if(j != newArr.length-1)new_str += newArr[j]+"#";
							else new_str += newArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						var myPattern_0:RegExp = /万/g;
						var myPattern_1:RegExp = /千/g;
						var myPattern_2:RegExp = /百/g;
						var myPattern_3:RegExp = /十/g;
						var myPattern_4:RegExp = /个/g;
						new_str = new_str.replace(myPattern_0,"0");
						new_str = new_str.replace(myPattern_1,"1");
						new_str = new_str.replace(myPattern_2,"2");
						new_str = new_str.replace(myPattern_3,"3");
						new_str = new_str.replace(myPattern_4,"4");
						temp.betContent = new_str;
					}
					//特殊处理，计算煮熟
					if(random_obj.num == 4)temp.zhushu=1*numArr.length;
					if(random_obj.num == 5)temp.zhushu=5*numArr.length;
					break;
				case "38"://任三
					if(random_obj.num<3){
						str = " 万千百十个最少选择3个位数；";
						temp.saveBoolean = "0";
						temp.content = content+str;
						temp.zhushu = "0";
						return temp;
					}
					numArr = new Array();
					numArr = content.split(" ");
					var str:String;
					
					var newFoo:Array=new Array();
					for(var i:int=0;i<=numArr.length;i++){
						if(numArr[i]!="" && numArr[i]!=null && numArr[i]!=undefined){
							newFoo.push(numArr[i]);
						}
					}
					numArr = new Array();
					numArr = newFoo;
					//复式
					if(game_type=="0"){
						for(var i:int=0;i<numArr.length;i++){
							if(numArr[i].toString().length != random_obj.num){
								str = " 格式错误，每注为" + random_obj.num + "位数字；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
						temp.saveBoolean = "1";
						//拼成对应格式的字符串；
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//方案编辑的时候
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
						
						//根据规则，拼成对应格式的字符串内容；
						var newArr:Array = new Array();
						for(var j:int=0;j<numArr.length;j++){
							var obj_geshi:String = random_obj.geshi;//保存格式，防止一次修改后，每次重复
							for(var i:int=0;i<random_obj.num;i++){
								obj_geshi = obj_geshi.replace("^",numArr[j].toString().split("")[i]);
							}
							newArr.push(obj_geshi);
						}
						var str:String = new String();
						for(var j:int=0;j<newArr.length;j++){
							if(j != newArr.length-1)str += newArr[j]+"#";
							else str += newArr[j];}
						temp.betContent = str;
					}
					//单式
					if(game_type=="3"){
						for(var i:int=0;i<numArr.length;i++){
							if(numArr[i].toString().length != 3){
								str = " 格式错误，每注为3位数字；";
								temp.saveBoolean = "0";
								temp.content = content+str;
								temp.zhushu = "0";
								return temp;
							}
						}
						temp.saveBoolean = "1";
						//拼成对应格式的字符串；显示内容
						var str:String = new String();
						for(var j:int=0;j<numArr.length;j++){
							if(j != numArr.length-1)str += numArr[j]+"#";
							else str += numArr[j];}
						//方案编辑的时候，显示所有的逗号为空格；
						var myPattern:RegExp = /#/g; 
						temp.content = str.replace(myPattern,"  ");
						
						//根据规则，拼成对应格式的字符串内容； 投注内容
						var newArr:Array = new Array();
						for(var j:int=0;j<numArr.length;j++){
							var obj:String = new String();
							for(var i:int=0;i<3;i++){
								if(i != 2)obj += numArr[j].toString().split("")[i]+",";
								else obj += numArr[j].toString().split("")[i];}
							obj += "$" +random_obj.geshi;
							newArr.push(obj);
						}
						var new_str:String = new String();
						for(var j:int=0;j<newArr.length;j++){
							if(j != newArr.length-1)new_str += newArr[j]+"#";
							else new_str += newArr[j];}
						//根据规则，拼成对应格式的字符串内容；
						var myPattern_0:RegExp = /万/g;
						var myPattern_1:RegExp = /千/g;
						var myPattern_2:RegExp = /百/g;
						var myPattern_3:RegExp = /十/g;
						var myPattern_4:RegExp = /个/g;
						new_str = new_str.replace(myPattern_0,"0");
						new_str = new_str.replace(myPattern_1,"1");
						new_str = new_str.replace(myPattern_2,"2");
						new_str = new_str.replace(myPattern_3,"3");
						new_str = new_str.replace(myPattern_4,"4");
						temp.betContent = new_str;
					}
					//特殊处理，计算煮熟
					if(random_obj.num == 3)temp.zhushu=1*numArr.length;
					if(random_obj.num == 4)temp.zhushu=4*numArr.length;
					if(random_obj.num == 5)temp.zhushu=10*numArr.length;
					break;
			}
			return temp;
		}
		
		
	}
}