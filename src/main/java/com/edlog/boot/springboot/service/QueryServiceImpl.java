package com.edlog.boot.springboot.service;

import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.edlog.boot.springboot.config.ESConfig;

@Service("queryService")
public class QueryServiceImpl implements QueryService {
	@Autowired
	ESConfig esConfig;
	
	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;
	
	@Override
	public QueryBuilder formFilter(String serviceName, String startDate, String endDate) {
		serviceName = serviceName.toLowerCase();
		QueryBuilder queryBuilder = QueryBuilders.boolQuery()
				.must(getDateRange(startDate, endDate))
				.must(getTermQuery("service", serviceName));
		return queryBuilder;
	}
	
	@Override
	public QueryBuilder getMBoolQuery(QueryBuilder queryBuilder) {
		QueryBuilder boolQuery = QueryBuilders.boolQuery().must(queryBuilder);
		return boolQuery;
	}

	@Override
	public QueryBuilder getMnBoolQuery(QueryBuilder queryBuilder) {
		QueryBuilder boolQuery = QueryBuilders.boolQuery().mustNot(queryBuilder);
		return boolQuery;
	}

	@Override
	public QueryBuilder getMMBoolQuery(QueryBuilder queryBuilder1, QueryBuilder queryBuilder2) {
		QueryBuilder boolQuery = QueryBuilders.boolQuery().must(queryBuilder1).must(queryBuilder2);
		return boolQuery;
	}

	@Override
	public QueryBuilder getMMnBoolQuery(QueryBuilder queryBuilder1, QueryBuilder queryBuilder2) {
		QueryBuilder boolQuery = QueryBuilders.boolQuery().must(queryBuilder1).mustNot(queryBuilder2);
		return boolQuery;
	}
	
	@Override
	public QueryBuilder getSBoolQuery(QueryBuilder queryBuilder) {
		QueryBuilder boolQuery = QueryBuilders.boolQuery().should(queryBuilder);
		return boolQuery;
	}

	@Override
	public QueryBuilder getSSBoolQuery(QueryBuilder queryBuilder1, QueryBuilder queryBuilder2) {
		QueryBuilder boolQuery = QueryBuilders.boolQuery().should(queryBuilder1).should(queryBuilder2);
		return boolQuery;
	}

	@Override
	public QueryBuilder getDateRange(String startDate, String endDate) {

		QueryBuilder rangeQuery = QueryBuilders.rangeQuery("access_date").gte(startDate).lte(endDate);
		return rangeQuery;
	}

	@Override
	public QueryBuilder getTermQuery(String fieldName, String value) {

		QueryBuilder termQuery = QueryBuilders.termQuery(fieldName, value);
		return termQuery;
	}
}
