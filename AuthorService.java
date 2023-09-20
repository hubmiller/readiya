package com.readiya.service;

import java.util.List;

import com.readiya.domain.AuthorVO;
import com.readiya.domain.Criteria;

public interface AuthorService {
	// 작가 등록 
    public void authorEnroll(AuthorVO author);
    
    // 작가 관리
    public List<AuthorVO> authorGetList(Criteria cri);
    
    // 작가 총 수 
    public int authorGetTotal(Criteria cri); 
    
    // 작가 상세 페이지
	public AuthorVO authorGetDetail(int authorId);
	
	// 작가 수정
	public int authorModify(AuthorVO author);
	
	// 작가 삭제
	public int authorDelete(int authorId);
	
}
