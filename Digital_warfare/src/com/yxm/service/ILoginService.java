package com.yxm.service;

import com.yxm.po.SysUserPo;

public interface ILoginService {
    SysUserPo selectUser(String userName);
    Integer selectUserPhone(String userPhone);
    boolean insertUser(SysUserPo sysUserPo);
    boolean perfectUser(SysUserPo sysUserPo);
}
