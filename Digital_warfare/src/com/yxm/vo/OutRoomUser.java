package com.yxm.vo;

import java.io.Serializable;

public class OutRoomUser implements Serializable {
    private static final long serialVersionUID = -1430847509993428533L;
    private Integer roomId;
    private Integer roomMasterId;
    private Integer outUserId;
    private Integer state;
    private String outUserNickName;
    private String outUserPortrait;

    public String getOutUserPortrait() {
        return outUserPortrait;
    }

    public void setOutUserPortrait(String outUserPortrait) {
        this.outUserPortrait = outUserPortrait;
    }

    public String getOutUserNickName() {
        return outUserNickName;
    }

    public void setOutUserNickName(String outUserNickName) {
        this.outUserNickName = outUserNickName;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getRoomMasterId() {
        return roomMasterId;
    }

    public void setRoomMasterId(Integer roomMasterId) {
        this.roomMasterId = roomMasterId;
    }

    public Integer getOutUserId() {
        return outUserId;
    }

    public void setOutUserId(Integer outUserId) {
        this.outUserId = outUserId;
    }
}
