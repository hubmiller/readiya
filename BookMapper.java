package com.readiya.mapper;

import java.util.List;

import com.readiya.domain.BookVO;
import com.readiya.domain.Criteria;

public interface BookMapper {
	// 상품 검색
	public List<BookVO> getGoodsList(Criteria cri);
	
}	
