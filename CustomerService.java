package com.readiya.service;

import com.readiya.domain.CustomerVO;

public interface CustomerService {
	// 회원가입
	public void register(CustomerVO customer);
	
	// 아이디 중복 검사
	public int idCheck(String customerId);
	
	//로그인
	public CustomerVO customerLogin(CustomerVO customer);
}
