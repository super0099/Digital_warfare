package com.yxm.servlet;

import com.yxm.common.WarfareServlet;
import com.yxm.po.SysUserPo;
import com.yxm.service.ILoginService;
import com.yxm.service.impl.LoginServiceImpl;
import com.yxm.util.MD5Util;
import com.yxm.util.ProjectParameter;
import com.yxm.util.Tools;
import com.yxm.vo.JsonMsg;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

public class LoginServlet extends WarfareServlet {
    private final ILoginService loginService = new LoginServiceImpl();
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
    }
    //登录
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonMsg jsonMsg = new JsonMsg();
        String loginUserName = request.getParameter("loginUserName");
        String loginPassword = request.getParameter("loginPassword");
        HttpSession session = request.getSession();
        if(Tools.isNotNull(loginUserName)){
            if(Tools.isNotNull(loginPassword)){
                SysUserPo sysUserPo = this.loginService.selectUser(loginUserName);
                if(sysUserPo!=null){
                    String md5Pass = MD5Util.getMD5(loginPassword);
                    if(md5Pass.equals(sysUserPo.getUserPassword())){
                        session.setAttribute(ProjectParameter.SESSION_USER,sysUserPo);
                        jsonMsg.setData(sysUserPo);
                        jsonMsg.setState(true);
                    }else {
                        jsonMsg.setMsg("密码不正确");
                    }
                }else {
                    jsonMsg.setMsg("该用户不存在");
                }
            }else {
                jsonMsg.setMsg("密码不能为空");
            }
        }else {
            jsonMsg.setMsg("账号不能为空");
        }
        retunJson(response,jsonMsg);
    }
    //登录完善基本信息
    public void selectData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonMsg jsonMsg = new JsonMsg();
        String userName = request.getParameter("Id");
        if(Tools.isNotNull(userName)){
            SysUserPo sysUserPo = this.loginService.selectUser(userName);
            if(sysUserPo.getNickName()!=null||sysUserPo.getUserPortrait()!=null){
                jsonMsg.setState(true);
            }else {
                jsonMsg.setState(false);
            }
        }else {
            jsonMsg.setMsg("数据异常");
        }
        retunJson(response,jsonMsg);
    }
    //注册
    public void Register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonMsg jsonMsg = new JsonMsg();
        String registerUserName = request.getParameter("registerUserName");
        String registerPassword = request.getParameter("registerPassword");
        String registerPhone = request.getParameter("registerPhone");
        if(Tools.isNotNull(registerUserName)){
            if(Tools.isNotNull(registerPassword)){
                if(Tools.isNotNull(registerPhone)){
                    SysUserPo sysUserPo = this.loginService.selectUser(registerUserName);
                    if(sysUserPo==null){
                        Integer Count = this.loginService.selectUserPhone(registerPhone);
                        if(Count==0){
                            String password = MD5Util.getMD5(registerPassword);
                            SysUserPo sysUserPo1 = new SysUserPo();
                            sysUserPo1.setUserName(registerUserName);
                            sysUserPo1.setUserPassword(password);
                            sysUserPo1.setUserPhone(registerPhone);
                            boolean isKo = this.loginService.insertUser(sysUserPo1);
                            if(isKo){
                                jsonMsg.setMsg("注册成功");
                                jsonMsg.setState(true);
                            }else {
                                jsonMsg.setMsg("注册失败");
                            }
                        }else {
                            jsonMsg.setMsg("一个手机号只能创建一个账号");
                        }
                    }else {
                        jsonMsg.setMsg("该用户已经存在");
                    }
                }else {
                    jsonMsg.setMsg("手机号不能为空");
                }
            }else {
                jsonMsg.setMsg("密码不能为空");
            }
        }else {
            jsonMsg.setMsg("账号不能为空");
        }
        retunJson(response,jsonMsg);
    }
}
