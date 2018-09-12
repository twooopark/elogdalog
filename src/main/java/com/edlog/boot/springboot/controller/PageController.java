package com.edlog.boot.springboot.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edlog.boot.springboot.model.MemberDTO;
import com.edlog.boot.springboot.service.MemberService;
/**
 * 
 * @author CHAEHEE
 *
 */
@Controller
public class PageController {
	@Autowired MemberService Mservice;
	@Autowired HttpSession session;
	
	@RequestMapping("/")public String home() {return "login";}
	@RequestMapping("/loginPage")public String loginPage() {return "login";}
	@RequestMapping("/homepage")public String homepage() {return "homepage";}
	@RequestMapping("/analyze")public String analyze() {return "analyze";}
	@RequestMapping("/document")public String document() {return "document";}
	
	@RequestMapping("/login")
	public String loginCheck(MemberDTO member, HttpServletResponse response) {
		return "homepage";
	}
	
	@RequestMapping("/signup")
	public String signup(MemberDTO member, HttpServletResponse response) {
		return "";
	}
}
