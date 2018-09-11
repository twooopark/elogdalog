package com.edlog.boot.springboot.controller;

import java.net.UnknownHostException;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.aggregations.metrics.avg.AvgAggregationBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edlog.boot.springboot.config.ESConfig;


@RestController

@RequestMapping("/aggs")
public class AggregationExample {
	@Autowired
	ESConfig esConfig;
    
    
	@GetMapping("/get/{aggsName}/{fieldName}")
    public String aggs(@PathVariable final String aggsName, @PathVariable final String fieldName) throws UnknownHostException {
    	
    	Client client = esConfig.client();
    	
    	//System.out.println(aggsName + fieldName);
    	
    	TermsAggregationBuilder aggregation = 
        		AggregationBuilders
        		.terms(aggsName).field(fieldName);
		//aggregation에서 query를 설정하지 않으면 query:match_all로 설정
        SearchResponse sr = client.prepareSearch("my_index").setTypes("my_doctype")
        		.addAggregation(aggregation)
        		.setSize(0).setExplain(true)
        	    .get();
        
        long hit = sr.getHits().getTotalHits();
        
        Map<String, Aggregation> map = sr.getAggregations().asMap();
       
       
        return map.toString() + "	totalHits==" +hit;
        
    }
	@GetMapping("/sub/{aggsName}/{fieldName}")
    public String subaggs(@PathVariable final String aggsName, @PathVariable final String fieldName) throws UnknownHostException {
    	
    	Client client = esConfig.client();
    	
    	System.out.println(aggsName + fieldName);
    	
    	TermsAggregationBuilder aggregation = 
        		AggregationBuilders
        		.terms(aggsName).field(fieldName);
    	AvgAggregationBuilder subAggregation = AggregationBuilders.avg("");
    	
		//aggregation에서 query를 설정하지 않으면 query:match_all로 설정
        SearchResponse sr = client.prepareSearch("my_index").setTypes("my_doctype")
        		.addAggregation(aggregation)
        		.addAggregation(subAggregation)
        		.setSize(0).setExplain(true)
        	    .get();
        
        long hit = sr.getHits().getTotalHits();
        
        Map<String, Aggregation> map = sr.getAggregations().asMap();
       
       
        return map.toString() + "	totalHits==" +hit;
        
    }
}
