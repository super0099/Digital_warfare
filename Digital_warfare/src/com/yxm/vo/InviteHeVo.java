package com.yxm.vo;

import java.io.Serializable;

public class InviteHeVo implements Serializable {
    private static final long serialVersionUID = -6404531174919085178L;
    private Integer state;
    private Integer friendId;
    private Integer roomId;
    private String inviteHePortrait;
    private String sendText;

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getFriendId() {
        return friendId;
    }

    public void setFriendId(Integer friendId) {
        this.friendId = friendId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getInviteHePortrait() {
        return inviteHePortrait;
    }

    public void setInviteHePortrait(String inviteHePortrait) {
        this.inviteHePortrait = inviteHePortrait;
    }

    public String getSendText() {
        return sendText;
    }

    public void setSendText(String sendText) {
        this.sendText = sendText;
    }
}
