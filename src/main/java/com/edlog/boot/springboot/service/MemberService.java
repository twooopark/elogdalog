package com.edlog.boot.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edlog.boot.springboot.model.MemberDAO;

@Service
public class MemberService {
	@Autowired MemberDAO dao;
	
}
