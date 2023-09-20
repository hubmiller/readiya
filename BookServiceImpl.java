package com.readiya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.readiya.domain.BookVO;
import com.readiya.domain.Criteria;
import com.readiya.mapper.BookMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;
	
	// 상품 검색
	@Override
	public List<BookVO> getGoodsList(Criteria cri) {
		log.info("getGoodsList().......");
		return bookMapper.getGoodsList(cri);
	}

}
