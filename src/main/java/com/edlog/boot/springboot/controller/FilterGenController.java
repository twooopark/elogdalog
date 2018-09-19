package com.edlog.boot.springboot.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.edlog.boot.spring.dto.MappingFieldDTO;
//
//@Controller
//public class FilterGenController {
//	@RequestMapping(value="/filterGenForm", method=RequestMethod.GET)
//	public String filterGenerate(MappingFieldDTO dto2) {
//		MappingFieldDTO dto = new MappingFieldDTO();
//		dto.setAccessDate("date");
//		dto.setAccessId("id");
//		dto.setAccessIp("ip");
//		dto.setAccessUri("uri");
//		dto.setAction("action");
//		dto.setRemark("remark");
//		dto.setServer("server");
//		dto.setService("service");
//		
//		System.out.println(dto);
//		return "redirect:/filterGen";
//	}
//}
