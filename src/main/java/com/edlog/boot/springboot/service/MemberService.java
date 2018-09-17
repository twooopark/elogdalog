package com.edlog.boot.springboot.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.edlog.boot.springboot.DTO.MemberDTO;

public interface MemberService {

	public int loginCheck(MemberDTO member, HttpServletResponse response,HttpSession session);
	
	public int newRegit(MemberDTO member);
}
