package com.yxm.service.impl;

import com.yxm.dao.IHomeDao;
import com.yxm.dao.impl.HomeDaoImpl;
import com.yxm.po.SysChatPo;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.po.SysUserPo;
import com.yxm.service.IHomeService;
import com.yxm.util.JdbcUtils;
import com.yxm.vo.InformationList;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HomeServiceImpl implements IHomeService {
    private final IHomeDao homeDao = new HomeDaoImpl();
    @Override
    public List<Integer> selectFriendId(Integer myId) {
        return this.homeDao.selectFriendId(myId);
    }

    @Override
    public List<SysUserPo> selectFriend(List<Integer> friendIdList) {
        List<SysUserPo> friend=new ArrayList<>();
        for (Integer firend:friendIdList) {
            friend.add(this.homeDao.selectFriend(firend));
        }
        return friend;
    }

    @Override
    public Integer selectInformation(Integer myUserId, Integer myFriendId) {
        return this.homeDao.selectInformation(myUserId,myFriendId);
    }

    @Override
    public List<InformationList> selectInformationList(Integer friendId) {
        return this.homeDao.selectInformationList(friendId);
    }

    @Override
    public boolean addRoom(SysRoomPo sysRoomPo) {
        return this.homeDao.addRoom(sysRoomPo);
    }

    @Override
    public boolean addRoomPeople(SysRoomMemberPo sysRoomMemberPo) {
        return this.homeDao.addRoomPeople(sysRoomMemberPo);
    }

    @Override
    public SysRoomPo selectRoom(String roomNumber) {
        return this.homeDao.selectRoom(roomNumber);
    }

    @Override
    public SysRoomPo selectUserRoom(Integer userId) {
        return this.homeDao.selectUserRoom(userId);
    }

    @Override
    public List<SysRoomMemberPo> selectRoomMember(Integer roomId) {
        return this.homeDao.selectRoomMember(roomId);
    }

    @Override
    public boolean deleteRoomAndUser(Integer roomId, Integer roomMemberId) {
        boolean boolR =false;
        try {
            JdbcUtils.beginTransaction();
            boolean isOk = this.homeDao.deleteRoomUser(roomMemberId);
            if(!isOk){
                throw new SQLException("删除房间成员失败");
            }
            boolean Ok = this.homeDao.deleteRoom(roomId);
            if(Ok){
                JdbcUtils.commitTransaction();
                boolR = true;
            }else {
                throw new SQLException("删除房间失败");
            }
        } catch (SQLException throwables) {
            try {
                JdbcUtils.rollbackTransaction();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throwables.printStackTrace();
        }
        return boolR;
    }

    @Override
    public SysRoomPo selectRoomId(Integer roomId) {
        return this.homeDao.selectRoomId(roomId);
    }

    @Override
    public boolean transferRoomMaster(Integer roomId, Integer userId,Integer roomMemberId) {
        boolean boolR = false;
        try {
            JdbcUtils.beginTransaction();
            boolean isOk = this.homeDao.updateRoom(roomId,userId);
            boolean end = this.homeDao.updateWhetherPrepare(roomId,userId,true);
            if(!isOk&&!end){
                throw new SQLException("房主转移失败");
            }
            boolean ok = this.homeDao.deleteRoomUserToo(roomMemberId);
            if(ok){
                JdbcUtils.commitTransaction();
                boolR=true;
            }
        } catch (SQLException throwables) {
            try {
                JdbcUtils.rollbackTransaction();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throwables.printStackTrace();
        }
        return boolR;
    }
}
