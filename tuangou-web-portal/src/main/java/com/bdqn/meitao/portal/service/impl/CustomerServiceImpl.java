package com.bdqn.meitao.portal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdqn.meitao.dao.CustomerMapper;
import com.bdqn.meitao.pojo.Customer;
import com.bdqn.meitao.portal.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerMapper dao;
	
	@Override
	public int addUSer(Customer customer) {
		// TODO Auto-generated method stub
		return dao.insertSelective(customer);
	}

	@Override
	public Customer selectUser(Customer customer) {
		// TODO Auto-generated method stub
		return dao.selectUser(customer);
	}

}
