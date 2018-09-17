package com.edlog.boot.springboot.service;

import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;

public interface ResponseService {
	
	public SearchResponse getSearchResponseWithQuery(QueryBuilder query);
	
	public SearchResponse getSearchResponseWithAggs(AggregationBuilder aggs);
	
	public SearchResponse getSearchResponseIncludeAggs(QueryBuilder query, AggregationBuilder aggs);

	public List<Map<String, Object>> getResponseAsList(SearchResponse sr);
	
	public Map<String, List<String>> getBucketAsMap(SearchResponse sr, String aggsName);
}
