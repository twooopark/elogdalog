package com.edlog.boot.springboot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edlog.boot.springboot.DTO.MemberDTO;
import com.edlog.boot.springboot.service.MemberServiceImpl;

/**
 * 
 * @author CHAEHEE
 *	Spring Security 설정을 위한 클래스
 */
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired MemberServiceImpl memberService;
	@Autowired HttpSession session;
	
	@RequestMapping(value="/loginCheck")
	public void loginOK(MemberDTO member,HttpServletResponse response) throws Exception {
		memberService.loginCheck(member, response,session);
	}
	
	@RequestMapping("/registration")
	public String signup() {
		return "member/registration";
	}
	
	@RequestMapping(value="/newRegit", method=RequestMethod.POST)
	public void newRegit(MemberDTO member,HttpServletRequest request) throws Exception {
		memberService.newRegit(member);
	}
}
