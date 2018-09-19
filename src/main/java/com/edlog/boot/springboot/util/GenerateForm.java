package com.edlog.boot.springboot.util;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.script.Script;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.edlog.boot.springboot.config.ESConfig;
import com.edlog.boot.springboot.service.AggregationServiceImpl;
import com.edlog.boot.springboot.service.QueryServiceImpl;
import com.edlog.boot.springboot.service.ResponseServiceImpl;

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
	public Map<String, List<String>> getIpValidation(String serviceName, String startDate, String endDate)
			throws UnknownHostException {

		List<Map<String, Object>> tempList = aq.getReponseToList(serviceName, startDate, endDate);

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
		ipListMap.put("countList", countList);
		ipListMap.put("externalIpList", externalIpList);
		ipListMap.put("unAuthIpList", unAuthIpList);

		return ipListMap;
	}

	// 과다 조회 데이터 처리
	public Map<String, String> getExcessiveAccess(String serviceName, String startDate, String endDate,
			String fieldName) throws IOException {
		
		Map<String, List<String>> exAccess = aq.getAllBucketAsMap(serviceName, startDate, endDate,
				"access_id.keyword");
		
		
		if (!exAccess.isEmpty()) {
			keyList = exAccess.get("keyList");
			System.out.println(keyList.get(0));
			docCountList = exAccess.get("docCountList");
			exAccessCount = Integer.toString(keyList.size());
			for (int i = 0; i < keyList.size(); i++) {
				exAccessId += keyList.get(i) + "(" + docCountList.get(i) + "회)<br/>";
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
