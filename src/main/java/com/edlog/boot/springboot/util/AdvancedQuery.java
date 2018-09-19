package com.edlog.boot.springboot.util;

import java.io.IOException;
import java.net.UnknownHostException;
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
public class AdvancedQuery {

	@Autowired
	ESConfig esConfig;
	@Autowired
	QueryServiceImpl qs;
	@Autowired
	AggregationServiceImpl as;
	@Autowired
	ResponseServiceImpl rs;

	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;

	// text데이터 리턴
	public int getTextData(String serviceName, String startDate, String endDate, String fieldName, String value)
			throws UnknownHostException {
		QueryBuilder queryBuilder = qs.getMMBoolQuery(qs.formFilter(serviceName, startDate, endDate),
				qs.getTermQuery(fieldName, value));
		SearchResponse sr = rs.getSearchResponseWithQuery(queryBuilder);
		List<Map<String, Object>> list = rs.getResponseAsList(sr);
		return list.size();
	}

	// keyword데이터 리턴
	public int getKeywordData(String serviceName, String startDate, String endDate, String fieldName, String value)
			throws UnknownHostException {
		fieldName = fieldName + ".keyword";
		QueryBuilder queryBuilder = qs.getMMBoolQuery(qs.formFilter(serviceName, startDate, endDate),
				qs.getTermQuery(fieldName, value));
		SearchResponse sr = rs.getSearchResponseWithQuery(queryBuilder);
		List<Map<String, Object>> list = rs.getResponseAsList(sr);
		return list.size();
	}

	// script데이터 리턴
	public int getScriptData(String serviceName, String startDate, String endDate) throws UnknownHostException {
		QueryBuilder queryBuilder = qs.getMMnBoolQuery(qs.formFilter(serviceName, startDate, endDate),
				QueryBuilders.scriptQuery(new Script("doc.access_date.date.getHourOfDay() >= 8  "
						+ "&& doc.access_date.date.getHourOfDay() < 19 && doc.access_date.date.getDayOfWeek() < 6")));

		SearchResponse sr = rs.getSearchResponseWithQuery(queryBuilder);
		List<Map<String, Object>> list = rs.getResponseAsList(sr);
		return list.size();
	}

	//서비스 BucketList 리턴
	public Map<String, List<String>> getBucketList(String fieldName) {
		TermsAggregationBuilder aggregation = as.getTermsAggregation("service", fieldName);
		SearchResponse sr = rs.getSearchResponseWithAggs(aggregation);

		Map<String, List<String>> map = rs.getAllBucketAsMap(sr, "service");
		return map;
	}

	// Response를 list로 리턴
	public List<Map<String, Object>> getReponseToList(String serviceName, String startDate, String endDate)
			throws UnknownHostException {
		QueryBuilder queryBuilder = qs.getMBoolQuery(qs.formFilter(serviceName, startDate, endDate));
		SearchResponse sr = rs.getSearchResponseWithQuery(queryBuilder);

		List<Map<String, Object>> tempList = rs.getResponseAsList(sr);

		return tempList;
	}

	// 과다조회 map형태로 리턴
	public Map<String, List<String>> getExBucketAsMap(String serviceName, String startDate, String endDate,
			String fieldName) throws IOException {

		QueryBuilder queryBuilder = qs.getMBoolQuery(qs.formFilter(serviceName, startDate, endDate));
		TermsAggregationBuilder aggregation = as.getTermsAggregation("accessId", fieldName);

		SearchResponse sr = rs.getSearchResponseIncludeAggs(queryBuilder, aggregation);

		Map<String, List<String>> map = rs.getBucketAsExMap(sr, "accessId");

		return map;
	}
}
