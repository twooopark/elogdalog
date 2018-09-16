package com.edlog.boot.springboot.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edlog.boot.springboot.DAO.MemberMapper;
import com.edlog.boot.springboot.DTO.MemberDTO;

@Service
public class MemberService {
	@Autowired MemberMapper memberMapper;
	
	public String getDual() throws Exception{
		return memberMapper.getDual();
	}
	
	public int newRegit(MemberDTO member) throws Exception{
		return memberMapper.newRegit(member);
	}
	
	public int loginCheck(MemberDTO member, HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDTO DBmember = memberMapper.loginCheck(member.getId());
		if(DBmember==null) {
			/*아이디없음*/
			out.println(0);
			out.close();
			return 0;
		}else {
			if(!DBmember.getPassword().equals(member.getPassword())) {
				/*비밀번호 틀림*/
				out.println(0);
				out.close();
				return 0;
			}else {
				session.setAttribute("user",DBmember);
				out.println(1);
				out.close();
				return 1;
			}
		}
	}
}
