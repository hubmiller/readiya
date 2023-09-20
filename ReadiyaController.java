package com.readiya.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.readiya.domain.AuthorVO;
import com.readiya.domain.BookVO;
import com.readiya.domain.CartDTO;
import com.readiya.domain.Criteria;
import com.readiya.domain.CustomerVO;
import com.readiya.domain.PageDTO;
import com.readiya.service.AdminService;
import com.readiya.service.AuthorService;
import com.readiya.service.CartService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/readiya")
@Log4j
public class ReadiyaController {
	@Autowired
    private AuthorService authorService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CartService cartService;
	
	// 상품 등록 페이지 접속
    @RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
    public void goodsEnrollGET(Model model) {
        log.info("상품 등록 페이지 접속");
        
        ObjectMapper objm = new ObjectMapper();
    	List list = adminService.cateList();
    	
    	try {
			String cateList = objm.writeValueAsString(list);
			model.addAttribute("cateList", cateList);
			
			//log.info("변경 전.........." + list);
			//log.info("변경 후.........." + cateList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
    }
    
    // 상품 등록
 	@PostMapping("/goodsEnroll")
 	public String goodsEnrollPOST(BookVO book, RedirectAttributes rttr) {
 		//log.info("goodsEnrollPOST......" + book);
 		adminService.bookEnroll(book);
 		rttr.addFlashAttribute("enroll_result", book.getBookName());
 		
 		return "redirect:/readiya/goodsManage";
 	}
 	
 	// 작가 검색 팝업창
 	@GetMapping("/authorPop")
 	public void authorPopGET(Criteria cri, Model model) {
 		log.info("authorPopGET.......");
 		cri.setAmount(5);
 		// 게시물 출력 데이터 
 		List list = authorService.authorGetList(cri);
 		
 		if(!list.isEmpty()) {
 			model.addAttribute("list", list);	// 작가가 존재할 경우
 		} else {
 			model.addAttribute("listCheck", "empty");	// 작가가 존재하지 않을 경우
 		}
 			
 		// 페이지 이동 인터페이스 데이터 
 		model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
 	}
    
    
    // 상품 관리 페이지 접속 
    @RequestMapping(value = "goodsManage", method = RequestMethod.GET)
    public void goodsManageGET(Criteria cri, Model model) {
        log.info("상품 관리 페이지 접속");
        
        // 상품 리스트
		List list = adminService.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		// 페이지 인터페이스 데이터
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
    }
    
    // 상품 상세 페이지 
    @GetMapping({"/goodsDetail", "/goodsModify"})
 	public void goodsGetInfoGET(int bookId, Criteria cri, Model model) {
 		//log.info("goodsGetInfo()........." + bookId);
 		ObjectMapper mapper = new ObjectMapper();
		
		// 카테고리 리스트 데이터
		try {
			model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
 		
 		// 상세 페이지 조건 정보 
 		model.addAttribute("cri", cri);
 		
 		// 상세 페이지 정보 
 		model.addAttribute("goodsInfo", adminService.goodsGetDetail(bookId));
 		
 	}
    
    // 상품 수정 
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(BookVO vo, RedirectAttributes rttr) {
		//log.info("goodsModifyPOST.........." + vo);
		int result = adminService.goodsModify(vo);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/readiya/goodsManage";		
		
	}
	
	// 상품 삭제
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int bookId, RedirectAttributes rttr) {
		log.info("goodsDeletePOST..........");
		int result = adminService.goodsDelete(bookId);
		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/readiya/goodsManage";
		
	}
    
    // 작가 등록 페이지 접속 
    @RequestMapping(value = "authorEnroll", method = RequestMethod.GET)
    public void authorEnrollGET() {
        //log.info("작가 등록 페이지 접속");
    }
    
    // 작가 등록
    @RequestMapping(value = "authorEnroll.do", method = RequestMethod.POST)
    public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) {
    	//log.info("authorEnroll: " + author);
    	authorService.authorEnroll(author);      //작가 등록 쿼리 수행
    	rttr.addFlashAttribute("enroll_result", author.getAuthorName());    // 등록 성공 메시지(작가이름)
    	return "redirect:/readiya/authorManage";
    }
    
    // 작가 관리 페이지 접속
    @RequestMapping(value = "authorManage", method = RequestMethod.GET)
    public void authorManageGET(Criteria cri, Model model) {
        //log.info("작가 관리 페이지 접속");
    	
    	// 작가 관리 목록 출력
        List list = authorService.authorGetList(cri);
        
        if(!list.isEmpty()) {
			model.addAttribute("list", list);	// 작가 데이터가 있을 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 작가 데이터가 없을 경우
		}
        
        // 페이지 이동 인터페이스 데이터 
        int total = authorService.authorGetTotal(cri);
        PageDTO pageMaker = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMaker);
        
    }
    
    // 작가 상세 페이지 
    @GetMapping({"/authorDetail", "/authorModify"})
	public void authorGetInfoGET(int authorId, Criteria cri, Model model) {
		//log.info("authorDetail......." + authorId);
		
		// 작가 관리 페이지 정보
		model.addAttribute("cri", cri);
		
		// 선택 작가 정보
		model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));
		
	}
    
    // 작가 수정 
	@PostMapping("/authorModify")
	public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr) {
		//log.info("authorModifyPOST......." + author);
		int result = authorService.authorModify(author);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/readiya/authorManage";
		
	}
	
	// 작가 삭제
	@PostMapping("/authorDelete")
	public String authorDeletePOST(int authorId, RedirectAttributes rttr) {
		log.info("authorDeletePOST..........");
		int result = 0;
		
		try {
			result = authorService.authorDelete(authorId);
		} catch (Exception e) {
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
	
			return "redirect:/readiya/authorManage";
			
		}
		
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/readiya/authorManage";
		
	}
	
	// 장바구니 등록
	@PostMapping("/goodsCart")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		HttpSession session = request.getSession();
		CustomerVO cvo = (CustomerVO)session.getAttribute("customer");
		
		// 카트 등록
		int result = cartService.addCart(cart);
		return result + "";
			
	}
	
}
