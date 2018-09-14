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
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

<<<<<<< HEAD
=======
import com.edlog.boot.springboot.service.QueryServiceImpl;
>>>>>>> chaehee
import com.edlog.boot.springboot.config.ESConfig;
import com.edlog.boot.springboot.service.QueryServiceImpl;

@Configuration
public class GenerateForm {

	@Autowired
	ESConfig esConfig;
	@Autowired
	Query query;
	@Autowired
	QueryServiceImpl qb;
	@Autowired
	Aggregations aggs;

	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;

	public int getLoginData(String serviceName, String startDate, String endDate, String fieldName, String value)
			throws UnknownHostException {
		QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(query.formQuery(serviceName, startDate, endDate))
				.must(qb.getTermQuery(fieldName, value));
		SearchResponse sr = qb.getSearchResponse(queryBuilder);
		List<Map<String, Object>> list = qb.getResponseAsList(sr);
		return list.size();
	}

	public Map<String, List<String>> getExcessiveAccess(String serviceName, String startDate, String endDate,
			String fieldName) throws IOException {

		QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(query.formQuery(serviceName, startDate, endDate));
		TermsAggregationBuilder aggregation = AggregationBuilders.terms("eccess_id").field(fieldName);

		SearchResponse sr = qb.getSearchResponseIncludeAggs(queryBuilder, aggregation);

		List<String> keyList = new ArrayList<String>();
		List<String> docCountList = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		Terms terms = sr.getAggregations().get("eccess_id");

		int size = terms.getBuckets().size();

		if (size != 0) {
			for (int i = 0; i < size; i++) {
				if (terms.getBuckets().get(i).getDocCount() > 10) {
					keyList.add(terms.getBuckets().get(i).getKeyAsString());
					docCountList.add(Long.toString(terms.getBuckets().get(i).getDocCount()));
					
					map.put("keyList", keyList);
					map.put("docCountList", docCountList);
				}
			}
			return map;
		}else {
			System.out.println("데이터가 없습니다.");
			return null;
		}
	}
}
