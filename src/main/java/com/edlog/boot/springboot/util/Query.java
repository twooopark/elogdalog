package com.edlog.boot.springboot.util;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

<<<<<<< HEAD
=======
import com.edlog.boot.springboot.service.QueryServiceImpl;
>>>>>>> chaehee
import com.edlog.boot.springboot.config.ESConfig;
import com.edlog.boot.springboot.service.QueryServiceImpl;

@Configuration
public class Query {
	@Autowired
	ESConfig esConfig;
	@Autowired
	QueryServiceImpl qb;

	@Value("${my.properties.index}")
	private String index;
	@Value("${my.properties.type}")
	private String type;
	@Value("${my.properties.aggs}")
	private String aggs;

	public Query() {
	}

	public List<Map<String, Object>> getQResponse(String fieldName, String value) throws UnknownHostException {
		Client client = esConfig.client();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		value = value.toLowerCase();
		QueryBuilder queryBuilder = QueryBuilders.termQuery(fieldName, value);

		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(queryBuilder).setSize(1000)
				.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).get();
		// System.out.println(sr);

		// query실행후 결과 list에 map형으로 삽입
		if (sr.getHits().getHits().length != 0) {
			for (SearchHit hit : sr.getHits()) {
				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
				list.add(sourceAsMap);
			}
		}

		return list;
	}

	public QueryBuilder boolQuery(String fieldName1, String value1, String fieldName2, String value2)
			throws UnknownHostException {

		value1 = value1.toLowerCase();
		value2 = value2.toLowerCase();
		// QueryBuilder queryBuilder = QueryBuilders.termQuery(fieldName, value);
//		QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(QueryBuilders.termQuery(fieldName1, value1))
//				.must(QueryBuilders.termQuery(fieldName2, value2));

		QueryBuilder queryBuilder2 = QueryBuilders.boolQuery().must(qb.getDateRange("2018-08-10", "2018-08-20"))
				.must(qb.getTermQuery(fieldName1, value1)).must(qb.getTermQuery(fieldName2, value2));

//		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(queryBuilder)
//				.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setSize(1000).get();

//		if (sr.getHits().getHits().length != 0) {
//			for (SearchHit hit : sr.getHits()) {
//				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
//				list.add(sourceAsMap);
//			}
//		}
		return queryBuilder2;
//		List<String> keylist = new ArrayList<String>();
//		List<String> docCountList = new ArrayList<String>();
//		Terms terms = sr.getAggregations().get(aggs);
//		int size = terms.getBuckets().size();

//		for (int i = 0; i < size; i++) {
//			keylist.add(terms.getBuckets().get(i).getKeyAsString());
//			docCountList.add(Long.toString(terms.getBuckets().get(i).getDocCount()));
//			System.out.println(keylist.get(i));
//			System.out.println(docCountList.get(i));
//		}
//		
//		if (sr.getHits().getHits().length != 0) {
//			for (SearchHit hit : sr.getHits()) {
//				Map<String, Object> sourceAsMap = hit.getSourceAsMap();
//				Object info2 = sourceAsMap.get("action");
//				System.out.println(info2);
//				list.add(sourceAsMap);
//			}
//		}
	}
	

	public long getHits(String fieldName, String value) throws UnknownHostException {
		Client client = esConfig.client();

		QueryBuilder queryBuilder = QueryBuilders.termQuery(fieldName, value);
		// QueryBuilder queryBuilder = QueryBuilders.boolQuery().must(action);

		SearchResponse sr = client.prepareSearch(index).setTypes(type).setQuery(queryBuilder)
				.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setSize(5).get();

		return sr.getHits().getTotalHits();
	}

	//선택한 날짜에 해당하는 서비스별 선택 쿼리
	public QueryBuilder formQuery(String serviceName, String startDate, String endDate) throws UnknownHostException {

		serviceName = serviceName.toLowerCase();
		QueryBuilder queryBuilder = QueryBuilders.boolQuery()
				.must(qb.getDateRange(startDate, endDate))
				.must(qb.getTermQuery("service", serviceName));

		return queryBuilder;
	}
	
	public List<Map<String, String>> DateToList(List<Map<String, Object>> list) {
		Map<String, String> parsedMap = new HashMap<String, String>();
		List<Map<String, String>> parsedList = new ArrayList<Map<String, String>>();
		int size = list.size();
		System.out.println(list);
		
		for(int i = 0; i < size; i++) {
			parsedMap.put("file_path", (String) list.get(i).get("file_path"));
			parsedMap.put("server", (String) list.get(i).get("server"));
			parsedMap.put("access_uri", (String) list.get(i).get("access_uri"));
			parsedMap.put("offset", (String) list.get(i).get("offset"));
			parsedMap.put("access_date", (String) list.get(i).get("access_date"));
			parsedMap.put("remark", (String) list.get(i).get("remark"));
			parsedMap.put("source", (String) list.get(i).get("source"));
			parsedMap.put("message", (String) list.get(i).get("message"));
			parsedMap.put("access_ip", (String) list.get(i).get("access_ip"));
			parsedMap.put("file_date", (String) list.get(i).get("file_date"));
			parsedMap.put("service", (String) list.get(i).get("service"));
			parsedMap.put("access_id", (String) list.get(i).get("access_id"));
			parsedMap.put("action", (String) list.get(i).get("action"));
		}
		System.out.println(list.get(0));
		
		return parsedList;
	}
	
	
}
