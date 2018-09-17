package com.edlog.boot.springboot.service;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms.Bucket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.edlog.boot.springboot.config.ESConfig;

@Service("ResponseService")
public class ResponseServiceImpl implements ResponseService {

	@Autowired
	ESConfig esConfig;
	
	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;
	
	@Override
	public SearchResponse getSearchResponseWithQuery(QueryBuilder query) {
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
	public SearchResponse getSearchResponseWithAggs(AggregationBuilder aggs) {
		Client client = null;
		try {
			client = esConfig.client();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		SearchResponse sr = client.prepareSearch(index).setTypes(type).addAggregation(aggs).setSize(100).get();
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

	@Override
	public Map<String, List<String>> getBucketAsMap(SearchResponse sr, String aggsName) {
		List<String> keyList = new ArrayList<String>();
		List<String> docCountList = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		Terms terms = sr.getAggregations().get(aggsName);
		for (Bucket entry : terms.getBuckets()) {
			if (entry.getDocCount() > 10) {
				keyList.add(entry.getKeyAsString());
				docCountList.add(Long.toString(entry.getDocCount()));
			}
		}
		map.put("keyList", keyList);
		map.put("docCountList", docCountList);
		
		return map;
	}

}
