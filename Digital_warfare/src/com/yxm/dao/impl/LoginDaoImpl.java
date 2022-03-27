package com.yxm.dao.impl;

import com.yxm.dao.ILoginDao;
import com.yxm.po.SysUserPo;
import com.yxm.util.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDaoImpl implements ILoginDao {
    private static final String selectUser = "SELECT Id,userName,userPassword,userPortrait,nickName,userPhone,userIdNo FROM db_user WHERE userName=?";
    private static final String selectUserPhone="SELECT COUNT(Id) FROM db_user WHERE userPhone=?";
    private static final String insertUser = "INSERT INTO db_user(userName,userPassword,userPhone) VALUE(?,?,?)";
    private static final String perfectUser = "UPDATE db_user SET userPortrait=?,nickName=? WHERE Id=?";
    @Override
    public SysUserPo selectUser(String userName) {
        Connection conn= null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SysUserPo sysUserPo = null;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectUser);
            ps.setString(1,userName);
            rs = ps.executeQuery();
            while (rs.next()){
                sysUserPo = new SysUserPo();
                sysUserPo.setUserIdNo(rs.getString("userIdNo"));
                sysUserPo.setUserName(rs.getString("userName"));
                sysUserPo.setUserPhone(rs.getString("userPhone"));
                sysUserPo.setUserPassword(rs.getString("userPassword"));
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
    public Integer selectUserPhone(String userPhone) {
        Connection conn= null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Integer Count = 0;
        try {
            conn=JdbcUtils.getConnection();
            ps = conn.prepareStatement(selectUserPhone);
            ps.setString(1,userPhone);
            rs = ps.executeQuery();
            while (rs.next()){
                Count=rs.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return Count;
    }

    @Override
    public boolean insertUser(SysUserPo sysUserPo) {
        Connection conn= null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(insertUser);
            ps.setString(1,sysUserPo.getUserName());
            ps.setString(2,sysUserPo.getUserPassword());
            ps.setString(3,sysUserPo.getUserPhone());
            boolR = ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }

    @Override
    public boolean perfectUser(SysUserPo sysUserPo) {
        Connection conn= null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean boolR = false;
        try {
            conn = JdbcUtils.getConnection();
            ps = conn.prepareStatement(perfectUser);
            ps.setString(1,sysUserPo.getUserPortrait());
            ps.setString(2,sysUserPo.getNickName());
            ps.setInt(3,sysUserPo.getId());
            boolR = ps.executeUpdate()==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JdbcUtils.close(conn,ps,rs);
        }
        return boolR;
    }
}
