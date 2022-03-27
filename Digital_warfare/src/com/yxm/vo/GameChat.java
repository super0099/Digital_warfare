package com.yxm.vo;

import java.io.Serializable;

public class GameChat implements Serializable {
    private static final long serialVersionUID = 5470920647307552656L;
    private Integer state;
    private String userName;
    private String sendText;

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSendText() {
        return sendText;
    }

    public void setSendText(String sendText) {
        this.sendText = sendText;
    }

    @Override
    public String toString() {
        return "GameChat{" +
                "state=" + state +
                ", userName='" + userName + '\'' +
                ", sendText='" + sendText + '\'' +
                '}';
    }
}
