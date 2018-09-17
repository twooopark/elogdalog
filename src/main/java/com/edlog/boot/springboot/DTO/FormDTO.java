package com.edlog.boot.springboot.DTO;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class FormDTO implements Serializable {
	
	
	private String date;
	private String period;
	private int accessTry;
	private int loginY;
	private String exAccessCount;
	private String exAccessId;
	private int downloadCount;
	private String externalAccess;
	private String unAuthAccess;
	private List<String> externalIpList;
	private List<String> unAuthIpList;
	private int overtimeAccess;
	
	//기본생성자
	public FormDTO() {
	}

	//모든 필드 이용한 생성자
	public FormDTO(String date, String period, int accessTry, int loginY, String exAccessCount, String exAccessId,
			int downloadCount, String externalAccess, String unAuthAccess, List<String> externalIpList,
			List<String> unAuthIpList, int overtimeAccess) {
		this.date = date;
		this.period = period;
		this.accessTry = accessTry;
		this.loginY = loginY;
		this.exAccessCount = exAccessCount;
		this.exAccessId = exAccessId;
		this.downloadCount = downloadCount;
		this.externalAccess = externalAccess;
		this.unAuthAccess = unAuthAccess;
		this.externalIpList = externalIpList;
		this.unAuthIpList = unAuthIpList;
		this.overtimeAccess = overtimeAccess;
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
	
	public int getAccessTry() {
		return accessTry;
	}
	
	public void setAccessTry(int accessTry) {
		this.accessTry = accessTry;
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
	
	public int getDownloadCount() {
		return downloadCount;
	}
	
	public void setDownloadCount(int downloadCount2) {
		this.downloadCount = downloadCount2;
	}
	
	public String getExternalAccess() {
		return externalAccess;
	}
	
	public void setExternalAccess(String externalAccess) {
		this.externalAccess = externalAccess;
	}
	
	public String getUnAuthAccess() {
		return unAuthAccess;
	}
	
	public void setUnAuthAccess(String unAuthAccess) {
		this.unAuthAccess = unAuthAccess;
	}
	
	public List<String> getExternalIpList() {
		return externalIpList;
	}

	public void setExternalIpList(List<String> externalIpList) {
		this.externalIpList = externalIpList;
	}

	public List<String> getUnAuthIpList() {
		return unAuthIpList;
	}

	public void setUnAuthIpList(List<String> unAuthIpList) {
		this.unAuthIpList = unAuthIpList;
	}

	public int getOvertimeAccess() {
		return overtimeAccess;
	}

	public void setOvertimeAccess(int overtimeAccess) {
		this.overtimeAccess = overtimeAccess;
	}

	@Override
	public String toString() {
		return "FormDTO [date=" + date + ", period=" + period + ", accessTry=" + accessTry + ", loginY=" + loginY
				+ ", exAccessCount=" + exAccessCount + ", exAccessId=" + exAccessId + ", downloadCount=" + downloadCount
				+ "]";
	}
	
}
