package com.edlog.boot.springboot.service;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
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
	public TermsAggregationBuilder getTermsAggregation(String aggsName, String fieldName) {
		TermsAggregationBuilder aggsBuilder = AggregationBuilders.terms(aggsName).field(fieldName);
		return aggsBuilder;
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

	@Override
	public SearchResponse getSearchResponse(QueryBuilder query) {
		Client client = null;
		try {
			client = esConfig.client();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(query).setSize(1000).get();
		return sr;
	}

	@Override
	public SearchResponse getSearchResponseIncludeAggs(QueryBuilder query, AggregationBuilder aggs) {
		Client client = null;
		try {
			client = esConfig.client();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(query).addAggregation(aggs)
				.setSize(1000).get();
		return sr;
	}

	@Override
	public List<Map<String, Object>> getResponseAsList(SearchResponse sr) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (SearchHit hit : sr.getHits()) {
			Map<String, Object> sourceAsMap = hit.getSourceAsMap();
			list.add(sourceAsMap);
		}
		return list;
	}

}
