package com.bdqn.meitao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdqn.meitao.dao.UserMapper;
import com.bdqn.meitao.pojo.User;
import com.bdqn.meitao.pojo.UserExample;
import com.bdqn.meitao.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired//首先根据类型去spring容器中找bean,找不到在根据bean的id找
	private UserMapper dao;

	@Override
	public User findByNameAndPwd(String name, String pwd) {
		if(name!=null && pwd !=null) {
			UserExample example = new UserExample();
			example.createCriteria().andLoginNameEqualTo(name).andUserPwdEqualTo(pwd);
			List<User> list = dao.selectByExample(example);
			if(list!=null &&list.size() > 0)
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<User> UserList() {
		// TODO Auto-generated method stub
		return dao.selectByExample(null);
	}

	@Override
	public Integer updateUserPrivilege(Integer uid, Integer rid) {
		// TODO Auto-generated method stub
		return dao.updateByUidAndRid(uid, rid);
	}

}
