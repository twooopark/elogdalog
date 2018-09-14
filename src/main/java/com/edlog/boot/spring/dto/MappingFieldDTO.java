package com.edlog.boot.spring.dto;

public class MappingFieldDTO {
	private String server;
	private String service;
	private String accessDate;
	private String accessIp;
	private String accessId;
	private String accessUri;
	private String action;
	private String remark;
	
	public MappingFieldDTO() {
	}
	
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getAccessDate() {
		return accessDate;
	}
	public void setAccessDate(String accessDate) {
		this.accessDate = accessDate;
	}
	public String getAccessIp() {
		return accessIp;
	}
	public void setAccessIp(String accessIp) {
		this.accessIp = accessIp;
	}
	public String getAccessId() {
		return accessId;
	}
	public void setAccessId(String accessId) {
		this.accessId = accessId;
	}
	public String getAccessUri() {
		return accessUri;
	}
	public void setAccessUri(String accessUri) {
		this.accessUri = accessUri;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MappingFieldDTO [server=");
		builder.append(server);
		builder.append(", service=");
		builder.append(service);
		builder.append(", accessDate=");
		builder.append(accessDate);
		builder.append(", accessIp=");
		builder.append(accessIp);
		builder.append(", accessId=");
		builder.append(accessId);
		builder.append(", accessUri=");
		builder.append(accessUri);
		builder.append(", action=");
		builder.append(action);
		builder.append(", remark=");
		builder.append(remark);
		builder.append("]");
		return builder.toString();
	}
	
	
}
