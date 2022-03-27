package com.yxm.dao.impl;

import com.yxm.dao.IGameDao;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.po.SysUserPo;
import com.yxm.util.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GameDaoImpl implements IGameDao {
    private final String selectRoomMember="SELECT Id,roomId,memberNickName,memberPortrait,userId,leftFigure,rightFigure,memberLocation,whetherPrepare FROM db_roommember WHERE roomId=? ORDER BY memberLocation";
    private final String selectRoom = "SELECT Id,roomNumber,roomState,isOk,peopleQuantity,roomMasterId FROM db_room WHERE Id=?";
    private final String deleteRoom = "DELETE FROM db_room WHERE Id=?";
    private final String deleteRoomUser="DELETE FROM db_roommember WHERE roomId=?";
    @Override
    public List<SysRoomMemberPo> selectRoomMember(Integer roomId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<SysRoomMemberPo> sysRoomMemberPoList = new ArrayList<>();
        try {
            conn= JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectRoomMember);
            ps.setInt(1,roomId);
            rs = ps.executeQuery();
            while (rs.next()){
                SysRoomMemberPo sysRoomMemberPo = new SysRoomMemberPo();
                sysRoomMemberPo.setMemberPortrait(rs.getString("memberPortrait"));
                sysRoomMemberPo.setRoomId(rs.getInt("roomId"));
                sysRoomMemberPo.setMemberNickName(rs.getString("memberNickName"));
                sysRoomMemberPo.setUserId(rs.getInt("userId"));
                sysRoomMemberPo.setLeftFigure(rs.getInt("leftFigure"));
                sysRoomMemberPo.setRightFigure(rs.getInt("rightFigure"));
                sysRoomMemberPo.setId(rs.getInt("Id"));
                sysRoomMemberPo.setMemberLocation(rs.getInt("memberLocation"));
                sysRoomMemberPo.setWhetherPrepare(rs.getInt("whetherPrepare"));
                sysRoomMemberPoList.add(sysRoomMemberPo);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return sysRoomMemberPoList;
    }
    public SysRoomPo selectRoom(Integer roomId){
        Connection conn=null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SysRoomPo sysRoomPo = null;
        try {
            conn=JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectRoom);
            ps.setInt(1,roomId);
            rs = ps.executeQuery();
            while (rs.next()){
                sysRoomPo = new SysRoomPo();
                sysRoomPo.setId(rs.getInt("Id"));
                sysRoomPo.setRoomState(rs.getInt("roomState"));
                sysRoomPo.setRoomNumber(rs.getString("roomNumber"));
                sysRoomPo.setRoomMasterId(rs.getInt("roomMasterId"));
                sysRoomPo.setIsOk(rs.getInt("isOk"));
                sysRoomPo.setPeopleQuantity(rs.getInt("peopleQuantity"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return sysRoomPo;
    }
    public boolean deleteRoom(Integer Id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(deleteRoom);
            ps.setInt(1,Id);
            boolR=ps.executeUpdate()==1||ps.executeUpdate()==0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }
    public boolean deleteRoomUser(Integer roomId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(deleteRoomUser);
            ps.setInt(1,roomId);
            boolR=ps.executeUpdate()==6||ps.executeUpdate()==0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }
}
