package com.bdqn.meitao.service;

import java.util.List;

import com.bdqn.meitao.pojo.User;

public interface UserService {
	
	public User findByNameAndPwd(String name ,String pwd);//缺什么写什么！！！
	
	public List<User> UserList();
	
	public Integer updateUserPrivilege(Integer uid,Integer rid); 
}
