package com.edlog.boot.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edlog.boot.spring.dto.MappingFieldDTO;

@Controller
public class FilterGenController {
	@RequestMapping(value="/filterGenForm", method=RequestMethod.GET)
	public ModelAndView filterGenerate(@RequestBody MappingFieldDTO dto2) {
		MappingFieldDTO dto = new MappingFieldDTO();
		dto.setAccessDate("date");
		dto.setAccessId("id");
		dto.setAccessIp("ip");
		dto.setAccessUri("uri");
		dto.setAction("action");
		dto.setRemark("remark");
		dto.setServer("server");
		dto.setService("service");
		
		String str = "###abcd###";
		
		String coverStr = "input {\r\n" + str +
				"	beats {\r\n" + 
				"        port => \"5044\" \r\n" + 
				"	}\r\n" + 
				"}\r\n" + 
				" filter {\r\n" + 
				"	grok {\r\n" + 
				"		match => {\r\n" + 
				"			\"message\" => \r\n" + 
				"				[\"\\[(?<conn_date>%{YEAR}/%{MONTHNUM2}/%{MONTHDAY} %{TIME})\\] %{IPORHOST:conn_ip} \\| %{USER:conn_id} \\| (?<uri>%{WORD}%{UNIXPATH}) \\| %{WORD:action} \\| %{USER:detail_id}?\",\"^%{WORD:conn_date}\\^%{IPORHOST:conn_ip}\\^%{USER:conn_id}\\^%{DATA:uri}\\^%{DATA:action}\\^%{WORD:detail_id}?\"]\r\n" + 
				"		}\r\n" + 
				"		overwrite => [\"message\"]\r\n" + 
				"	}\r\n" + 
				"	date {\r\n" + 
				"		match => [\"conn_date\", \"yy/MM/dd HH:mm:ss\",\"yyMMddHHmmss\"]\r\n" + 
				"		target => [\"conn_date\"]\r\n" + 
				"    		timezone => \"Asia/Seoul\"\r\n" + 
				"	}\r\n" + 
				"}\r\n" + 
				"output {\r\n" + 
				"  	elasticsearch {\r\n" + 
				"    		hosts => \"172.21.25.84:9200\"\r\n" + 
				"		index => \"my_index\"\r\n" + 
				"		document_type => \"my_doctype\"\r\n" + 
				"	}\r\n" + 
				"	stdout {}\r\n" + 
				"}\r\n";
		
		
		System.out.println(dto);
		//return "redirect:/filterGen";
		return null;
	}
}
