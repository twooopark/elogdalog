package com.edlog.boot.springboot.controller;

import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edlog.boot.springboot.config.ESConfig;
import com.edlog.boot.springboot.util.Aggregations;
import com.edlog.boot.springboot.util.GetDate;
import com.edlog.boot.springboot.util.Query;

@Controller
public class HomeController {
	@Autowired
	ESConfig esConfig;
	@Autowired
	Query query;
	@Autowired
	Aggregations aggs;
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
	@GetMapping("/test/{fieldName}/{value}")
	public String test(@PathVariable final String fieldName,
			@PathVariable final String value, Model model) throws UnknownHostException, ParseException {
		
		List<Map<String, Object>> list =  query.getQResponse(fieldName, value);
		Map<String, Object> map = list.get(0);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).get("conn_date"));
		}
		model.addAttribute("conn_id",map.get("conn_id"));
		model.addAttribute("conn_date",map.get("conn_date"));
		model.addAttribute("conn_ip",map.get("conn_ip"));
		model.addAttribute("action",map.get("action"));
		model.addAttribute("uri",map.get("uri"));
		
		//System.out.println(model.asMap());
		return "test";
	}
	@GetMapping("/form")
	public String form(Model model) throws UnknownHostException, ParseException {
				
//		String week = GetDate.getWeek();
//		int lastWeek = Integer.parseInt(week)-1;
//		String lastMonday = GetDate.getMonday(GetDate.getCurYear(), GetDate.getCurMonth(), lastWeek);
//		String lastSunday = GetDate.getSunday(GetDate.getCurYear(), GetDate.getCurMonth(), lastWeek);
		
		String lastMonday = GetDate.getCurMonday();
		String lastSunday = GetDate.getCurSunday();
		String period = lastMonday +" ~ " + lastSunday;
		String date = GetDate.getCurDay();
		
		long login_Y = query.getHits("action", "login_y");
		long login_N = query.getHits("action", "login_n");
		
		//query.formQuery(lastMonday, lastSunday, "");
		//System.out.println(model.asMap());
		
		model.addAttribute("date", date);
		model.addAttribute("period", period);
		model.addAttribute("login_Y", login_Y);
		model.addAttribute("login_N", login_N);
		System.out.println(login_Y +"/"+login_N);
		return "test";
	}
}
