package com.yxm.vo;

import com.yxm.po.SysChatPo;

public class InformationList extends SysChatPo {
    private String nickName;
    private String userPortrait;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserPortrait() {
        return userPortrait;
    }

    public void setUserPortrait(String userPortrait) {
        this.userPortrait = userPortrait;
    }

    @Override
    public String toString() {
        return "InformationList{" +
                "nickName='" + nickName + '\'' +
                ", userPortrait='" + userPortrait + '\'' +
                '}';
    }
}
