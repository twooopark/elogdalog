package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edlog.boot.springboot.DTO.DataDTO;
import com.edlog.boot.springboot.DTO.FormDTO;
import com.edlog.boot.springboot.service.MemberServiceImpl;
import com.edlog.boot.springboot.util.GenerateForm;
import com.edlog.boot.springboot.util.GetDate;

/**
 * 
 * @author CHAEHEE
 *
 */
@Controller
public class PageController {
	
	@Autowired
	GenerateForm gf;
	@Autowired
	FormDTO formmat;
	@Autowired
	MemberServiceImpl Mservice;
	@Autowired
	HttpSession session;

	@RequestMapping("/")
	public String home() {
		return "member/login";
	}

	@RequestMapping("/homepage")
	public String homepage() {
		return "homepage";
	}

	@RequestMapping("/analyze")
	public String analyze() {
		return "analyze";
	}
	
//
//	RequestMapping("/document")
//	@ResponseBody
//	public String formmatpost(Model model, @RequestBody DataDTO data ) throws ParseException, IOException, JSONException {
//		String serviceName = "donutbook";
//		String startDate = "2018-08-13";
//		String endDate = "2018-08-15";
//		String fieldName = "action";
//		
//		System.out.println(data);
//		return "document";
//	}

	@PostMapping("/document")
	@ResponseBody
	public String formmat(Model model, @RequestBody DataDTO data ) throws ParseException, IOException, JSONException {
		String serviceName = "donutbook";
		String startDate = "2018-08-13";
		String endDate = "2018-08-15";
		String fieldName = "action";
		
		System.out.println(data);
//		"startDate" : startDate,
//		"endDate" : endDate,
//		"serviceName" : serviceName
		
//		try {
//			jsonToString = json.get("data").toString();
//			System.out.println(jsonToString);
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
		
		//날짜 처리
		String lastMonday = GetDate.getCurMonday();
		String lastSunday = GetDate.getCurSunday();
		String period = lastMonday +" ~ " + lastSunday;
		String date = GetDate.getCurDay();
	
		//로그인 데이터 처리
		int loginY = 0;
		int loginN = 0;
		int accessTry = 0;
		loginY = gf.getTextData(serviceName, startDate, endDate, fieldName, "login_y");
		loginN = gf.getTextData(serviceName, startDate, endDate, fieldName, "login_n");
		accessTry = loginN + loginY;
		
		//과다 조회 데이터 처리
		Map<String, List<String>> exAccess = gf.getExcessiveAccess(serviceName, startDate, endDate,"access_id.keyword");
		List<String> keyList = null;
		List<String> docCountList = null;
		String exAccessCount = null;
		String exAccessId = "";
		
		if(!exAccess.isEmpty()) {
			keyList = exAccess.get("keyList");
			docCountList = exAccess.get("docCountList");
			exAccessCount = Integer.toString(keyList.size());
			for(int i = 0; i < keyList.size(); i++) {
				exAccessId += keyList.get(i) + "(" + docCountList.get(i) + "회)<br/>";
			}
		} else {
			exAccessCount = "0";
			exAccessId = "내역 없음";
		}
		//개인정보 다운로드 데이터 처리
		int downloadCount = 0;
		downloadCount = gf.getKeywordData(serviceName, startDate, endDate, fieldName, "excelDownload");
		
		//access_ip 판단
		Map<String, List<String>> ipListMap;
		ipListMap = gf.getIpValidation(serviceName, startDate, endDate);
		List<String> ipValidationList = ipListMap.get("countList");
		List<String> externalIpList = ipListMap.get("externalIpList");
		List<String> unAuthIpList = ipListMap.get("unAuthIpList");
		
		//근무시간 외 접근 판단
		int overtimeAccess = 0;
		overtimeAccess = gf.getScriptData(serviceName, startDate, endDate);
		
		//serviceList 얻기
		List<String> serviceList = gf.getServiceList("service.keyword").get("keyList");
				
		
		//formmat 객체에 변수 셋팅
		formmat.setDate(date);
		formmat.setPeriod(period);
		formmat.setAccessTry(accessTry);
		formmat.setLoginY(loginY);
		formmat.setExAccessCount(exAccessCount);
		formmat.setExAccessId(exAccessId);
		formmat.setDownloadCount(downloadCount);
		formmat.setExternalAccess(ipValidationList.get(0));
		formmat.setUnAuthAccess(ipValidationList.get(1));
		formmat.setExternalIpList(externalIpList);
		formmat.setUnAuthIpList(unAuthIpList);
		formmat.setOvertimeAccess(overtimeAccess);
		
		
		//model에 값 전달
		model.addAttribute("formmat", formmat);
		model.addAttribute("serviceList", serviceList);
		model.addAttribute("serviceListSize", serviceList.size());
		return "document";
	}

}
