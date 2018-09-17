package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.Aggregation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edlog.boot.springboot.service.QueryServiceImpl;
import com.edlog.boot.springboot.util.Aggregations;
import com.edlog.boot.springboot.util.Query;

@RestController

@RequestMapping("/aggs")
public class AggregationController {

	@Autowired
	Query query;
	@Autowired
	QueryServiceImpl qb;
	@Autowired
	Aggregations aggs;

	// final static Logger logger =
	// LoggerFactory.getLogger(AggregationController.class);

	@GetMapping("/get/{fieldName}")
	public String aggs(@PathVariable final String fieldName) throws IOException {
		// System.out.println(aggsName + fieldName);

		Map<String, Aggregation> responseMap = aggs.getAResponse(fieldName);
		
//		Set<String> keySet = responseMap.keySet();
//		List<String> setList = new ArrayList<String>(keySet);
//		for (int i = 0; i < setList.size(); i++) {
//			System.out.println(setList.get(i));
//		}

		String detail = responseMap.get("aggsName").toString();
		long hits = aggs.getHits(fieldName);

		return detail + "	totalHits==" + hits;

	}
	@GetMapping("/getKeyList/{fieldName}")
	public String keyList(@PathVariable final String fieldName) throws IOException {
		// System.out.println(aggsName + fieldName);

		Map<String, List<String>> keyMap = aggs.getKeyList(fieldName);
		List<String> keyList = keyMap.get("keyList");
		List<String> docCountList = keyMap.get("docCountList");
		
		//long hits = aggs.getHits(fieldName);
		int keyListSize = keyList.size();
		for(int i = 0; i < keyListSize; i++) {
			System.out.println(keyList.get(i));
		}
		String klsToString = Integer.toString(keyList.size());
		int docCountListSize = docCountList.size();
		//long hits = aggs.getHits(fieldName);
		
		for(int i = 0; i < docCountListSize; i++) {
			System.out.println(docCountList.get(i));
		}
		String dclToString = Integer.toString(keyList.size());
		
		return klsToString +"/" + dclToString;
	}
	@GetMapping("/doubleAggs/{fieldName1}/{fieldName2}")
	public String doubleAggs(@PathVariable final String fieldName1, @PathVariable final String fieldName2) throws IOException {
		// System.out.println(aggsName + fieldName);

		Map<String, List<String>> keyMap = aggs.doubleAggs(fieldName1, fieldName2);
		List<String> keyList = keyMap.get("keyList");
		List<String> twoList = keyMap.get("twoList");
		
		
		//long hits = aggs.getHits(fieldName);
		int keyListSize = keyList.size();
		int twoListSize = twoList.size();
		for(int i = 0; i < keyListSize; i++) {
			System.out.println(keyList.get(i) +" - >> 1");
			
		}
		for(int i = 0; i < twoListSize; i++) {
			System.out.println(twoList.get(i) +" - >> 2");
			
		}
		
		String klsToString = Integer.toString(keyList.size());
		String tToString = Integer.toString(twoList.size());
		return klsToString + " / " + tToString;
	}
	

	@GetMapping("/query/{fieldName}/{value}")
	public Map<String, Object> query(@PathVariable final String fieldName, @PathVariable final String value)
			throws UnknownHostException {

		List<Map<String, Object>> list = query.getQResponse(fieldName, value);

		int size = list.size();
		
		System.out.println(list.get(0));
		System.out.println(size);
		return list.get(0);
	}
	@GetMapping("/bool/{fieldName1}/{value1}/{fieldName2}/{value2}")
	public String bool(@PathVariable final String fieldName1, 
			@PathVariable final String value1, @PathVariable final String fieldName2, @PathVariable final String value2)
			throws UnknownHostException {

		QueryBuilder boolQuery = query.boolQuery(fieldName1, value1, fieldName2, value2);
		//QueryBuilder rangeQuery = query.getDateRange("2018-08-10", "2018-08-20");
		SearchResponse sr = qb.getSearchResponse(boolQuery);
		List<Map<String, Object>> boolList = qb.getResponseAsList(sr);
		int size = boolList.size();
		System.out.println(size);
		
		String text = null;
		for(int i = 0; i < size; i++) {
			text += boolList.get(i).toString();
			String file_path = (String) boolList.get(i).get("file_path");
			String server = (String) boolList.get(i).get("server");
			String access_uri = (String) boolList.get(i).get("access_uri");
			String offset = Integer.toString((int) boolList.get(i).get("offset"));
			String access_date = (String) boolList.get(i).get("access_date");
			String remark = (String) boolList.get(i).get("remark");
			String source = (String) boolList.get(i).get("source");
			String message = (String) boolList.get(i).get("message");
			String access_ip = (String) boolList.get(i).get("access_ip");
			String file_date = (String) boolList.get(i).get("file_date");
			String unicro = (String) boolList.get(i).get("service");
			String access_id = (String) boolList.get(i).get("access_id");
			String action = (String) boolList.get(i).get("action");
			
			System.out.println(file_path +"//"+ server +"//"+ access_uri +"//"+ offset +"//"+ access_date
					+"//"+ remark +"//"+ source +"//"+ message +"//"+ access_ip +"//"+ file_date +"//"+ unicro 
					+"//"+ access_id +"//"+ action);
		}
		
		return text;	
	}
	
	@GetMapping("/formTest")
	public String formTest() throws UnknownHostException {
		
		SearchResponse sr = qb.getSearchResponse(qb.formFilter("unicro", "2018-08-10", "2018-08-20"));
		List<Map<String, Object>> formList = qb.getResponseAsList(sr);
		int formListSize = formList.size();
		System.out.println(formListSize);
		String text = null;
		for(int i = 0; i < formListSize; i++) {
			text += formList.get(i).toString();
			String file_path = (String) formList.get(i).get("file_path");
			String server = (String) formList.get(i).get("server");
			String access_uri = (String) formList.get(i).get("access_uri");
			String offset = Integer.toString((int) formList.get(i).get("offset"));
			String access_date = (String) formList.get(i).get("access_date");
			String remark = (String) formList.get(i).get("remark");
			String source = (String) formList.get(i).get("source");
			String message = (String) formList.get(i).get("message");
			String access_ip = (String) formList.get(i).get("access_ip");
			String file_date = (String) formList.get(i).get("file_date");
			String unicro = (String) formList.get(i).get("service");
			String access_id = (String) formList.get(i).get("access_id");
			String action = (String) formList.get(i).get("action");
			
			System.out.println(file_path +"//"+ server +"//"+ access_uri +"//"+ offset +"//"+ access_date
					+"//"+ remark +"//"+ source +"//"+ message +"//"+ access_ip +"//"+ file_date +"//"+ unicro 
					+"//"+ access_id +"//"+ action);
		}
		System.out.println(formList.get(0));
		return text;
	}
	
	@GetMapping("/booltest/{fieldName1}/{value1}/{fieldName2}/{value2}")
	public Map<String, Object> boolTest(@PathVariable final String fieldName1, 
			@PathVariable final String value1, @PathVariable final String fieldName2, @PathVariable final String value2)
			throws UnknownHostException {

//		List<Map<String, Object>> list = query.boolQuery(fieldName1, value1, fieldName2, value2);
//
//		Map<String, Object> map = list.get(0);
//		int size = list.size();
//		QueryBuilder rangeQuery = query.getDateRange("2018-08-10", "2018-08-20");
//
//		System.out.println(list.get(0));
//		System.out.println(size);
//		return list.get(0);
		return null;
	}
	@GetMapping("/rangetest/{startDate}/{endDate}")
	public Map<String, Object> range(@PathVariable final String startDate, @PathVariable final String endDate)
			throws UnknownHostException {
//
//		QueryBuilder rangeQuery = query.getDateRange(startDate, endDate);
//		
//		Map<String, Object> map = list.get(0);
//		int size = list.size();
//		
//
//		System.out.println(list.get(0));
//		System.out.println(size);
//		return list.get(0);
		return null;
	}

}
