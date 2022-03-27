package com.yxm.dao;

import com.yxm.po.SysChatPo;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.po.SysUserPo;
import com.yxm.vo.InformationList;

import java.util.List;

public interface IHomeDao {
    List<Integer> selectFriendId(Integer myId);
    SysUserPo selectFriend(Integer friendId);
    Integer selectInformation(Integer myUserId,Integer myFriendId);
    List<InformationList> selectInformationList(Integer friendId);
    boolean insertChat(SysChatPo sysChatPo);
    boolean addRoom(SysRoomPo sysRoomPo);
    boolean addRoomPeople(SysRoomMemberPo sysRoomMemberPo);
    SysRoomPo selectRoom(String roomNumber);
    SysRoomPo selectUserRoom(Integer userId);
    SysRoomPo selectRoomId(Integer roomId);
    List<SysRoomMemberPo> selectRoomMember(Integer roomId);
    boolean deleteRoomUser(Integer Id);
    boolean deleteRoomUserToo(Integer Id);
    boolean deleteRoom(Integer Id);
    boolean updateRoom(Integer roomId,Integer userId);
    int selectUserRoomCount(Integer roomMasterId);
    boolean updateWhetherPrepare(Integer roomId,Integer userId,boolean isOk);
}
