<%@ page import="java.io.*,java.util.*,java.net.*,javax.net.ssl.*,org.json.simple.*,org.json.simple.parser.JSONParser"
%>
<%!
	String get_etoken(String mkey, String curr_date_14, String sign_msg)
	{
		try
		{
			StringBuffer sb = new StringBuffer();
			sb.append(curr_date_14).append(':').append(mkey);
			if (null != sign_msg) sb.append(sign_msg);

			String ptoken = sb.toString();

			byte[]	sha256_bytes = java.security.MessageDigest.getInstance("SHA-256").digest(ptoken.getBytes());

			sb.setLength(0);
			for(int i=0; i<sha256_bytes.length; i++)
			{
				sb.append(Integer.toHexString((0xFF & sha256_bytes[i]) | 0x0100).substring(1));
			}

			sb.insert(0,":");
			sb.insert(0,curr_date_14);

			return sb.toString().toUpperCase();

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "";
	}

	public static String encrypt_msg(String mekey ,String msg)
	{
		if (null == msg || 0 == msg.length()) return "";
		try
		{
			byte[] kbytes = hex_decode(mekey);
			byte[] iv     = new byte[16];

			byte[] mbytes = msg.getBytes("euc-kr");

			javax.crypto.spec.IvParameterSpec ips       = new javax.crypto.spec.IvParameterSpec(iv);
			javax.crypto.spec.SecretKeySpec   skeySpec  = new javax.crypto.spec.SecretKeySpec(kbytes, "AES");
			javax.crypto.Cipher               cipher    = javax.crypto.Cipher.getInstance("AES/CBC/PKCS5Padding");

			cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, skeySpec,ips);

			byte[] ebytes = cipher.doFinal(mbytes);

			return hex_encode(ebytes);
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return null;
	}

	public static String hex_encode(byte[] sbuf)
	{
		return hex_encode(sbuf ,0 ,sbuf.length);
	}

	public static String hex_encode(byte[] sbuf ,int sidx ,int slen)
	{
		if (null == sbuf || sidx < 0 || slen < 1 || sbuf.length < sidx + slen) return "";

		StringBuffer sb = new StringBuffer();
		for(int i=sidx, j=0; (i<sbuf.length && j<slen); i++, j++)
		{
			sb.append(Integer.toHexString((0xFF & sbuf[i]) | 0x0100).substring(1));
		}

		return sb.toString().toUpperCase();
	}

	public static byte[] hex_decode(String sStr)
	{
		if (null == sStr) return null;

		int slen = sStr.length();
	 	if (0 == slen || 0 != (slen % 2)) return null;

	 	byte[] sbytes = new byte[slen / 2];

	 	for (int i=0,j=0; i < slen ; i += 2, j++)
	 	{
	 		sbytes[j] = (byte) (0xff & Integer.parseInt(sStr.substring(i, i + 2), 16));
	 	}

	 	return sbytes;
	}
	public String call_web_api(String shop_url ,String post_msg,String char_set)
	{
		HttpURLConnection   ucon    = null;
		DataOutputStream    dout    = null;
		BufferedReader      brd     = null;

		try
		{
			System.out.println("CHECK!! call_web_api.REQ__("+shop_url+")\n        PARAM("+post_msg+")");

			if (shop_url.startsWith("http://"))
			{
				ucon = (HttpURLConnection)(new URL(shop_url)).openConnection();
			}else
			{
				ucon = (HttpsURLConnection)(new URL(null,shop_url,new sun.net.www.protocol.https.Handler())).openConnection();
			}

			if (null != post_msg)
			{
				ucon.setRequestMethod("POST");
			}else
			{
				ucon.setRequestMethod("GET");
			}
            
			ucon.setRequestProperty("Content-Type","application/x-www-form-urlencoded");

			ucon.setDoInput(true);
			ucon.setDoOutput(true);
			ucon.setUseCaches(false);

			if (null != post_msg) 
			{
				dout    = new DataOutputStream(ucon.getOutputStream());
				dout.write(post_msg.getBytes(char_set));
				dout.flush();
			}

			if (200 == ucon.getResponseCode())
			{ 
				brd = new BufferedReader(new InputStreamReader(ucon.getInputStream(),char_set));
			}else
			{ 
				brd = new BufferedReader(new InputStreamReader(ucon.getErrorStream(),char_set));
			}

			StringBuffer sbm = new StringBuffer();
			
			String tmpStr = null;
			while((tmpStr = brd.readLine()) != null)
			{
				sbm.append(tmpStr).append("\r\n");
			}
			String rpy_msg = sbm.toString();

			System.out.println("CHECK!! call_web_api.RPY__(CT:"+ucon.getContentType()+")("+rpy_msg+")");
			return rpy_msg;

		}catch(Exception e)
		{
			System.out.println("CHECK!! call_web_api.exception!!");
			e.printStackTrace();
		}finally
		{
			try{if (dout!= null) {dout.close();}}catch(Exception e){}finally{dout= null;}
			try{if (brd != null) {brd .close();}}catch(Exception e){}finally{brd = null;}
			ucon= null;
		}

		return "";
	}
	public boolean parseJson(String rmsg, HashMap param_hash)
	{
		org.json.simple.parser.JSONParser parser = new JSONParser();
		try
		{
			Object obj = parser.parse(rmsg);
			org.json.simple.JSONObject jobj = (JSONObject)obj;

			Iterator send_iter = jobj.keySet().iterator();
			while(send_iter.hasNext())
			{
				String p_name  = (String)send_iter.next();
				String p_value = "";
				if (jobj.get(p_name) != null)
				{
					p_value = jobj.get(p_name).toString();
				}
				param_hash.put(p_name ,p_value.trim());
				System.out.println("parseJson ...("+p_name+")=("+p_value+")");	
			}
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
%>
