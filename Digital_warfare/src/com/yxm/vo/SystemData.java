package com.yxm.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class SystemData implements Serializable {
    private static final long serialVersionUID = -2367238538162794360L;
    private Integer state;//1是在线人数和当前登录的用户组合,2是系统小a消息,3是用户给系统发送信息
    private String sendDate;//信息发送时间
    private String userNickName;//发件人昵称
    private String sysNickName;//收件系统
    private String sendText;//发送信息
    private String userPortrait;//发件人头像
    private String sysPortrait;//系统头像
    private Integer recipient;//收件人id
    private Integer senduserId;//发件人Id
    private List<Integer> loginUser;//总数数组
    private Integer Count;//总人数

    public Integer getSenduserId() {
        return senduserId;
    }

    public void setSenduserId(Integer senduserId) {
        this.senduserId = senduserId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getSendDate() {
        return sendDate;
    }

    public void setSendDate(String sendDate) {
        this.sendDate = sendDate;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }

    public String getSysNickName() {
        return sysNickName;
    }

    public void setSysNickName(String sysNickName) {
        this.sysNickName = sysNickName;
    }

    public String getSendText() {
        return sendText;
    }

    public void setSendText(String sendText) {
        this.sendText = sendText;
    }

    public String getUserPortrait() {
        return userPortrait;
    }

    public void setUserPortrait(String userPortrait) {
        this.userPortrait = userPortrait;
    }

    public String getSysPortrait() {
        return sysPortrait;
    }

    public void setSysPortrait(String sysPortrait) {
        this.sysPortrait = sysPortrait;
    }

    public Integer getRecipient() {
        return recipient;
    }

    public void setRecipient(Integer recipient) {
        this.recipient = recipient;
    }

    public List<Integer> getLoginUser() {
        return loginUser;
    }

    public void setLoginUser(List<Integer> loginUser) {
        this.loginUser = loginUser;
    }

    public Integer getCount() {
        return Count;
    }

    public void setCount(Integer count) {
        Count = count;
    }
}
