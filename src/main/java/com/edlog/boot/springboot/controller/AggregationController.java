package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.Aggregation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edlog.boot.springboot.util.Aggregations;
import com.edlog.boot.springboot.util.Query;

@RestController

@RequestMapping("/aggs")
public class AggregationController {

	@Autowired
	Query query;

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

		Map<String, Object> map = list.get(0);
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
		List<Map<String, Object>> boolList = query.getSearchResponse(boolQuery);
		
		int size = boolList.size();
		System.out.println(boolList.get(0));
		System.out.println(size);
		
		String text = null;
		for(int i = 0; i < size; i++) {
			text += boolList.get(i).toString();
			System.out.println(boolList.get(i));
		}
		
//		List<Map<String, Object>> rangelist = query.getSearchResponse(rangeQuery);
//		int bsize = rangelist.size();
//		System.out.println(rangelist.get(0));
//		System.out.println(bsize);
		
		return text;	
	}
	
	@GetMapping("/nested/{fieldName1}/{value1}/{fieldName2}/{value2}")
	public Map<String, Object> nested(@PathVariable final String fieldName1, 
			@PathVariable final String value1, @PathVariable final String fieldName2, @PathVariable final String value2)
			throws UnknownHostException {

		QueryBuilder rangeQuery = query.getDateRange("2018-08-10", "2018-08-20");
		
		List<Map<String, Object>> rangeList = query.getSearchResponse(rangeQuery);
		
		List<Map<String, Object>> nestedList = query.getSearchResponse(rangeQuery);
		//List<Map<String, Object>> rangeList = query.getSearchResponse(rangeQuery);
		
		
		int size = rangeList.size();
		System.out.println(rangeList.get(0));
		System.out.println(size);
		
		//rangeList.
		
		return rangeList.get(0);	
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
