package com.edlog.boot.springboot.DAO;

import com.edlog.boot.springboot.DTO.MemberDTO;

public interface MemberMapper {
	public String getDual() throws Exception; 
	public int newRegit(MemberDTO member) throws Exception;
	public MemberDTO loginCheck(String id) throws Exception;
}
