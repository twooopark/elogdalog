package com.edlog.boot.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String home() {
		return "login";
	}
	@RequestMapping("loginPage")
	public String loginPage() {
		return "login";
	}
	@RequestMapping("/homepage")
	public String homepage() {
		return "homepage";
	}
	@RequestMapping("/analyze")
	public String analyze() {
		return "analyze";
	}
	@RequestMapping("/document")
	public String document() {
		return "document";
	}
	@RequestMapping("/filterGen")
	public String filterGen() {
		return "filterGen";
	}
}
