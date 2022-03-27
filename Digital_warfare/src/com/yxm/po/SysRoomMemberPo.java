package com.yxm.po;

import java.io.Serializable;

public class SysRoomMemberPo implements Serializable {
    private static final long serialVersionUID = -7247171591020576873L;
    private int Id;
    private Integer roomId;
    private String memberNickName;
    private String memberPortrait;
    private Integer userId;
    private Integer leftFigure;
    private Integer rightFigure;
    private Integer memberLocation;
    private Integer whetherPrepare;

    public Integer getWhetherPrepare() {
        return whetherPrepare;
    }

    public void setWhetherPrepare(Integer whetherPrepare) {
        this.whetherPrepare = whetherPrepare;
    }

    public Integer getMemberLocation() {
        return memberLocation;
    }

    public void setMemberLocation(Integer memberLocation) {
        this.memberLocation = memberLocation;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getMemberNickName() {
        return memberNickName;
    }

    public void setMemberNickName(String memberNickName) {
        this.memberNickName = memberNickName;
    }

    public String getMemberPortrait() {
        return memberPortrait;
    }

    public void setMemberPortrait(String memberPortrait) {
        this.memberPortrait = memberPortrait;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getLeftFigure() {
        return leftFigure;
    }

    public void setLeftFigure(Integer leftFigure) {
        this.leftFigure = leftFigure;
    }

    public Integer getRightFigure() {
        return rightFigure;
    }

    public void setRightFigure(Integer rightFigure) {
        this.rightFigure = rightFigure;
    }

    @Override
    public String toString() {
        return "SysRoomMemberPo{" +
                "Id=" + Id +
                ", roomId=" + roomId +
                ", memberNickName='" + memberNickName + '\'' +
                ", memberPortrait='" + memberPortrait + '\'' +
                ", userId=" + userId +
                ", leftFigure=" + leftFigure +
                ", rightFigure=" + rightFigure +
                ", memberLocation=" + memberLocation +
                ", whetherPrepare=" + whetherPrepare +
                '}';
    }
}
