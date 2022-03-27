package com.yxm.service.impl;

import com.yxm.dao.ILoginDao;
import com.yxm.dao.impl.LoginDaoImpl;
import com.yxm.po.SysUserPo;
import com.yxm.service.ILoginService;

public class LoginServiceImpl implements ILoginService {
    private final ILoginDao loginDao = new LoginDaoImpl();
    @Override
    public SysUserPo selectUser(String userName) {
        return this.loginDao.selectUser(userName);
    }

    @Override
    public Integer selectUserPhone(String userPhone) {
        return this.loginDao.selectUserPhone(userPhone);
    }

    @Override
    public boolean insertUser(SysUserPo sysUserPo) {
        return this.loginDao.insertUser(sysUserPo);
    }

    @Override
    public boolean perfectUser(SysUserPo sysUserPo) {
        return this.loginDao.perfectUser(sysUserPo);
    }
}
