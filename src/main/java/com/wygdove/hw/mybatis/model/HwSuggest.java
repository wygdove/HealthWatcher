package com.wygdove.hw.mybatis.model;

public class HwSuggest {
    private Integer suggestId;

    private Integer userId;

    private String message;

    public Integer getSuggestId() {
        return suggestId;
    }

    public void setSuggestId(Integer suggestId) {
        this.suggestId = suggestId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}