package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
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
	
	private Map<String, List<String>> ipListMap = new HashMap<String, List<String>>();
	private Map<String, String> exAccess = new HashMap<String, String>();
	private List<String> serviceList = new ArrayList<String>();
	private List<String> ipValidationList = new ArrayList<String>();
	private Map<String, String> loginMap = new HashMap<String, String>();
	private Map<String, Object> fommatMap = new HashMap<>();

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
		ipListMap.clear();
		exAccess.clear();
		serviceList.clear();
		ipValidationList.clear();
		loginMap.clear();
		
		String date = GetDate.getCurDay();
		
		// 넘겨받은 데이터 변수에 세팅
		String serviceName = data.getServiceName();
		String startDate = data.getStartDate();
		String endDate = data.getEndDate();
		String period = startDate + " ~ " + endDate;
		String fieldName = "action";

		loginMap = gf.getLoginData(serviceName, startDate, endDate, fieldName);
		int downloadCount = gf.getDownloadCount(serviceName, startDate, endDate, fieldName);
		int overtimeAccess = gf.getOvertimeAccess(serviceName, startDate, endDate);
		serviceList = gf.getServiceList(fieldName);
		exAccess = gf.getExcessiveAccess(serviceName, startDate, endDate, fieldName);
		ipListMap = gf.getIpValidation(serviceName, startDate, endDate);
		ipValidationList = ipListMap.get("countList");

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

		// model에 값 전달
		fommatMap.put("formmat", formmat);

		return fommatMap;
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
