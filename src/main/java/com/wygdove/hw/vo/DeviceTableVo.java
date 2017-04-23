package com.wygdove.hw.vo;

public class DeviceTableVo {
	private Integer deviceid;
	private String dname;
	private String dflag;
	private String dtype;
	private Boolean isdefault;
	
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname=dname;
	}
	public String getDflag() {
		return dflag;
	}
	public void setDflag(String dflag) {
		this.dflag=dflag;
	}
	public String getDtype() {
		return dtype;
	}
	public void setDtype(String dtype) {
		this.dtype=dtype;
	}
	public Boolean getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(Boolean isdefault) {
		this.isdefault=isdefault;
	}
	public Integer getDeviceid() {
		return deviceid;
	}
	public void setDeviceid(Integer deviceid) {
		this.deviceid = deviceid;
	}
	
}
