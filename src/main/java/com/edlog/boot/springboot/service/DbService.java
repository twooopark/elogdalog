package com.edlog.boot.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edlog.boot.springboot.model.DbMapper;

@Service
public class DbService {
	@Autowired DbMapper dbMapper;
	
	/*select dual test*/
	public String getDual() throws Exception{
		return dbMapper.getDual();
	}
}
