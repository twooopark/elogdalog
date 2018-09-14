package com.edlog.boot.springboot.Service;

import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;

public interface QueryService {
	
	public QueryBuilder getMBoolQuery(QueryBuilder queryBuilder);
	public QueryBuilder getMMBoolQuery(QueryBuilder queryBuilder1, QueryBuilder queryBuilder2);
	public QueryBuilder getSBoolQuery(QueryBuilder queryBuilder);
	public QueryBuilder getSSBoolQuery(QueryBuilder queryBuilder1, QueryBuilder queryBuilder2);
	public QueryBuilder getDateRange(String startDate, String endDate);
	public QueryBuilder getTermQuery(String fieldName, String value);
	public AggregationBuilder getAggregation(String aggsName, String fieldName);
	public SearchResponse getSearchResponse(QueryBuilder query);
	public SearchResponse getSearchResponseIncludeAggs(QueryBuilder query, AggregationBuilder aggs);
	public List<Map<String, Object>> getResponseAsList(SearchResponse sr);
	
}
