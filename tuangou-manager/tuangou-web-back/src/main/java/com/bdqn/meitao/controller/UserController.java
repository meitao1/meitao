package com.bdqn.meitao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bdqn.meitao.pojo.Functions;
import com.bdqn.meitao.pojo.Privilege;
import com.bdqn.meitao.pojo.Role;
import com.bdqn.meitao.pojo.User;
import com.bdqn.meitao.service.FunctionService;
import com.bdqn.meitao.service.RoleService;
import com.bdqn.meitao.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	FunctionService funService;
	
	//json 语法1： {"键1"："值1","键2"："值2","键3"："值3",...} 一个json
	//json 语法2： [{"键1"："值1","键2"："值2","键3"："值3",...},{"键1"："值1","键2"："值2","键3"："值3",...}] json数组，多个json,
	//json 语法3： {"键1"：{值1可以是json},"键2"："{值2可以是json}",...}
	 
	@RequestMapping("/ulogin")
	public ModelAndView login(@RequestParam("login") String name,@RequestParam("password") String pwd) throws JsonProcessingException {
		System.out.println("login controller------------------");
		System.out.println(name+"  "+pwd);
		//调用sevice层处理登录业务,缺什么写什么！！！
		User user = userService.findByNameAndPwd(name, pwd);
		
		
		/*if(user != null) {*/
			//打草稿！！！------->写伪代码，最简单粗暴有效的！
			//干什么？登录，要从服务端获取该用户的权限？
			//1.用户的信息，通过账号和密码可以从user表中查询出来。
			
			//2.可以通过用户的role_id查询出该用户的角色信息
			//3.可以通过用户跟角色的role_pri表多对多，查出该角色拥有的权限 ，
			//user.getRoleId();--->获得角色，再mybatis的关联关系，一起完成2，3两步---->得到该role拥有的权限Privilege
			
			Role role = roleService.findByRoleId(user.getRoleId());//此Role是包含了权限
			
			//4.可以通过权限的pid，查出该权限下的功能
			List<Privilege> plist = role.getPrivileges();
			
			List<Map> result=new ArrayList<Map>();
			
			for(int i=0;i<plist.size();i++) {
				Privilege  p = plist.get(i);//该role对象的每项权限
				System.out.println(p.getPrivilegeName());
				HashMap map=new HashMap();
				map.put("text", p.getPrivilegeName());
				List<Map> child=new ArrayList<Map>();
				List<Functions> flist = funService.findFunByPid(p.getPrivilegeId());//查询出当前Privilege下的所有功能
				for(int j =0;j<flist.size();j++) {
					Functions fun = flist.get(j);//该role下某个Privilege下的某功能
					System.out.println(fun.getFunctionName());
					HashMap map1=new HashMap();
					map1.put("text", fun.getFunctionName());
					HashMap map2=new HashMap();
					map2.put("url", fun.getUrl());
					map1.put("attributes", map2);
					child.add(map1);
				}
				map.put("children", child);
				result.add(map);
			}
			
			//5.最后还要将我们查出的用户所拥有的权限和功能做成json传给前端页面
			//主流的4中json解析技术，用jackson工具帮我们生产json ,前提是，jackson操作的是对象，对象怎么来？
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(result);
			
			ModelAndView mv=new ModelAndView("main");
			mv.addObject("jsons", json);
			return mv;
			
			//以上5件事情可以有多种方法实现
			
		/*	return "main";
		}
		return "login";*/
	}

}
