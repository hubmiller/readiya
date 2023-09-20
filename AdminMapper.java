package com.readiya.mapper;

import java.util.List;

import com.readiya.domain.BookVO;
import com.readiya.domain.CateVO;
import com.readiya.domain.Criteria;

public interface AdminMapper {
	// 상품 등록
	public void bookEnroll(BookVO book);
	
	// 카테고리 리스트
	public List<CateVO> cateList();
	
	// 상품 관리
	public List<BookVO> goodsGetList(Criteria cri);
	
	// 상품 총 개수
	public int goodsGetTotal(Criteria cri);
	
	// 상품 상세 페이지
	public BookVO goodsGetDetail(int bookId);
	
	// 상품 수정 
	public int goodsModify(BookVO vo);
	
	// 상품 삭제 
	public int goodsDelete(int bookId);
	
}
