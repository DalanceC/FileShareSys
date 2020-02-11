package com.hhit.vo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回类
 */
public class Message {
    private int code;//状态码
    private String message;//提示信息
    private Map<String, Object> returnDatas = new HashMap<>();//返回给浏览器的数据

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

    public Map<String, Object> getReturnDatas() {
        return returnDatas;
    }

    public void setReturnDatas(Map<String, Object> returnDatas) {
        this.returnDatas = returnDatas;
    }

    public static Message success(){
        Message message = new Message();
        message.setCode(1);//成功
        message.setMessage("处理成功");
        return message;
    }

    public static Message fail(){
        Message message = new Message();
        message.setCode(-1);//失败
        message.setMessage("处理失败");
        return message;
    }

    //存放返回数据拼加的方法
    public Message add(String key,Object value){
        this.getReturnDatas().put(key,value);
        return this;
    }
}
