package com.edlog.boot.springboot.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.edlog.boot.springboot.config.IpConfig;

@Component
public class IpValidationCheck {
	@Autowired
	IpConfig ipConfig;
	
	public boolean checkOfficial(String tempIp) {
		boolean ipCheck = false;
		List<String> offList = ipConfig.getOfficial();
		for(String item:offList) {
			if(tempIp.equals(item)) {
				ipCheck = true;
			}
		}
		return ipCheck;
	}

	public boolean checkExternal(String tempIp) {
		boolean ipCheck = false;
		List<String> exList = ipConfig.getExternal();
		for(String item:exList) {
			if(tempIp.equals(item)) {
				ipCheck = true;
			}
		}
		return ipCheck;
	}
	
	public boolean checkUnAuth(String tempIp) {
		boolean ipCheck = false;
		List<String> unAuthList = ipConfig.getUnauth();
		for(String item:unAuthList) {
			if(tempIp.equals(item)) {
				ipCheck = true;
			}
		}
		return ipCheck;
	}
}

