package com.yxm.service.impl;

import com.yxm.dao.IGameDao;
import com.yxm.dao.impl.GameDaoImpl;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.service.IGameService;

import java.util.List;

public class GameServiceImpl implements IGameService {
    private final IGameDao iGameDao = new GameDaoImpl();
    @Override
    public List<SysRoomMemberPo> selectRoomMember(Integer roomId) {
        return this.iGameDao.selectRoomMember(roomId);
    }

    @Override
    public SysRoomPo selectRoom(Integer roomId) {
        return this.iGameDao.selectRoom(roomId);
    }

    @Override
    public boolean deleteRoomUser(Integer roomId) {
        return this.iGameDao.deleteRoomUser(roomId);
    }

    @Override
    public boolean deleteRoom(Integer Id) {
        return this.iGameDao.deleteRoom(Id);
    }
}
