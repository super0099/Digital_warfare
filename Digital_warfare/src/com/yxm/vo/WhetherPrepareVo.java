package com.yxm.vo;

import java.io.Serializable;

public class WhetherPrepareVo implements Serializable {
    private static final long serialVersionUID = -572978423106330224L;
    private Integer userId;
    private Integer roomId;
    private boolean isOk;
    private Integer state;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public boolean isOk() {
        return isOk;
    }

    public void setOk(boolean ok) {
        isOk = ok;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
