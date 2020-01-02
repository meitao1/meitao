package com.bdqn.meitao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdqn.meitao.dao.PrivilegeMapper;
import com.bdqn.meitao.pojo.Privilege;
import com.bdqn.meitao.service.PrivilegeService;

@Service
public class PrivilegeServiceImpl implements PrivilegeService{

	@Autowired
	private PrivilegeMapper dao;
	
	@Override
	public List<Privilege> FindByRoleId(int id) {
		// TODO Auto-generated method stub
		return dao.selectPrivilegeByRoleId(id);
	}

}
