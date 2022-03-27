package com.yxm.po;

import java.io.Serializable;

public class SysUserPo implements Serializable {
    private static final long serialVersionUID = 5999445740516332930L;
    private int Id;
    private String userName;
    private String userPassword;
    private String userPortrait;
    private String nickName;
    private String userPhone;
    private String userIdNo;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPortrait() {
        return userPortrait;
    }

    public void setUserPortrait(String userPortrait) {
        this.userPortrait = userPortrait;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserIdNo() {
        return userIdNo;
    }

    public void setUserIdNo(String userIdNo) {
        this.userIdNo = userIdNo;
    }

    @Override
    public String toString() {
        return "SysUserPo{" +
                "Id=" + Id +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userPortrait='" + userPortrait + '\'' +
                ", nickName='" + nickName + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", userIdNo='" + userIdNo + '\'' +
                '}';
    }
}
