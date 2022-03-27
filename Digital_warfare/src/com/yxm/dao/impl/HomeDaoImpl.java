package com.yxm.dao.impl;

import com.yxm.dao.IHomeDao;
import com.yxm.po.SysChatPo;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.po.SysUserPo;
import com.yxm.util.JdbcUtils;
import com.yxm.vo.InformationList;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HomeDaoImpl implements IHomeDao {
    private final String selectFriendId = "SELECT myuserId AS friendId FROM db_friend WHERE myfriendId = ? UNION ALL SELECT myfriendId AS friendId FROM db_friend WHERE myuserId = ? AND friendState=1";
    private final String selectFriend = "SELECT Id,userName,userPassword,userPortrait,nickName,userPhone,userIdNo FROM db_user WHERE Id=?";
    private final String selectInformation = "SELECT Id FROM db_friend WHERE myfriendId = ? AND myuserId=? OR myfriendId=? AND myuserId=?";
    private final String selectInformationList = "SELECT db_chat.Id,db_chat.sendUserId,db_chat.friendId,db_chat.sendText,db_chat.sendPicture,db_chat.sendDate,db_user.nickName,db_user.userPortrait FROM db_chat INNER JOIN db_user ON db_chat.sendUserId =db_user.Id WHERE friendId=?";
    private final String insertChat = "INSERT INTO db_chat(sendUserId,friendId,sendText,sendDate) VALUE(?,?,?,NOW())";
    private final String addRoom="INSERT INTO db_room(roomNumber,roomState,isOk,peopleQuantity,roomMasterId) VALUE(?,?,?,?,?)";
    private final String addRoomPeople = "INSERT INTO db_roommember(roomId,memberNickName,memberPortrait,userId,memberLocation,whetherPrepare) VALUE(?,?,?,?,?,?)";
    private final String selectRoom ="SELECT Id,roomNumber,roomState,isOk,peopleQuantity,roomMasterId FROM db_room WHERE roomNumber=?";
    private final String selectUserRoom="SELECT Id,roomNumber,roomState,isOk,peopleQuantity,roomMasterId FROM db_room WHERE roomMasterId=?";
    private final String selectRoomId="SELECT Id,roomNumber,roomState,isOk,peopleQuantity,roomMasterId FROM db_room WHERE Id=?";
    private final String selectRoomMember = "SELECT Id,roomId,memberNickName,memberPortrait,userId,leftFigure,rightFigure,memberLocation,whetherPrepare FROM db_roommember WHERE roomId=?";
    private final String deleteRoomUserToo="DELETE FROM db_roommember WHERE userId=?";
    private final String deleteRoomUser="DELETE FROM db_roommember WHERE Id=?";
    private final String deleteRoom = "DELETE FROM db_room WHERE Id=?";
    private final String updateRoom = "UPDATE db_room SET roomMasterId =? WHERE Id = ?";
    private final String selectUserRoomCount = "SELECT COUNT(Id) FROM db_room WHERE roomMasterId=?";
    private final String updateWhetherPrepare = "UPDATE db_roommember SET whetherPrepare = ? WHERE roomId=? AND userId=?";

    @Override
    public List<Integer> selectFriendId(Integer myId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Integer> friendIdList=new ArrayList<>();
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectFriendId);
            ps.setInt(1,myId);
            ps.setInt(2,myId);
            rs = ps.executeQuery();
            while (rs.next()){
                friendIdList.add(rs.getInt("friendId"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return friendIdList;
    }

    @Override
    public SysUserPo selectFriend(Integer friendId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SysUserPo sysUserPo = null;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectFriend);
            ps.setInt(1,friendId);
            rs = ps .executeQuery();
            while (rs.next()){
                sysUserPo = new SysUserPo();
                sysUserPo.setUserName(rs.getString("userName"));
                sysUserPo.setUserPortrait(rs.getString("userPortrait"));
                sysUserPo.setNickName(rs.getString("nickName"));
                sysUserPo.setId(rs.getInt("Id"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return sysUserPo;
    }

    @Override
    public Integer selectInformation(Integer myUserId, Integer myFriendId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Integer Id = null;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectInformation);
            ps.setInt(1,myFriendId);
            ps.setInt(2,myUserId);
            ps.setInt(3,myUserId);
            ps.setInt(4,myFriendId);
            rs = ps.executeQuery();
            while (rs.next()){
                Id=rs.getInt("Id");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return Id;
    }

    @Override
    public List<InformationList> selectInformationList(Integer friendId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<InformationList> sysChatPoList=new ArrayList<>();
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectInformationList);
            ps.setInt(1,friendId);
            rs = ps.executeQuery();
            InformationList informationList = null;
            while (rs.next()){
                informationList = new InformationList();
                informationList.setId(rs.getInt("db_chat.Id"));
                informationList.setSendPicture(rs.getString("db_chat.sendPicture"));
                informationList.setSendText(rs.getString("db_chat.sendText"));
                informationList.setSendUserId(rs.getInt("db_chat.sendUserId"));
                informationList.setFriendId(rs.getInt("db_chat.friendId"));
                informationList.setSendDate(new Date(rs.getTimestamp("db_chat.sendDate").getTime()));
                informationList.setNickName(rs.getString("db_user.nickName"));
                informationList.setUserPortrait(rs.getString("db_user.userPortrait"));
                sysChatPoList.add(informationList);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return sysChatPoList;
    }

    @Override
    public boolean insertChat(SysChatPo sysChatPo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(insertChat);
            ps.setInt(1,sysChatPo.getSendUserId());
            ps.setInt(2,sysChatPo.getFriendId());
            ps.setString(3,sysChatPo.getSendText());
            boolR = ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public boolean addRoom(SysRoomPo sysRoomPo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(addRoom);
            ps.setString(1,sysRoomPo.getRoomNumber());
            ps.setInt(2,sysRoomPo.getRoomState());
            ps.setInt(3,sysRoomPo.getIsOk());
            ps.setInt(4,sysRoomPo.getPeopleQuantity());
            ps.setInt(5,sysRoomPo.getRoomMasterId());
            boolR = ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public boolean addRoomPeople(SysRoomMemberPo sysRoomMemberPo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(addRoomPeople);
            ps.setInt(1,sysRoomMemberPo.getRoomId());
            ps.setString(2,sysRoomMemberPo.getMemberNickName());
            ps.setString(3,sysRoomMemberPo.getMemberPortrait());
            ps.setInt(4,sysRoomMemberPo.getUserId());
            ps.setInt(5,sysRoomMemberPo.getMemberLocation());
            ps.setInt(6,sysRoomMemberPo.getWhetherPrepare());
            boolR = ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public SysRoomPo selectRoom(String roomNumber) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SysRoomPo sysRoomPo = null;
        try {
            conn = JdbcUtils.getConnection();
            ps=conn.prepareStatement(selectRoom);
            ps.setString(1,roomNumber);
            rs = ps.executeQuery();
            while (rs.next()){
                sysRoomPo = new SysRoomPo();
                sysRoomPo.setRoomNumber(rs.getString("roomNumber"));
                sysRoomPo.setRoomState(rs.getInt("roomState"));
                sysRoomPo.setRoomMasterId(rs.getInt("roomMasterId"));
                sysRoomPo.setPeopleQuantity(rs.getInt("peopleQuantity"));
                sysRoomPo.setId(rs.getInt("Id"));
                sysRoomPo.setIsOk(rs.getInt("isOk"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return sysRoomPo;
    }

    @Override
    public SysRoomPo selectUserRoom(Integer userId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SysRoomPo sysRoomPo = null;
        try {
            conn = JdbcUtils.getConnection();
            ps=conn.prepareStatement(selectUserRoom);
            ps.setInt(1,userId);
            rs = ps.executeQuery();
            while (rs.next()){
                sysRoomPo = new SysRoomPo();
                sysRoomPo.setRoomNumber(rs.getString("roomNumber"));
                sysRoomPo.setRoomState(rs.getInt("roomState"));
                sysRoomPo.setRoomMasterId(rs.getInt("roomMasterId"));
                sysRoomPo.setPeopleQuantity(rs.getInt("peopleQuantity"));
                sysRoomPo.setId(rs.getInt("Id"));
                sysRoomPo.setIsOk(rs.getInt("isOk"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return sysRoomPo;
    }

    @Override
    public SysRoomPo selectRoomId(Integer roomId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SysRoomPo sysRoomPo = null;
        try {
            conn = JdbcUtils.getConnection();
            ps=conn.prepareStatement(selectRoomId);
            ps.setInt(1,roomId);
            rs = ps.executeQuery();
            while (rs.next()){
                sysRoomPo = new SysRoomPo();
                sysRoomPo.setRoomNumber(rs.getString("roomNumber"));
                sysRoomPo.setRoomState(rs.getInt("roomState"));
                sysRoomPo.setRoomMasterId(rs.getInt("roomMasterId"));
                sysRoomPo.setPeopleQuantity(rs.getInt("peopleQuantity"));
                sysRoomPo.setId(rs.getInt("Id"));
                sysRoomPo.setIsOk(rs.getInt("isOk"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return sysRoomPo;
    }

    @Override
    public List<SysRoomMemberPo> selectRoomMember(Integer roomId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<SysRoomMemberPo> sysRoomMemberPoList = new ArrayList<>();
        try {
            conn=JdbcUtils.getConnection();
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

    @Override
    public boolean deleteRoomUser(Integer Id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(deleteRoomUser);
            ps.setInt(1,Id);
            boolR=ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public boolean deleteRoomUserToo(Integer Id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(deleteRoomUserToo);
            ps.setInt(1,Id);
            boolR=ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public boolean deleteRoom(Integer Id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(deleteRoom);
            ps.setInt(1,Id);
            boolR=ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public boolean updateRoom(Integer roomId,Integer userId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(updateRoom);
            ps.setInt(1,userId);
            ps.setInt(2,roomId);
            boolR = ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public int selectUserRoomCount(Integer roomMasterId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectUserRoomCount);
            ps.setInt(1,roomMasterId);
            rs = ps.executeQuery();
            while (rs.next()){
                count=rs.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return count;
    }

    @Override
    public boolean updateWhetherPrepare(Integer roomId, Integer userId,boolean isOk) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(updateWhetherPrepare);
            if(isOk){
                ps.setInt(1,2);
            }else {
                ps.setInt(1,1);
            }
            ps.setInt(2,roomId);
            ps.setInt(3,userId);
            boolR=ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }
}
