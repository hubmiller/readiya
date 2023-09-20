package com.readiya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.readiya.domain.AuthorVO;
import com.readiya.domain.Criteria;
import com.readiya.mapper.AuthorMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class AuthorServiceImpl implements AuthorService {
	@Autowired
    AuthorMapper authorMapper;
	
	// 작가 등록
	@Override
	public void authorEnroll(AuthorVO author) {
		authorMapper.authorEnroll(author);
	}

	// 작가 관리
	@Override
	public List<AuthorVO> authorGetList(Criteria cri) {
		 return authorMapper.authorGetList(cri);
	}
	
	// 작가 총 수
	@Override
	public int authorGetTotal(Criteria cri) {
		//log.info("(service)authorGetTotal()......." + cri);
        return authorMapper.authorGetTotal(cri);
	}
	
	// 작가 상세 페이지
	@Override
	public AuthorVO authorGetDetail(int authorId) {
		log.info("(service)authorGetDetail........" + authorId);
		return authorMapper.authorGetDetail(authorId);
	}
	
	// 작가 수정
	@Override
	public int authorModify(AuthorVO author) {
		//log.info("(service) authorModify........." + author);
		return authorMapper.authorModify(author);
	}
	
	// 작가 삭제
	@Override
	public int authorDelete(int authorId) {
		//log.info("(service)authorDelete..........");
		return authorMapper.authorDelete(authorId);
	}

}
