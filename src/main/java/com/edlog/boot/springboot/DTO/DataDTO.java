package com.edlog.boot.springboot.DTO;

import org.springframework.stereotype.Component;

@Component
public class DataDTO {
//	"startDate" : startDate,
//	"endDate" : endDate,
//	"serviceName" : serviceName

	private String startDate;
	private String endDate;
	private String serviceName;

	public DataDTO() {
	}

	public DataDTO(String startDate, String endDate, String serviceName) {
		this.startDate = startDate;
		this.endDate = endDate;
		this.serviceName = serviceName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

}
