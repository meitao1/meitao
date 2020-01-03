package com.bdqn.meitao.portal.service;

import com.bdqn.meitao.pojo.Customer;

public interface CustomerService {

	public int addUSer(Customer customer);
	
	public Customer selectUser(Customer customer);
}
