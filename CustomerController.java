package com.readiya.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.readiya.domain.CustomerVO;
import com.readiya.service.CustomerService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@RequiredArgsConstructor
@RequestMapping("/customer")
@Log4j
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@Autowired
    private JavaMailSender mailSender;

	
	// 회원가입 페이지 이동
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGet() {
		//log.info("회원가입 페이지 이동");
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registerPOST(CustomerVO customer, RedirectAttributes rttr) {
		//log.info("------------------------------");
		int result = 0;
		
		// 회원가입 서비스 실행
		customerService.register(customer);
		rttr.addFlashAttribute("register_result", result);
		//log.info("회원가입 성공");
		
		return "redirect:../main";
		
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGet() {
		//log.info("로그인 페이지 이동");
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/customerIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String customerIdChkPost(String customerId) {
		// log.info("customerIdChk() 진입");
		int result = customerService.idCheck(customerId);
		//log.info("결과값: " + result);
		
		if (result != 0) {
			return "fail";     // 가입한 아이디가 있음
		}else if (customerId == "") {
			result = 2;
			return "no";
		}else {
			return "success";  // 가입한 아이디가 없음
		}
	}
	
	// 이메일 인증하기
    @RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        // 뷰(View)로부터 넘어온 데이터 확인 
        //log.info("이메일 데이터 전송 확인");
       // log.info("인증번호 : " + email);
                
        // 인증번호(난수) 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호: " + checkNum);
        
        // 이메일 보내기 
        String setFrom = "ijunmin94@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            
            mailSender.send(message);
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        
        String num = Integer.toString(checkNum);
        return num;
    }
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, CustomerVO customer, RedirectAttributes rttr) throws Exception{
        
        //log.info("login 메서드 진입");
        //log.info("전달된 데이터 : " + customer);
    	
    	HttpSession session = request.getSession();
    	CustomerVO lvo = customerService.customerLogin(customer);
    	
    	
    	if (lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/customer/login";
        }
        
        session.setAttribute("customer", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:../main";

    }
    
    // 로그아웃
    @RequestMapping(value = "logout.do", method = RequestMethod.POST)
    @ResponseBody
    public String logoutPOST(HttpServletRequest request) {
        //log.info("logoutPOST 메소드 실행");
        HttpSession session = request.getSession();
        session.invalidate();
        
        return "redirect:../main";
        
    }
    
	
}
