package com.yxm.vo;

import java.io.Serializable;

public class AttackEleven implements Serializable {
    private static final long serialVersionUID = 596181076351940134L;
    private Integer state;
    private Integer attackUserId;
    private Integer attackedUserId;
    private Integer myWeapon;
    private Integer consumables;
    private boolean immune;
    private String sendText;

    public String getSendText() {
        return sendText;
    }

    public void setSendText(String sendText) {
        this.sendText = sendText;
    }

    public boolean isImmune() {
        return immune;
    }

    public void setImmune(boolean immune) {
        this.immune = immune;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getAttackUserId() {
        return attackUserId;
    }

    public void setAttackUserId(Integer attackUserId) {
        this.attackUserId = attackUserId;
    }

    public Integer getAttackedUserId() {
        return attackedUserId;
    }

    public void setAttackedUserId(Integer attackedUserId) {
        this.attackedUserId = attackedUserId;
    }

    public Integer getMyWeapon() {
        return myWeapon;
    }

    public void setMyWeapon(Integer myWeapon) {
        this.myWeapon = myWeapon;
    }

    public Integer getConsumables() {
        return consumables;
    }

    public void setConsumables(Integer consumables) {
        this.consumables = consumables;
    }

    @Override
    public String toString() {
        return "AttackEleven{" +
                "state=" + state +
                ", attackUserId=" + attackUserId +
                ", attackedUserId=" + attackedUserId +
                ", myWeapon=" + myWeapon +
                ", consumables=" + consumables +
                ", immune=" + immune +
                ", sendText='" + sendText + '\'' +
                '}';
    }
}
