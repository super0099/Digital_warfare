package com.yxm.po;

import java.io.Serializable;
import java.util.Date;

public class SysChatPo implements Serializable {
    private static final long serialVersionUID = 3048018666377126609L;
    private int Id;
    private Integer sendUserId;
    private Integer friendId;
    private String sendText;
    private String sendPicture;
    private Date sendDate;

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public Integer getSendUserId() {
        return sendUserId;
    }

    public void setSendUserId(Integer sendUserId) {
        this.sendUserId = sendUserId;
    }

    public Integer getFriendId() {
        return friendId;
    }

    public void setFriendId(Integer friendId) {
        this.friendId = friendId;
    }

    public String getSendText() {
        return sendText;
    }

    public void setSendText(String sendText) {
        this.sendText = sendText;
    }

    public String getSendPicture() {
        return sendPicture;
    }

    public void setSendPicture(String sendPicture) {
        this.sendPicture = sendPicture;
    }

    @Override
    public String toString() {
        return "SysChatPo{" +
                "Id=" + Id +
                ", sendUserId=" + sendUserId +
                ", friendId=" + friendId +
                ", sendText='" + sendText + '\'' +
                ", sendPicture='" + sendPicture + '\'' +
                ", sendDate=" + sendDate +
                '}';
    }
}
