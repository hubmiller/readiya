package com.readiya.mapper;

import java.util.List;

import com.readiya.domain.CustomerVO;

public interface CustomerMapper {
	public List<CustomerVO> getList();
	public CustomerVO read(String id);
	public void insert(CustomerVO customer);  // 회원가입
	public int delete(String id);
	public int update(CustomerVO vo);
	public int idCheck(String customerId);  // 아이디 중복 검사
    public CustomerVO customerLogin(CustomerVO customer);  // 로그인
    
}
