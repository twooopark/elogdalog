package com.edlog.boot.springboot.service;

import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;

public interface AggregationService {
	//fieldName에 따라 분류
	public TermsAggregationBuilder getTermsAggregation(String aggsName, String fieldName);
	
}
