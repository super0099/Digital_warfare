package com.yxm.vo;

import java.io.Serializable;

public class JoinAndJoin implements Serializable {
    private static final long serialVersionUID = -3231598941418649647L;
    private Integer state;
    private String message;
    private Integer joinCode;
    private Integer userId;
    private Integer isLeft;
    private String weaponImg;
    private Integer weaponTypeCode;

    public Integer getWeaponTypeCode() {
        return weaponTypeCode;
    }

    public void setWeaponTypeCode(Integer weaponTypeCode) {
        this.weaponTypeCode = weaponTypeCode;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getJoinCode() {
        return joinCode;
    }

    public void setJoinCode(Integer joinCode) {
        this.joinCode = joinCode;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getIsLeft() {
        return isLeft;
    }

    public void setIsLeft(Integer isLeft) {
        this.isLeft = isLeft;
    }

    public String getWeaponImg() {
        return weaponImg;
    }

    public void setWeaponImg(String weaponImg) {
        this.weaponImg = weaponImg;
    }

    @Override
    public String toString() {
        return "JoinAndJoin{" +
                "state=" + state +
                ", message='" + message + '\'' +
                ", joinCode=" + joinCode +
                ", userId=" + userId +
                ", isLeft=" + isLeft +
                ", weaponImg='" + weaponImg + '\'' +
                ", weaponTypeCode=" + weaponTypeCode +
                '}';
    }
}
