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
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.filter.Filters;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms.Bucket;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.edlog.boot.springboot.config.ESConfig;
import com.edlog.boot.springboot.service.QueryServiceImpl;

@Configuration
public class GenerateForm {

	@Autowired
	ESConfig esConfig;
	@Autowired
	QueryServiceImpl qb;
	@Autowired
	Aggregations aggs;
	@Autowired
	IpValidationCheck ivcheck;

	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;
	private int externalCount = 0;
	private int unAuthCount = 0;
	private List<String> externalIpList = new ArrayList<String>();
	private List<String> unAuthIpList = new ArrayList<String>();

	// text데이터 리턴
	public int getTextData(String serviceName, String startDate, String endDate, String fieldName, String value)
			throws UnknownHostException {
		QueryBuilder queryBuilder = qb.getMMBoolQuery(qb.formFilter(serviceName, startDate, endDate),
				qb.getTermQuery(fieldName, value));
		SearchResponse sr = qb.getSearchResponse(queryBuilder);
		List<Map<String, Object>> list = qb.getResponseAsList(sr);
		return list.size();
	}

	// keyword데이터 리턴
	public int getKeywordData(String serviceName, String startDate, String endDate, String fieldName, String value)
			throws UnknownHostException {
		fieldName = fieldName + ".keyword";
		QueryBuilder queryBuilder = qb.getMMBoolQuery(qb.formFilter(serviceName, startDate, endDate),
				qb.getTermQuery(fieldName, value));
		SearchResponse sr = qb.getSearchResponse(queryBuilder);
		List<Map<String, Object>> list = qb.getResponseAsList(sr);
		return list.size();
	}

	// script데이터 리턴
	public int getScriptData(String serviceName, String startDate, String endDate)
			throws UnknownHostException {
		QueryBuilder queryBuilder = qb.getMMnBoolQuery(qb.formFilter(serviceName, startDate, endDate), 
				QueryBuilders.scriptQuery(new Script("doc.access_date.date.getHourOfDay() >= 8  "
						+ "&& doc.access_date.date.getHourOfDay() < 19 && doc.access_date.date.getDayOfWeek() < 6")));

		SearchResponse sr = qb.getSearchResponse(queryBuilder);
		List<Map<String, Object>> list = qb.getResponseAsList(sr);
		return list.size();
	}

	// ip체크 결과 리턴
	public Map<String, List<String>> getIpValidation(String serviceName, String startDate, String endDate)
			throws UnknownHostException {

		Map<String, List<String>> listMap = new HashMap<String, List<String>>();
		QueryBuilder queryBuilder = qb.getMBoolQuery(qb.formFilter(serviceName, startDate, endDate));
		SearchResponse sr = qb.getSearchResponse(queryBuilder);

		List<Map<String, Object>> tempList = qb.getResponseAsList(sr);
		List<String> countList = new ArrayList<String>();

		for (Map<String, Object> map : tempList) {
			String tempIp = (String) map.get("access_ip");

			if (!ivcheck.checkOfficial(tempIp)) {
				externalCount++;
				externalIpList.add(tempIp);
				if (!ivcheck.checkExternal(tempIp)) {
					unAuthCount++;
					unAuthIpList.add(tempIp);
				}
			}
		}
		countList.add(Integer.toString(externalCount));
		countList.add(Integer.toString(unAuthCount));

		listMap.put("countList", countList);
		listMap.put("externalIpList", externalIpList);
		listMap.put("unAuthIpList", unAuthIpList);

		return listMap;
	}

	// 과다조회 결과 리턴
	public Map<String, List<String>> getExcessiveAccess(String serviceName, String startDate, String endDate,
			String fieldName) throws IOException {

		QueryBuilder queryBuilder = qb.getMBoolQuery(qb.formFilter(serviceName, startDate, endDate));
		TermsAggregationBuilder aggregation = qb.getTermsAggregation("eccess_id", fieldName);

		SearchResponse sr = qb.getSearchResponseIncludeAggs(queryBuilder, aggregation);

		List<String> keyList = new ArrayList<String>();
		List<String> docCountList = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		Terms terms = sr.getAggregations().get("eccess_id");

		for (Bucket entry : terms.getBuckets()) {
			if (entry.getDocCount() > 10) {
				keyList.add(entry.getKeyAsString());
				docCountList.add(Long.toString(entry.getDocCount()));
			}
		}
		map.put("keyList", keyList);
		map.put("docCountList", docCountList);
		
		return map;
	}
}
