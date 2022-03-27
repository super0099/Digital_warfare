package com.yxm.vo;

import java.io.Serializable;

public class SystemGameData implements Serializable {
    private static final long serialVersionUID = 8796563683335598195L;
    private Integer state;
    private Integer second;

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getSecond() {
        return second;
    }

    public void setSecond(Integer second) {
        this.second = second;
    }

    @Override
    public String toString() {
        return "SystemGameData{" +
                "state=" + state +
                ", second=" + second +
                '}';
    }
}
