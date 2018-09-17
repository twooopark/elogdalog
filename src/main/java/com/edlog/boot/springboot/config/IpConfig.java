package com.edlog.boot.springboot.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix="check.ip")
public class IpConfig {
	
	private List<String> official = new ArrayList<String>();
	private List<String> external = new ArrayList<String>();
	private List<String> unauth = new ArrayList<String>();
	
	public List<String> getOfficial() {
		return official;
	}
	public List<String> getExternal() {
		return external;
	}
	
	public List<String> getUnauth() {
		return unauth;
	}
}
