package com.yxm.vo;

import java.io.Serializable;

public class SystemRoomData implements Serializable {
    private static final long serialVersionUID = 6803526265316477949L;
    private Integer state;
    private String sendDate;
    private String myNickName;
    private String myPortrait;
    private Integer sendUserId;
    private Integer roomId;
    private String roomText;

    public Integer getSendUserId() {
        return sendUserId;
    }

    public void setSendUserId(Integer sendUserId) {
        this.sendUserId = sendUserId;
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

    public String getMyNickName() {
        return myNickName;
    }

    public void setMyNickName(String myNickName) {
        this.myNickName = myNickName;
    }

    public String getMyPortrait() {
        return myPortrait;
    }

    public void setMyPortrait(String myPortrait) {
        this.myPortrait = myPortrait;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getRoomText() {
        return roomText;
    }

    public void setRoomText(String roomText) {
        this.roomText = roomText;
    }
}
