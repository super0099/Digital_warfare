package com.yxm.vo;

import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysUserPo;

import java.io.Serializable;
import java.util.List;

public class RoomMemberAndRoomFriend implements Serializable {
    private static final long serialVersionUID = -1626042452909030711L;
    private List<SysRoomMemberPo> sysRoomMemberPoList;
    private List<SysUserPo> friendList;
    private Integer roomMasterId;
    private Integer roomId;
    private String roomNumber;

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getRoomMasterId() {
        return roomMasterId;
    }

    public void setRoomMasterId(Integer roomMasterId) {
        this.roomMasterId = roomMasterId;
    }

    public List<SysRoomMemberPo> getSysRoomMemberPoList() {
        return sysRoomMemberPoList;
    }

    public void setSysRoomMemberPoList(List<SysRoomMemberPo> sysRoomMemberPoList) {
        this.sysRoomMemberPoList = sysRoomMemberPoList;
    }

    public List<SysUserPo> getFriendList() {
        return friendList;
    }

    public void setFriendList(List<SysUserPo> friendList) {
        this.friendList = friendList;
    }
}
