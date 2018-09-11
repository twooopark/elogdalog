package com.edlog.boot.springboot.controller;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;

import java.io.IOException;
import java.net.UnknownHostException;

import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edlog.boot.springboot.config.ESConfig;
import com.edlog.boot.springboot.config.IndexOperations;

@RestController
@RequestMapping("/rest")
public class TestController {

	@Autowired
	ESConfig esConfig;

	@GetMapping("/setIndex/{indexName}")
	public String settingIndex(@PathVariable final String indexName) throws IOException {
		Client client = esConfig.client();
		
		//인덱스가 없다면 생성
		IndexOperations io = new IndexOperations(client);

		if (io.checkIndexExists(indexName)) {
			io.deleteIndex(indexName);
		}
		io.createIndex(indexName);
		
		if (io.checkIndexExists(indexName)) {
			return "인덱스를 생성했습니다.";
		}else {
			return "만드는데 실패했습니다";
		}
		
		
		//createIndex와 같음 기본세팅 추가로 할수 있음
//		CreateIndexResponse cir = client.admin().indices().prepareCreate(index)
//        .setSettings(Settings.builder()             
//                .put("index.number_of_shards", 3)
//                .put("index.number_of_replicas", 2)
//        )
//        .get();
		
		//인덱스에 document추가하기
		
	}
	
	@GetMapping("/insert/{index}/{type}/{id}")
	public String insert(@PathVariable final String id, 
			@PathVariable final String index, @PathVariable final String type) throws IOException {
		Client client = esConfig.client();
		IndexResponse ires = client.prepareIndex(index,type,id)
				.setSource(jsonBuilder()
						.startObject()
						.field("name", "yoon")
						.field("salary", 1600)
						.field("teamName", "ELogDalog")
						.endObject()
						).get();
		
		return ires.getResult().toString();
		
	}
	
	@GetMapping("/view/{index}/{type}/{id}")
	public String view(@PathVariable final String id, @PathVariable 
			final String index, @PathVariable final String type) throws UnknownHostException {
		Client client = esConfig.client();
		
		try {
			GetResponse getResponse = client.prepareGet(index,type,id).get();
			String resMessage = getResponse.getSource().toString();
			return resMessage;
		}catch(Exception e) {
			System.out.println(e);
		}
		return "IndexNotFound";
	}
	
	@GetMapping("/update/{index}/{type}/{id}/{field}/{value}")
	public String update(@PathVariable final String id, @PathVariable final String index, @PathVariable final String type, 
			@PathVariable final String field, @PathVariable final String value) throws IOException {
		Client client = esConfig.client();
		UpdateRequest updateRequest = new UpdateRequest();
		updateRequest.index("employee")
		.type("type").id(id).doc(jsonBuilder().startObject().field(field, value).endObject());
		
		try {
			UpdateResponse updateResponse = client.update(updateRequest).get();
			System.out.println(updateResponse.status());
			return updateResponse.status().toString();
		}catch(Exception e) {
			System.out.println(e);
		}
		return "IndexNotFound";
	}
	
	@GetMapping("/delete/{index}/{type}/{id}")
	public String delete(@PathVariable final String id, @PathVariable final String index, 
			@PathVariable final String type) throws IOException {
		Client client = esConfig.client();
		
		DeleteResponse deleteResponse = client.prepareDelete(index,type,id).execute().actionGet();
		
		return deleteResponse.getResult().toString();
	}
	
}
