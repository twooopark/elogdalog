package com.edlog.boot.springboot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @author CHAEHEE
 *
 */
@Controller
public class PageController {
	@Autowired HttpSession session;
	
	@RequestMapping("/")public String home() {return "member/login";}
	
	@RequestMapping("/homepage")public String homepage() {return "homepage";}
	@RequestMapping("/analyze")public String analyze() {return "analyze";}
	@RequestMapping("/document")public String document() {return "document";}
	
}
