package com.edlog.boot.springboot.DTO;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class FormDTO implements Serializable {
	
	
	private String date;
	private String period;
	private int accesTry;
	private int loginY;
	private String exAccessCount;
	private String exAccessId;
	private String downloadCount;
	
	//기본생성자
	public FormDTO() {
	}

	//모든 필드 이용한 생성자
	public FormDTO(String date, String period, int accesTry, int loginY, String exAccessCount, String exAccessId,
			String downloadCount) {
		this.date = date;
		this.period = period;
		this.accesTry = accesTry;
		this.loginY = loginY;
		this.exAccessCount = exAccessCount;
		this.exAccessId = exAccessId;
		this.downloadCount = downloadCount;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public int getAccesTry() {
		return accesTry;
	}
	public void setAccesTry(int accesTry) {
		this.accesTry = accesTry;
	}
	public int getLoginY() {
		return loginY;
	}
	public void setLoginY(int loginY) {
		this.loginY = loginY;
	}
	public String getExAccessCount() {
		return exAccessCount;
	}
	public void setExAccessCount(String exAccessCount) {
		this.exAccessCount = exAccessCount;
	}
	public String getExAccessId() {
		return exAccessId;
	}
	public void setExAccessId(String exAccessId) {
		this.exAccessId = exAccessId;
	}
	public String getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(String downloadCount) {
		this.downloadCount = downloadCount;
	}

	@Override
	public String toString() {
		return "FormDTO [date=" + date + ", period=" + period + ", accesTry=" + accesTry + ", loginY=" + loginY
				+ ", exAccessCount=" + exAccessCount + ", exAccessId=" + exAccessId + ", downloadCount=" + downloadCount
				+ "]";
	}
	
}
