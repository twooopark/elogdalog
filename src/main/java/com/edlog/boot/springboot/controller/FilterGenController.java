package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edlog.boot.springboot.DTO.MappingFieldDTO;

@Controller
public class FilterGenController {
	
	@RequestMapping("/filterGen") 
	public String filterGenPage() {return "filterGen";}
	
	
	@RequestMapping(value="/filterGenForm", method=RequestMethod.POST)
	public void filterGenerate(MappingFieldDTO dto, HttpServletResponse response) throws IOException {
		/* 	jsonData = 
		{
		  "server": "filenameItem0",
		  "service": "filenameItem3",
		  "accessDate": "filenameItem6,logdataItem3,logdataItem4",
		  "accessIp": "logdataItem5,logdataItem6,logdataItem7,logdataItem8",
		  "accessId": "logdataItem1",
		  "accessUri": "logdataItem9,logdataItem10",
		  "action": "logdataItem11",
		  "remark": "logdataItem12"
		}
		 */	
		
		System.out.println(dto);
		
	
		PrintWriter writer = response.getWriter();
		writer.print("success");
	}
}
