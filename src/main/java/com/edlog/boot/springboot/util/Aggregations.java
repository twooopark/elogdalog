package com.edlog.boot.springboot.util;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.edlog.boot.springboot.config.ESConfig;

@Configuration
public class Aggregations {
	@Autowired
	ESConfig esConfig;

	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;
	@Value("${my.properties.aggs}")
	private String aggs;

	public Aggregations() {

	}

	public Map<String, Aggregation> getAResponse(String fieldName) throws IOException {
		Client client = esConfig.client();
		TermsAggregationBuilder aggregation = AggregationBuilders.terms(aggs).field(fieldName);
		
		// aggregation에서 query를 설정하지 않으면 query:match_all로 설정
		SearchResponse sr = client.prepareSearch(index).setTypes(type).addAggregation(aggregation).setSize(5).execute()
				.actionGet();

		List<String> keylist = new ArrayList<String>();
		Terms terms = sr.getAggregations().get(aggs);
		int size = terms.getBuckets().size();
		String info = terms.getBuckets().get(0).getKeyAsString();
		for (int i = 0; i < size; i++) {
			keylist.add(terms.getBuckets().get(i).getKeyAsString());
			System.out.println(keylist.get(i));
		}

//	    QueryBuilder qb = QueryBuilders.termQuery("action", "조회");
//	    
//	    SearchResponse scrollResp = client.prepareSearch(index)
//	            .addSort(FieldSortBuilder.DOC_FIELD_NAME, SortOrder.ASC)
//	            .setScroll(new TimeValue(60000))
//	            .setQuery(qb)
//	            .setSize(100).get();
//	    
//	    XContentBuilder builder = XContentFactory.jsonBuilder();
//	    builder.startObject();
//	    scrollResp.toXContent(builder, ToXContent.EMPTY_PARAMS);
//	    builder.endObject();
//	    
//	    builder.humanReadable(true);
//	    System.out.println(builder);

		Map<String, Aggregation> map = sr.getAggregations().asMap();
		return map;
	}

	public Map<String, List<String>> getKeyList(String fieldName) throws IOException {
		Client client = esConfig.client();
		TermsAggregationBuilder aggregation = AggregationBuilders.terms(aggs).field(fieldName);

		SearchResponse sr = client.prepareSearch(index).setTypes(type).addAggregation(aggregation).setSize(5).execute()
				.actionGet();

		List<String> keyList = new ArrayList<String>();
		List<String> docCountList = new ArrayList<String>();

		Terms terms = sr.getAggregations().get(aggs);

		int size = terms.getBuckets().size();

		String info = terms.getBuckets().get(0).getKeyAsString();

		for (int i = 0; i < size; i++) {
			keyList.add(terms.getBuckets().get(i).getKeyAsString());
			docCountList.add(Long.toString(terms.getBuckets().get(i).getDocCount()));
			// System.out.println(keyList.get(i));
		}
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("keyList", keyList);
		map.put("docCountList", docCountList);
		return map;
	}

	public Map<String, List<String>> doubleAggs(String fieldName1, String fieldName2) throws UnknownHostException {
		Client client = esConfig.client();
		TermsAggregationBuilder aggregation = AggregationBuilders.terms(aggs).field(fieldName1);
		TermsAggregationBuilder aggregation2 = AggregationBuilders.terms("Ag").field(fieldName2);
		// aggregation에서 query를 설정하지 않으면 query:match_all로 설정
		SearchResponse sr = client.prepareSearch(index).setTypes(type).addAggregation(aggregation)
				.addAggregation(aggregation2).setSize(0).get();
		Terms terms = sr.getAggregations().get(aggs);
		Terms terms2 = sr.getAggregations().get("Ag");

		int size = terms.getBuckets().size();
		List<String> list = new ArrayList<String>();

		for (int i = 0; i < size; i++) {
			list.add(terms.getBuckets().get(i).getKeyAsString());
			//System.out.println(list.get(i));
		}
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("keyList", list);
		////////////////////////////
		int size2 = terms2.getBuckets().size();
		List<String> list2 = new ArrayList<String>();

		for (int i = 0; i < size2; i++) {
			list2.add(terms2.getBuckets().get(i).getKeyAsString());
			//System.out.println(list2.get(i));
		}
		map.put("twoList", list2);
		return map;
	}

	public long getHits(String fieldName) throws UnknownHostException {
		Client client = esConfig.client();
		TermsAggregationBuilder aggregation = AggregationBuilders.terms(aggs).field(fieldName);
		// aggregation에서 query를 설정하지 않으면 query:match_all로 설정
		SearchResponse sr = client.prepareSearch(index).setTypes(type).addAggregation(aggregation).setSize(0).get();
		long totalHit = sr.getHits().getTotalHits();
		return totalHit;
	}

	public long formAggs(String serviceName) throws UnknownHostException {
		Client client = esConfig.client();
		TermsAggregationBuilder aggregation = AggregationBuilders.terms(aggs).field(serviceName);
		// aggregation에서 query를 설정하지 않으면 query:match_all로 설정
		SearchResponse sr = client.prepareSearch(index).setTypes(type).addAggregation(aggregation).setSize(0).get();
		long totalHit = sr.getHits().getTotalHits();
		return totalHit;
	}
}
