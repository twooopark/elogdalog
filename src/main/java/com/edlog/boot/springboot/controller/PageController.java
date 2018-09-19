package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String home1() {
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

	@PostMapping(value = "/document")
	@ResponseBody
	public Map<String, Object> document(@RequestBody DataDTO data) throws ParseException, IOException, JSONException {

		// 날짜 처리
		String lastMonday = GetDate.getCurMonday();
		String lastSunday = GetDate.getCurSunday();
		String period = lastMonday + " ~ " + lastSunday;
		String date = GetDate.getCurDay();

		// 넘겨받은 데이터 변수에 세팅
		String serviceName = data.getServiceName();
		String startDate = data.getStartDate();
		String endDate = data.getEndDate();
		String fieldName = "action";

		Map<String, String> loginMap = gf.getLoginData(serviceName, startDate, endDate, fieldName);
		int downloadCount = gf.getDownloadCount(serviceName, startDate, endDate, fieldName);
		int overtimeAccess = gf.getOvertimeAccess(serviceName, startDate, endDate);
		List<String> serviceList = gf.getServiceList(fieldName);
		Map<String, String> exAccess = gf.getExcessiveAccess(serviceName, startDate, endDate, fieldName);
		Map<String, List<String>> ipListMap = gf.getIpValidation(serviceName, startDate, endDate);
		List<String> ipValidationList = ipListMap.get("countList");

		// formmat 객체에 변수 셋팅
		formmat.setDate(date);
		formmat.setPeriod(period);
		formmat.setAccessTry(Integer.parseInt(loginMap.get("accessTry")));
		formmat.setLoginY(Integer.parseInt(loginMap.get("loginY")));
		formmat.setExAccessCount(exAccess.get("exAccessCount"));
		formmat.setExAccessId(exAccess.get("exAccessId"));
		formmat.setDownloadCount(downloadCount);
		formmat.setExternalAccess(ipValidationList.get(0));
		formmat.setUnAuthAccess(ipValidationList.get(1));
		formmat.setExternalIpList(ipListMap.get("externalIpList"));
		formmat.setUnAuthIpList(ipListMap.get("unAuthIpList"));
		formmat.setOvertimeAccess(overtimeAccess);
		formmat.setServiceList(serviceList);
		formmat.setServiceListSize(serviceList.size());

		Map<String, Object> map = new HashMap<>();

		// model에 값 전달
		map.put("formmat", formmat);

		return map;
	}

	@GetMapping(value = "/document")
	public String doc(Model model) throws ParseException {

		// serviceList 얻기
		List<String> serviceList = gf.getServiceList("service.keyword");
		model.addAttribute("serviceList", serviceList);
		model.addAttribute("serviceListSize", serviceList.size());

		return "document";
	}

}
