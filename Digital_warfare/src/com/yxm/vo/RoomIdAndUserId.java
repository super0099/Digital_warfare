package com.yxm.vo;

import java.io.Serializable;

public class RoomIdAndUserId implements Serializable {
    private static final long serialVersionUID = -6879933469174848237L;
    private Integer roomId;
    private Integer userId;

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "RoomIdAndUserId{" +
                "roomId=" + roomId +
                ", userId=" + userId +
                '}';
    }
}
