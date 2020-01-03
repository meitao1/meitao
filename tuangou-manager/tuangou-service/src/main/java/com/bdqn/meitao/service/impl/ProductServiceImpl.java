package com.bdqn.meitao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdqn.meitao.dao.ProductMapper;
import com.bdqn.meitao.pojo.Customer;
import com.bdqn.meitao.pojo.Product;
import com.bdqn.meitao.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductMapper dao;
	
	
	@Override
	public List<Product> getByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.selectByPage(pageSize, (pageNo-1)*pageSize);
	}

	@Override
	public long getCount() {
		// TODO Auto-generated method stub
		return dao.countByExample(null);
	}

	@Override
	public int addProduct(Product pro) {
		if(pro != null) {
			return dao.insert(pro);
		}
		return 0;
	}

	@Override
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return dao.selectByExample(null);
	}

}
