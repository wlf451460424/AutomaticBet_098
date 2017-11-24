package com.hurlant
{
	import com.hurlant.crypto.symmetric.CBCMode;
	import com.hurlant.crypto.symmetric.DESKey;
	
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;
	
	public class CryptoUtil
	{
		public function CryptoUtil()
		{
		}
		/**
		 * 加密方法 
		 * @param src 加密字符串
		 * @param k   加密key
		 * @param v   加密向量
		 * @return 
		 * 
		 */		
		public static function DESEncrypt(src:String,k:String,v:String):String
		{
			
			var key:ByteArray = new ByteArray();
			key.writeUTFBytes(k);
			
			var   iv:ByteArray= new   ByteArray();
			iv.writeUTFBytes(v);
			
			var des:DESKey = new DESKey(key);
			var cbc:CBCMode = new CBCMode(des);
			cbc.IV = iv;
			
			var bytes:ByteArray = new ByteArray();
			bytes.writeUTFBytes(src);
			
			cbc.encrypt(bytes);
			
			var base64:Base64Encoder = new Base64Encoder();
			base64.insertNewLines = false;
			base64.encodeBytes(bytes);
			return base64.flush();
		}
		/**
		 * 解密方法 
		 * @param src 解密字符串
		 * @param k   加密key
		 * @param v   解密向量
		 * @return 
		 * 
		 */		
		public static function DESDecrypt(src:String,k:String,v:String):String
		{
			var key:ByteArray = new ByteArray();
			key.writeUTFBytes(k);
			
			var   iv:ByteArray= new   ByteArray();
			iv.writeUTFBytes(v);
			
			var des:DESKey = new DESKey(key);
			var cbc:CBCMode = new CBCMode(des);
			cbc.IV = iv;
			
			var base64:Base64Decoder = new Base64Decoder();
			base64.decode(src);
			var bytes:ByteArray = base64.toByteArray();
			
			cbc.decrypt(bytes);
			
			bytes.position = 0;
			return bytes.readUTFBytes(bytes.length);
		}
		
	}
}