package com.readiya.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@AllArgsConstructor
public class AuthorVO {
    private int authorId;                      // 작가 아이디
    private String authorName;                 // 작가 이름
    private String nationId;                   // 국가 아이디
    private String nationName;                 // 작가 국가
    private String authorIntro;                // 작가 소개
    private Date regDate;                      // 등록 날짜
    private Date updateDate;                   // 수정 날짜
    
	public int getAuthorId() {
		return authorId;
	}
	
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	
	public String getAuthorName() {
		return authorName;
	}
	
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	
	public String getNationId() {
		return nationId;
	}
	
	public void setNationId(String nationId) {
		this.nationId = nationId;
		
		if (nationId.equals("01")) {
            this.nationName = "국내";
        }else {
            this.nationName = "국외";
        }
	}
	
	public String getNationName() {
		return nationName;
	}
	
	public void setNationName(String nationName) {
		this.nationName = nationName;
	}
	
	public String getAuthorIntro() {
		return authorIntro;
	}
	
	public void setAuthorIntro(String authorIntro) {
		this.authorIntro = authorIntro;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}
	
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "AuthorVO [authorId=" + authorId + ", authorName=" + authorName + ", nationId=" + nationId
				+ ", nationName=" + nationName + ", authorIntro=" + authorIntro + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + "]";
	}
    
}
