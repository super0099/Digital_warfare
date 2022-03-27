package com.yxm.dao;

import com.yxm.po.SysUserPo;

public interface ILoginDao {
    SysUserPo selectUser(String userName);
    Integer selectUserPhone(String userPhone);
    boolean insertUser(SysUserPo sysUserPo);
    boolean perfectUser(SysUserPo sysUserPo);
}
