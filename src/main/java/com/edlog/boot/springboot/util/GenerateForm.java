package com.edlog.boot.springboot.util;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GenerateForm {

	@Autowired
	AdvancedQuery aq;
	@Autowired
	IpValidationCheck ivcheck;

	private int externalCount = 0;
	private int unAuthCount = 0;
	private int loginY = 0;
	private int loginN = 0;
	private int accessTry = 0;
	private int downloadCount = 0;
	private int overtimeAccess = 0;
	private String exAccessCount = "";
	private String exAccessId = "";
	private List<String> keyList = new ArrayList<String>();
	private List<String> docCountList = new ArrayList<String>();
	private List<String> countList = new ArrayList<String>();
	private Map<String, String> loginMap = new HashMap<String, String>();
	private Map<String, List<String>> ipListMap = new HashMap<String, List<String>>();
	private List<String> externalIpList = new ArrayList<String>();
	private List<String> unAuthIpList = new ArrayList<String>();
	private Map<String, List<String>> exAccess = new HashMap<String, List<String>>();
	private List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();

	// 로그인 데이터 처리
	public Map<String, String> getLoginData(String serviceName, String startDate, String endDate, String fieldName)
			throws UnknownHostException {
		
		loginY = aq.getTextData(serviceName, startDate, endDate, fieldName, "login_y");
		loginN = aq.getTextData(serviceName, startDate, endDate, fieldName, "login_n");
		accessTry = loginN + loginY;
		loginMap.put("loginY", Integer.toString(loginY));
		loginMap.put("accessTry", Integer.toString(accessTry));
		
		return loginMap;
	}

	// 개인정보 다운로드 데이터 처리
	public int getDownloadCount(String serviceName, String startDate, String endDate, String fieldName)
			throws UnknownHostException {

		downloadCount = aq.getKeywordData(serviceName, startDate, endDate, fieldName, "excelDownload");

		return downloadCount;
	}

	// 근무시간 외 접근 판단
	public int getOvertimeAccess(String serviceName, String startDate, String endDate)
			throws UnknownHostException {

		overtimeAccess = aq.getScriptData(serviceName, startDate, endDate);

		return overtimeAccess;
	}
	
	// ServiceNameList 리턴
	public List<String> getServiceList(String fieldName) {

		List<String> serviceList = aq.getBucketList("service.keyword").get("keyList");
		
		return serviceList;
	}

	// ip체크 결과 리턴
	public Map<String, List<String>> getIpValidation(String serviceName, String startDate, String endDate){
		
		ipListMap.clear();
		
		try {
			tempList = aq.getReponseToList(serviceName, startDate, endDate);
		} catch (UnknownHostException e) {
			
			e.printStackTrace();
		}
		externalCount = 0;
		unAuthCount = 0;
		for (Map<String, Object> map : tempList) {
			String tempIp = (String) map.get("access_ip");
			if (!ivcheck.checkOfficial(tempIp)) {
				if (ivcheck.checkExternal(tempIp)) {
					externalCount++;
					externalIpList.add(tempIp);
				}
				else if (!ivcheck.checkExternal(tempIp)) {
					unAuthCount++;
					unAuthIpList.add(tempIp);
				}
			}
		}
		countList.add(Integer.toString(externalCount));
		countList.add(Integer.toString(unAuthCount));

		ipListMap.put("countList", countList);
		ipListMap.put("externalIpList", externalIpList);
		ipListMap.put("unAuthIpList", unAuthIpList);

		return ipListMap;
	}

	// 과다 조회 데이터 처리
	public Map<String, String> getExcessiveAccess(String serviceName, String startDate, String endDate,
			String fieldName) {
		
		try {
			exAccess = aq.getExBucketAsMap(serviceName, startDate, endDate,
					"access_id.keyword");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if (!exAccess.isEmpty()) {
			keyList = exAccess.get("keyList");
			docCountList = exAccess.get("docCountList");
			exAccessCount = Integer.toString(keyList.size());
			int i = 0;
			for (String key : keyList) {
				exAccessId += key + "(" + docCountList.get(i) + "회)<br/>";
				i++;
			}
		} else {
			exAccessCount = "0";
			exAccessId = "내역 없음";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("exAccessCount", exAccessCount);
		map.put("exAccessId", exAccessId);
		
		return map;
	}
}
