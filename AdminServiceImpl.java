package com.readiya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.readiya.domain.BookVO;
import com.readiya.domain.CateVO;
import com.readiya.domain.Criteria;
import com.readiya.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;	
	
	@Override
	public void bookEnroll(BookVO book) {
		//log.info("(service)bookEnroll........");
		
		adminMapper.bookEnroll(book);
	}

	@Override
	public List<CateVO> cateList() {
		//log.info("(service)cateList........");

		return adminMapper.cateList();	
	}

	@Override
	public List<BookVO> goodsGetList(Criteria cri) {
		//log.info("goodsGetTotalList()..........");
		return adminMapper.goodsGetList(cri);
	}

	@Override
	public int goodsGetTotal(Criteria cri) {
		//log.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(cri);
	}

	@Override
	public BookVO goodsGetDetail(int bookId) {
		//log.info("(service)bookGetDetail......." + bookId);
		return adminMapper.goodsGetDetail(bookId);
	}

	@Override
	public int goodsModify(BookVO vo) {
		//log.info("goodsModify........");
		return adminMapper.goodsModify(vo);
	}

	@Override
	public int goodsDelete(int bookId) {
		//log.info("goodsDelete..........");
		return adminMapper.goodsDelete(bookId);
	}

}
