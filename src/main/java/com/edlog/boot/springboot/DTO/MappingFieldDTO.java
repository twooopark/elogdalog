package com.edlog.boot.springboot.DTO;

public class MappingFieldDTO {
	private String server;
	private String service;
	private String accessDate;
	private String accessIp;
	private String accessId;
	private String accessUri;
	private String action;
	private String remark;

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
	
/*
	private Item server;
	private Item service;
	private Item accessDate;
	private Item accessIp;
	private Item accessId;
	private Item accessUri;
	private Item action;
	private Item remark;
	
	public Item getServer() {
		return server;
	}

	public void setServer(Item server) {
		this.server = server;
	}

	public Item getService() {
		return service;
	}

	public void setService(Item service) {
		this.service = service;
	}

	public Item getAccessDate() {
		return accessDate;
	}

	public void setAccessDate(Item accessDate) {
		this.accessDate = accessDate;
	}

	public Item getAccessIp() {
		return accessIp;
	}

	public void setAccessIp(Item accessIp) {
		this.accessIp = accessIp;
	}

	public Item getAccessId() {
		return accessId;
	}

	public void setAccessId(Item accessId) {
		this.accessId = accessId;
	}

	public Item getAccessUri() {
		return accessUri;
	}

	public void setAccessUri(Item accessUri) {
		this.accessUri = accessUri;
	}

	public Item getAction() {
		return action;
	}

	public void setAction(Item action) {
		this.action = action;
	}

	public Item getRemark() {
		return remark;
	}

	public void setRemark(Item remark) {
		this.remark = remark;
	}
*/	
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

	/*
	class Item{
		private String[] filenameItem;
		private String[] logdataItem;
		
		public String[] getFilenameItem() {
			return filenameItem;
		}
		public void setFilenameItem(String[] filenameItem) {
			this.filenameItem = filenameItem;
		}
		public String[] getLogdataItem() {
			return logdataItem;
		}
		public void setLogdataItem(String[] logdataItem) {
			this.logdataItem = logdataItem;
		}
	}	
	*/
}
