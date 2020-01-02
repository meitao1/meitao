package com.bdqn.meitao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bdqn.meitao.pojo.Functions;
import com.bdqn.meitao.pojo.Privilege;
import com.bdqn.meitao.pojo.Role;
import com.bdqn.meitao.pojo.User;
import com.bdqn.meitao.service.FunctionService;
import com.bdqn.meitao.service.PrivilegeService;
import com.bdqn.meitao.service.RoleService;
import com.bdqn.meitao.service.UserService;

@Controller
public class UserController2 {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PrivilegeService priService;

	@Autowired
	FunctionService funService;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping("/login2")
	public ModelAndView login(@RequestParam("login") String name,@RequestParam("password") String pwd) {
		System.out.println("login controller------------------");
		System.out.println(name+"  "+pwd);
		//调用sevice层处理登录业务,缺什么写什么！！！
		User user = userService.findByNameAndPwd(name, pwd);
		ModelAndView mv=new ModelAndView();
		if (user !=null) {
			mv.setViewName("main");
			mv.addObject("user", user);
		}else {
			mv.setViewName("login");
			mv.addObject("error", "用户名或密码错误");
		}
		return mv;
	}
	
	//,produces = MediaType.APPLICATTON_JSON_VALUE+";charset=utf-8"
	@RequestMapping(value="/getpri",produces = MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	@ResponseBody
	public Object ss(@RequestParam("roleId") Integer rid){
		List<Privilege> plist=priService.FindByRoleId(rid);
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
		
		return result;
	}
	
	@RequestMapping("/showUlist")
	public ModelAndView uList(){
		List<User> ulist=userService.UserList();
		List<Role> rlist=roleService.roleList();
		System.out.println(ulist.toString()+"==========+");
		System.out.println(rlist.toString());
		ModelAndView mv=new ModelAndView();
		mv.addObject("userlist", ulist);
		mv.addObject("rlist", rlist);
		mv.setViewName("ulist");
		return mv;
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(@RequestParam("uid") Integer uid,@RequestParam("rid") Integer rid){
		int sum= userService.updateUserPrivilege(uid, rid);
		if (sum==1) {
			
			return "redirect:showUlist";
		}
		return "redirect:showUlist";
	}

}
