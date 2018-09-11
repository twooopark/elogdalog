package com.edlog.boot.springboot.config;

import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.client.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


public class IndexOperations {
	@Autowired
	ESConfig esConfig;
	
	private final Client client;
	
	public IndexOperations(Client client) { //생성자
		this.client = client;
	}
	
	public boolean checkIndexExists(String name) {
		IndicesExistsResponse response = client.admin().indices().prepareExists(name).execute().actionGet();
		System.out.println("인덱스 있는지 여부 판단");
		return response.isExists();
	}
	
	public void createIndex(String name) {
		client.admin().indices().prepareCreate(name).execute().actionGet();
		System.out.println("인덱스 생성");
	}
	
	public void deleteIndex(String name) {
		client.admin().indices().prepareDelete(name).execute().actionGet();
		System.out.println("인덱스 삭제");
	}
	
	public void closeIndex(String name) {
		client.admin().indices().prepareClose(name).execute().actionGet();
		System.out.println("인덱스 닫기");
	}
	
	public void openIndex(String name) {
		client.admin().indices().prepareOpen(name).execute().actionGet();
		System.out.println("인덱스 오픈");
	}
}
