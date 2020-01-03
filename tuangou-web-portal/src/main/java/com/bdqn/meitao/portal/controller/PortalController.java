package com.bdqn.meitao.portal.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bdqn.meitao.pojo.Customer;
import com.bdqn.meitao.pojo.Product;
import com.bdqn.meitao.portal.service.CustomerService;
import com.bdqn.meitao.portal.service.ProductService;
import com.bdqn.meitao.utils.HttpClientUtil;

@Controller
public class PortalController {
 
	@Autowired
	private ProductService pService;
	
	@Autowired
	private CustomerService Cservice;
	
	/*@RequestMapping("main")//main其实就代表着一个资源对应一个唯一的资源标识
	public String main() {
		return "main";
	}	*/
	
	@RequestMapping("login")//main其实就代表着一个资源对应一个唯一的资源标识
	public String login() {
		return "login";
	}	
	
	@RequestMapping("main")//main其实就代表着一个资源对应一个唯一的资源标识
	public String main(Customer customer) {
		System.out.println(customer.getPwd());
		System.out.println(customer.getLogin());
		System.out.println(customer.getTel());
		Customer userCustomer= Cservice.selectUser(customer);
		if (userCustomer!=null) {
			System.out.println("登入成功");
		}
		System.out.println("登入失败");
		return "main";
	}	
	
	@RequestMapping("zhu")
	public String mainzhu(Customer customer) {
		System.out.println(customer.getPwd());
		System.out.println(customer.getLogin());
		System.out.println(customer.getCustomername());
		int sum= Cservice.addUSer(customer);
		if (sum>0) {
			System.out.println("新建成功");
			return "main";
		}
		System.out.println("失败");
		return "main";
	}	

	@RequestMapping("gethot")//main其实就代表着一个资源对应一个唯一的资源标识
	@ResponseBody
	public Object ajaxmain() {
		System.out.println("gethot---------------------");
		List<Product> list = pService.getHot();
		return list;
	}

	//@RequestMapping("main")//main其实就代表着一个资源对应一个唯一的资源标识
	public ModelAndView showmain() {
		System.out.println("main---------------------");
		List<Product> list = pService.getHot();
		ModelAndView mv = new ModelAndView("main.jsp");
		mv.addObject("plist", list);
		return mv;
	}

	@RequestMapping("heepclient1")
	public String getcl(){
		HashMap<String, String > user=new HashMap<String, String>();
		user.put("login", "admin");
		user.put("password", "1");
		String ss=HttpClientUtil.doPost("http://localhost:8080/login2", user);
		return ss;
		
	}
	
	//@RequestMapping("main") // main其实就代表着一个资源对应一个唯一的资源标识
	@RequestMapping("httpclient")
	public String getJsonFromMeitao(HttpServletRequest request) throws ClientProtocolException, IOException {
		System.out.println("main json---------------------");
		// 1.创建一个httpclient对象
		CloseableHttpClient httpClient = HttpClients.createDefault();
		// 2.创建一个GET对象
		HttpGet get = new HttpGet("http://localhost:8080/product/list2");
		// 3.执行此GET请求
		CloseableHttpResponse response = httpClient.execute(get);
		// 4.获取响应的结果
		int statusCode = response.getStatusLine().getStatusCode();
		System.out.println(statusCode);

		HttpEntity entity = response.getEntity();// 获取响应体
		String string = EntityUtils.toString(entity, "utf-8");
		System.out.println(string);

		// 5.关闭httpclient
		response.close();
		httpClient.close();
		
		request.setAttribute("pjson", string);
		
		return "main";
	}

}
