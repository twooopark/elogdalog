package com.edlog.boot.springboot.service;

import org.elasticsearch.index.query.QueryBuilder;

public interface QueryService {
	//formmat위한 기초 쿼리
	public QueryBuilder formFilter(String serviceName, String startDate, String endDate);
	//Must
	public QueryBuilder getMBoolQuery(QueryBuilder mustQuery);
	//MustNot
	public QueryBuilder getMnBoolQuery(QueryBuilder mustNotQuery);
	//Must Must
	public QueryBuilder getMMBoolQuery(QueryBuilder mustQuery1, QueryBuilder mustQuery2);
	//Must MustNot
	public QueryBuilder getMMnBoolQuery(QueryBuilder mustQuery, QueryBuilder mustNotQuery);
	//Should
	public QueryBuilder getSBoolQuery(QueryBuilder shouldQuery);
	//Should Should
	public QueryBuilder getSSBoolQuery(QueryBuilder shouldQuery1, QueryBuilder shouldQuery2);
	//날짜 범주 쿼리
	public QueryBuilder getDateRange(String startDate, String endDate);
	//Term일치 쿼리
	public QueryBuilder getTermQuery(String fieldName, String value);
	
	
}
