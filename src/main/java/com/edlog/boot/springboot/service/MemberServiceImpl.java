package com.edlog.boot.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.edlog.boot.springboot.DAO.MemberDAO;
import com.edlog.boot.springboot.DTO.MemberDTO;

@Service
public class MemberServiceImpl {
	@Autowired MemberDAO dao;
	@Autowired PasswordEncoder passwordEncoder;
	
	
}
