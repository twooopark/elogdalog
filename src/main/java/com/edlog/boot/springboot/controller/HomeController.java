package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edlog.boot.springboot.service.QueryServiceImpl;
import com.edlog.boot.springboot.config.ESConfig;
import com.edlog.boot.springboot.util.GenerateForm;
import com.edlog.boot.springboot.util.GetDate;
import com.edlog.boot.springboot.util.Query;

@Controller
public class HomeController {
	@Autowired
	ESConfig esConfig;
	@Autowired
	Query query;
	@Autowired
	QueryServiceImpl qb;
	@Autowired
	GenerateForm gf;
	
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
	public String form(Model model) throws ParseException, IOException {
		String serviceName = "donutbook";
		String startDate = "2018-08-10";
		String endDate = "2018-08-20";
		String fieldName = "action";
		
				
		//날짜 처리
		String lastMonday = GetDate.getCurMonday();
		String lastSunday = GetDate.getCurSunday();
		String period = lastMonday +" ~ " + lastSunday;
		String date = GetDate.getCurDay();
	
		//로그인 데이터 처리
		int login_Y = 0;
		int login_N = 0;
		int accessTry = 0;
		login_Y = gf.getLoginData(serviceName, startDate, endDate, fieldName, "login_y");
		login_N = gf.getLoginData(serviceName, startDate, endDate, fieldName, "login_n");
		accessTry = login_N + login_Y;
		
		//과다 조회 데이터 처리
		Map<String, List<String>> exAccess = gf.getExcessiveAccess(serviceName, startDate, endDate,"access_id.keyword");
		List<String> keyList = null;
		List<String> docCountList = null;
		String keyListSize = null;
		String exText = "";
		
		if(!exAccess.isEmpty()) {
			keyList = exAccess.get("keyList");
			docCountList = exAccess.get("docCountList");
			keyListSize = Integer.toString(keyList.size());
			for(int i = 0; i < keyList.size(); i++) {
				exText += keyList.get(i) + "(" + docCountList.get(i) + "회)<br/>";
			}
		} else {
			keyListSize = "0";
			exText = "내역 없음";
		}
		//개인정보 다운로드 데이터 처리
		int downloadCount = 0;
		downloadCount = gf.getLoginData(serviceName, startDate, endDate, fieldName, "excelDownload");
		
		
		//모델에 더하기
		model.addAttribute("date", date);
		model.addAttribute("period", period);
		model.addAttribute("accessTry", accessTry);
		model.addAttribute("login_Y", login_Y);
		model.addAttribute("exAccessCount", keyListSize);
		model.addAttribute("exAccessId", exText);
		model.addAttribute("downloadCount", downloadCount);
		
		
		System.out.println(accessTry +"/"+login_Y);
		System.out.println(exText);
		System.out.println(downloadCount);
		return "test";
	}
}
