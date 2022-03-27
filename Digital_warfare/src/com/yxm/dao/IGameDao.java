package com.yxm.dao;

import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;

import java.util.List;

public interface IGameDao {
    List<SysRoomMemberPo> selectRoomMember(Integer roomId);
    SysRoomPo selectRoom(Integer roomId);
    boolean deleteRoom(Integer Id);
    boolean deleteRoomUser(Integer roomId);
}
