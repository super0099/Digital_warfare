package com.yxm.vo;

import java.io.Serializable;

public class JoinRoomUser implements Serializable {
    private static final long serialVersionUID = 214864028626753654L;
    private Integer state;
    private Integer roomId;
    private Integer joinUserId;
    private String joinMemberNickName;
    private String joinMemberPortrait;
    private Integer roomMemberCount;

    public Integer getRoomMemberCount() {
        return roomMemberCount;
    }

    public void setRoomMemberCount(Integer roomMemberCount) {
        this.roomMemberCount = roomMemberCount;
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

    public Integer getJoinUserId() {
        return joinUserId;
    }

    public void setJoinUserId(Integer joinUserId) {
        this.joinUserId = joinUserId;
    }

    public String getJoinMemberNickName() {
        return joinMemberNickName;
    }

    public void setJoinMemberNickName(String joinMemberNickName) {
        this.joinMemberNickName = joinMemberNickName;
    }

    public String getJoinMemberPortrait() {
        return joinMemberPortrait;
    }

    public void setJoinMemberPortrait(String joinMemberPortrait) {
        this.joinMemberPortrait = joinMemberPortrait;
    }
}
