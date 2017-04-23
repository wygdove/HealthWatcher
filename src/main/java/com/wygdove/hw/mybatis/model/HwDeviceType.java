package com.wygdove.hw.mybatis.model;

public class HwDeviceType {
    private Integer deviceTypeId;

    private String deviceType;

    private String deviceTypeDescription;

    private Boolean isvalid;

    public Integer getDeviceTypeId() {
        return deviceTypeId;
    }

    public void setDeviceTypeId(Integer deviceTypeId) {
        this.deviceTypeId = deviceTypeId;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getDeviceTypeDescription() {
        return deviceTypeDescription;
    }

    public void setDeviceTypeDescription(String deviceTypeDescription) {
        this.deviceTypeDescription = deviceTypeDescription;
    }

    public Boolean getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Boolean isvalid) {
        this.isvalid = isvalid;
    }
}