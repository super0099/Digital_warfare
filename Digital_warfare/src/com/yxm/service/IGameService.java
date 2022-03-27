package com.yxm.service;

import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;

import java.util.List;

public interface IGameService {
    List<SysRoomMemberPo> selectRoomMember(Integer roomId);
    SysRoomPo selectRoom(Integer roomId);
    boolean deleteRoomUser(Integer roomId);
    boolean deleteRoom(Integer Id);
}
