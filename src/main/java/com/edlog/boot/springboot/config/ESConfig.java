package com.edlog.boot.springboot.config;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.elasticsearch.client.Client;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
/**
 * YEOTAE
 * @author user
 *
 */
@Configuration
public class ESConfig {
	
	@Value("${spring.elasticsearch.cluster-name}")
	private String clusterName;
	@Value("${spring.elasticsearch.host}")
	private String host;
	@Value("${spring.elasticsearch.host2}")
	private String host2;
	@Value("${spring.elasticsearch.port}")
	private String port;
	
	@SuppressWarnings("resource")
	@Bean
	public Client client() throws UnknownHostException {
		
		Settings settings = Settings.builder()
				.put("cluster.name", clusterName)
				.put("client.transport.sniff", true) //True로 설정시 클러스터 연결 후 위상 재구성해 다른 노드의 주소를 얻음
				.put("client.transport.ignore_cluster_name", true) // 클러스터 이름이 다를경우 연결 x
				.build(); 
		Client client = null;

		try {
			client = new PreBuiltTransportClient(settings)
					.addTransportAddress(new TransportAddress(InetAddress.getByName(host), Integer.parseInt(port)))
					.addTransportAddress(new TransportAddress(InetAddress.getByName(host2), Integer.parseInt(port)));
		} catch (Exception e) {
			System.out.println(e);
		}

		return client;
	}
	
}
