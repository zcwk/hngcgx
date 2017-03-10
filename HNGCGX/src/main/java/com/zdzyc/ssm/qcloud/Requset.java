package com.zdzyc.ssm.qcloud;

/**
 * Created by zhoudezheng on 2017/3/9.
 */
public class Requset {

    //code为0表示成功, message为SUCCESS或者失败原因, data中包含相关的属性, 详情请参见返回值模块
    private int code;
    private String message;
    private String data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
