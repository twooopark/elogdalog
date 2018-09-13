package com.edlog.boot.springboot.util;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.lucene.search.join.ScoreMode;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.edlog.boot.springboot.config.ESConfig;

@Configuration
public class Query {
	@Autowired
	ESConfig esConfig;
	
	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;
	@Value("${my.properties.aggs}")
	private String aggs;

	public Query() {
	}

	
	public List<Map<String, Object>> getQResponse(String fieldName, String value)throws UnknownHostException {
		Client client = esConfig.client();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		value = value.toLowerCase();
		QueryBuilder queryBuilder = QueryBuilders.termQuery(fieldName, value);
		// QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(action);

		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(queryBuilder).setSize(1000).get();
		
//				.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setSize(200000).get();
	
		//System.out.println(sr);
		
		//query실행후 결과 list에 map형으로 삽입
		if (sr.getHits().getHits().length != 0) {
			for (SearchHit hit : sr.getHits()) {
				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
				list.add(sourceAsMap);
			}
		}
		
		return list;
	}
	public QueryBuilder boolQuery(String fieldName1, String value1, String fieldName2, String value2)
			throws UnknownHostException {
		Client client = esConfig.client();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		value1 = value1.toLowerCase();
		value2 = value2.toLowerCase();
		//QueryBuilder queryBuilder = QueryBuilders.termQuery(fieldName, value);
		QueryBuilder queryBuilder = QueryBuilders.boolQuery()
				.must(QueryBuilders.termQuery(fieldName1, value1))
				.must(QueryBuilders.termQuery(fieldName2, value2));
		
		QueryBuilder qb = QueryBuilders.boolQuery()
				.must(getDateRange("2018-08-10", "2018-08-20"))
				.must(QueryBuilders.termQuery(fieldName1, value1))
				.must(QueryBuilders.termQuery(fieldName2, value2));
		
		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(queryBuilder)
				.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setSize(1000).get();
		
		if (sr.getHits().getHits().length != 0) {
			for (SearchHit hit : sr.getHits()) {
				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
				list.add(sourceAsMap);
			}
		}
		return qb;
//		List<String> keylist = new ArrayList<String>();
//		List<String> docCountList = new ArrayList<String>();
//		Terms terms = sr.getAggregations().get(aggs);
//		int size = terms.getBuckets().size();
		
//		for (int i = 0; i < size; i++) {
//			keylist.add(terms.getBuckets().get(i).getKeyAsString());
//			docCountList.add(Long.toString(terms.getBuckets().get(i).getDocCount()));
//			System.out.println(keylist.get(i));
//			System.out.println(docCountList.get(i));
//		}
//		
//		if (sr.getHits().getHits().length != 0) {
//			for (SearchHit hit : sr.getHits()) {
//				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
//				Object info2 = sourceAsMap.get("action");
//				System.out.println(info2);
//				list.add(sourceAsMap);
//			}
//		}
	}
	public QueryBuilder getDateRange(String start, String end)throws UnknownHostException {
		
		QueryBuilder rangeQuery = QueryBuilders.rangeQuery("access_date").gte(start).lte(end);
		
		return rangeQuery;
	}
	public List<Map<String, Object>> getSearchResponse(QueryBuilder query)throws UnknownHostException {
		Client client = esConfig.client();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(query)
				.setSize(1000).get();
		//SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
		
		if (sr.getHits().getHits().length != 0) {
			for (SearchHit hit : sr.getHits()) {
				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
				list.add(sourceAsMap);
			}
		}
		return list;
	}
	
	public long getHits(String fieldName, String value)throws UnknownHostException {
		Client client = esConfig.client();

		QueryBuilder queryBuilder = QueryBuilders.termQuery(fieldName, value);
		// QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(action);

		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(queryBuilder)
				.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setSize(5).get();

		
		return sr.getHits().getTotalHits();
	}
	
	public List<Map<String, Object>> formQuery(String lastMonday, String lastSunday, String serviceName)throws UnknownHostException {
		Client client = esConfig.client();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		QueryBuilder queryBuilder = QueryBuilders.termQuery("action", "조회");
		// QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(action);
		QueryBuilder rangeQuery = QueryBuilders.rangeQuery("conn_date").gte(lastMonday).lte(lastSunday);
		
		
		QueryBuilder queryBuilders = QueryBuilders.boolQuery().should(queryBuilder).should(rangeQuery);

		SearchResponse sr = client.prepareSearch(index).setTypes(type)
				.setQuery(queryBuilders)
				.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).get();
		
		if (sr.getHits().getHits().length != 0) {
			for (SearchHit hit : sr.getHits()) {
				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
				list.add(sourceAsMap);
				
			}
		}
		System.out.println(list.get(1));
		return list;
	}
	
}
