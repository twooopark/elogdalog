package com.edlog.boot.springboot.builder;

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
import org.elasticsearch.search.aggregations.Aggregations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.edlog.boot.springboot.config.ESConfig;
@Configuration
public class QueryBuilderTool {
	
	@Autowired
	ESConfig esConfig;

	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;
	@Value("${my.properties.aggs}")
	private String aggs;
	
	public QueryBuilder getDateRange(String startDate, String endDate) throws UnknownHostException {

		QueryBuilder rangeQuery = QueryBuilders.rangeQuery("access_date").gte(startDate).lte(endDate);

		return rangeQuery;
	}

	public QueryBuilder getTermQuery(String fieldName, String value) throws UnknownHostException {

		QueryBuilder termQuery = QueryBuilders.termQuery(fieldName, value);

		return termQuery;
	}

	public SearchResponse getSearchResponse(QueryBuilder query) throws UnknownHostException {
		Client client = esConfig.client();
		
		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(query).setSize(1000).get();

		return sr;
	}
	public SearchResponse getSearchResponseIncludeAggs(QueryBuilder query, AggregationBuilder aggs) throws UnknownHostException {
		Client client = esConfig.client();
		
		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(query).addAggregation(aggs).setSize(1000).get();
		
		return sr;
	}
	public List<Map<String, Object>>getResponseAsList(SearchResponse sr) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if (sr.getHits().getHits().length != 0) {
			for (SearchHit hit : sr.getHits()) {
				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
				list.add(sourceAsMap);
			}
		}
		return list;
	}
}
