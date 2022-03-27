package com.yxm.service;

import com.yxm.po.SysChatPo;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.po.SysUserPo;
import com.yxm.vo.InformationList;

import java.util.List;

public interface IHomeService {
    List<Integer> selectFriendId(Integer myId);
    List<SysUserPo> selectFriend(List<Integer> friendIdList);
    Integer selectInformation(Integer myUserId,Integer myFriendId);
    List<InformationList> selectInformationList(Integer friendId);
    boolean addRoom(SysRoomPo sysRoomPo);
    boolean addRoomPeople(SysRoomMemberPo sysRoomMemberPo);
    SysRoomPo selectRoom(String roomNumber);
    SysRoomPo selectUserRoom(Integer userId);
    List<SysRoomMemberPo> selectRoomMember(Integer roomId);
    boolean deleteRoomAndUser(Integer roomId,Integer roomMemberId);
    SysRoomPo selectRoomId(Integer roomId);
    boolean transferRoomMaster(Integer roomId,Integer userId,Integer roomMemberId);
}
