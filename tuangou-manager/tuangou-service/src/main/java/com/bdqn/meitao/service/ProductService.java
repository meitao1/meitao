package com.bdqn.meitao.service;

import java.util.List;

import com.bdqn.meitao.pojo.Customer;
import com.bdqn.meitao.pojo.Product;

public interface ProductService {
public List<Product> getByPage(int pageNo,int pageSize);//根据页码查当前页的商品
	
	public List<Product> getAllProduct();

	public long getCount();

	public int addProduct(Product pro);
	
	
}
