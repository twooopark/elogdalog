package com.edlog.boot.springboot.service;

import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.springframework.stereotype.Service;

@Service("AggregationService")
public class AggregationServiceImpl implements AggregationService {

	@Override
	public TermsAggregationBuilder getTermsAggregation(String aggsName, String fieldName) {
		TermsAggregationBuilder aggsBuilder = AggregationBuilders.terms(aggsName).field(fieldName);
		return aggsBuilder;
	}

}
