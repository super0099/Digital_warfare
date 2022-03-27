package com.yxm.po;

import java.io.Serializable;

public class SysRoomPo implements Serializable {
    private static final long serialVersionUID = 4322177764037428898L;
    private int Id;
    private String roomNumber;
    private Integer roomState;
    private Integer isOk;
    private Integer peopleQuantity;
    private Integer roomMasterId;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public Integer getRoomState() {
        return roomState;
    }

    public void setRoomState(Integer roomState) {
        this.roomState = roomState;
    }

    public Integer getIsOk() {
        return isOk;
    }

    public void setIsOk(Integer isOk) {
        this.isOk = isOk;
    }

    public Integer getPeopleQuantity() {
        return peopleQuantity;
    }

    public void setPeopleQuantity(Integer peopleQuantity) {
        this.peopleQuantity = peopleQuantity;
    }

    public Integer getRoomMasterId() {
        return roomMasterId;
    }

    public void setRoomMasterId(Integer roomMasterId) {
        this.roomMasterId = roomMasterId;
    }

    @Override
    public String toString() {
        return "SysRoomPo{" +
                "Id=" + Id +
                ", roomNumber='" + roomNumber + '\'' +
                ", roomState=" + roomState +
                ", isOk=" + isOk +
                ", peopleQuantity=" + peopleQuantity +
                ", roomMasterId=" + roomMasterId +
                '}';
    }
}
