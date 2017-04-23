package com.wygdove.hw.mybatis.model;

public class HwDevice {
    private Integer deviceId;

    private String dname;

    private String dflag;

    private Integer dtype;

    private Boolean isdefault;

    private Integer userId;

    public Integer getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Integer deviceId) {
        this.deviceId = deviceId;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDflag() {
        return dflag;
    }

    public void setDflag(String dflag) {
        this.dflag = dflag;
    }

    public Integer getDtype() {
        return dtype;
    }

    public void setDtype(Integer dtype) {
        this.dtype = dtype;
    }

    public Boolean getIsdefault() {
        return isdefault;
    }

    public void setIsdefault(Boolean isdefault) {
        this.isdefault = isdefault;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}