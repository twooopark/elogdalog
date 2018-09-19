package com.edlog.boot.springboot.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class FilterGenController {
	
	@RequestMapping("/filterGen") 
	public String filterGenPage() {return "filterGen";}
	
	
	@RequestMapping(value="/filterGenForm", method=RequestMethod.POST)
	public void filterGenerate(HttpServletResponse request, HttpServletResponse response) throws IOException {
		
		/* input example
		devweb_devweb.dcsms.co.kr_access_18081615.log
		dekhkgk.devwekljo.dcsms.co.kr_access_18081615.log
		[\-\_\^\.\s\[\]\|\:]+
		[2018-08-16 15:57:51] jwmoon|172.21.25.207|/synergy/content/callerbook/limit_list
		[\^\s\[\]\|]+
		
		이를 분석하기 위해서, 필터가 필요하다. (로그스태시에)
		각 구분자로 나눠진 패턴 > 필터
		이것들을 보다 쉽게하기위해 필터 자동생서기를 만듬.
		
		
		서비스마다 1번
		
		최소한의 노력으로 필터를 생성할 수 있도록..
		
		필터 : 데이터 가공을 위함,
		*/
		/* json, DTO example
		jsonData = 
			{
			  "server": "filenameItem0",
			  "service": "filenameItem2",
			  "accessDate": "logdataItem0,logdataItem1",
			  "accessIp": "logdataItem3",
			  "accessId": "logdataItem2",
			  "accessUri": "logdataItem4"
			}
			
		MappingFieldDTO 
		[
		server=filenameItem0, 
		service=filenameItem2, 
		accessDate=logdataItem0,logdataItem1, 
		accessIp=logdataItem3, 
		accessId=logdataItem2, 
		accessUri=logdataItem4, 
		action=null, 
		remark=null
		]
		 */	
		/* grok(output) example
		grok {
			match => {
				"source" => 
					["%{WINPATH:file_path}\\%{WORD2:server}_%{WORD2:service}_%{WORD2:doctype}_%{DATENUM2:file_date}.%{WORD2:file_type}$"]
			}
		}		
		grok {
			match => {
				"message" => 
					["\[(?<access_date>%{YEAR}/%{MONTHNUM2}/%{MONTHDAY} %{TIME})\] %{IPORHOST:access_ip} \| %{USER:access_id} \| %{DATA:access_uri} \| %{DATA:action} \| %{DATA:remark}?$",
					"^%{WORD:access_date}\^%{logSep:access_ip}\^%{logSep:access_id}\^%{DATA:access_uri}\^%{DATA:action}\^%{DATA:remark}?$"]

			}
		}
		*/
	
		PrintWriter writer = response.getWriter();
		writer.print("success");
	}
}
