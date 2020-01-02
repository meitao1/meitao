package com.bdqn.meitao.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpClientUtil {
	
	public static String doGet(String url,Map<String , String > param) {
		//创建Httpclirnt对象
		CloseableHttpClient httpClient=HttpClients.createDefault();
		String resultString="";
		CloseableHttpResponse response=null;
		try {
			//创建uri
			URIBuilder builder=new URIBuilder(url);
			if (param != null) {
				for (String  key : param.keySet()) {
					builder.addParameter(key, param.get(key));//效果http://localhost: 8081/httpclien?key1=value1&key2=value2
				}
			}
			URI uri=builder.build();//绑定请求传递参数
			//创建http get 请求
			HttpGet httpGet=new HttpGet(uri);
			//执行请求
			response=httpClient.execute(httpGet);
			//判断返回状态是否为200
			if (response.getStatusLine().getStatusCode()==200) {
				resultString=EntityUtils.toString(response.getEntity(),"utf-8");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				response.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return resultString;
		
	}
	
	public static String doGet(String url) {
		return doGet(url, null);
	}
	
	public static String doPost(String url,Map<String , String > param) {
		//创建httpclient对象
		CloseableHttpClient httpClient=HttpClients.createDefault();
		CloseableHttpResponse response=null;
		String  resultString="";
		try {
			//创建http post请求
			HttpPost httpPost=new HttpPost(url);
			//创建参数列表
			if (param!=null) {
				List<NameValuePair> paramlList=new ArrayList<>();
				for (String key  : param.keySet()) {
					paramlList.add(new BasicNameValuePair(key, param.get(key)));
				}
				//模拟表单
				UrlEncodedFormEntity entity=new UrlEncodedFormEntity(paramlList);
				httpPost.setEntity(entity);//绑定post参数
			}
			//执行http请求
			response =httpClient.execute(httpPost);
			resultString=EntityUtils.toString(response.getEntity(),"utf-8");
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				response.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			return resultString;
		
	}
	
	public static String  doPost(String url) {
		return doPost(url,null);
	}
	
	public static String  doPostJson(String url,String json) {
		//创建httpclient对象
		CloseableHttpClient httpClient=HttpClients.createDefault();
		CloseableHttpResponse response=null;
		String resultString="";
		try {
			//创建http post对象
			HttpPost httpPost=new HttpPost(url);
			//创建请求内容
			StringEntity entity=new StringEntity(json,ContentType.APPLICATION_JSON);
			httpPost.setEntity(entity);
			//执行http请求
			response=httpClient.execute(httpPost);
			resultString=EntityUtils.toString(response.getEntity(),"utf-8");
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				response.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return resultString;
	}
	
}
