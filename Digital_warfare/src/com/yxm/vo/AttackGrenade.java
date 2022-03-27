package com.yxm.vo;

import java.io.Serializable;

public class AttackGrenade implements Serializable {
    private Integer state;
    private Integer AttackId;
    private Object opposite;
    private String sendData;
    private Integer myWeapon;
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getAttackId() {
        return AttackId;
    }

    public void setAttackId(Integer attackId) {
        AttackId = attackId;
    }

    public Object getOpposite() {
        return opposite;
    }

    public void setOpposite(Object opposite) {
        this.opposite = opposite;
    }

    public String getSendData() {
        return sendData;
    }

    public void setSendData(String sendData) {
        this.sendData = sendData;
    }

    public Integer getMyWeapon() {
        return myWeapon;
    }

    public void setMyWeapon(Integer myWeapon) {
        this.myWeapon = myWeapon;
    }
}
