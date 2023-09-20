package com.readiya.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.readiya.domain.CustomerVO;
import com.readiya.mapper.CustomerMapper;



@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public void register(CustomerVO customer) {
		try {
			customerMapper.insert(customer);
		} catch (DuplicateKeyException e) {
            e.printStackTrace();
        }
	}

	@Override
	public int idCheck(String customerId) {
		return customerMapper.idCheck(customerId);
	}

	@Override
	public CustomerVO customerLogin(CustomerVO customer) {
		return customerMapper.customerLogin(customer);
	}
	
}
