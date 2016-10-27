package com.flyout.common.dto;

/**
 * Created by LiMeiyuan on 2016/9/27 10:02.
 * description:
 */
public class BasicDto {
    private String message;
    private Boolean result = false;
    private Object data;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getResult() {
        return result;
    }

    public void setResult(Boolean result) {
        this.result = result;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
