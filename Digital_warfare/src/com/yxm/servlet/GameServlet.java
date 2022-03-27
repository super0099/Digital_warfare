package com.yxm.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yxm.common.WarfareServlet;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysUserPo;
import com.yxm.service.IGameService;
import com.yxm.service.IHomeService;
import com.yxm.service.impl.GameServiceImpl;
import com.yxm.service.impl.HomeServiceImpl;
import com.yxm.util.ProjectParameter;
import com.yxm.vo.JsonMsg;
import com.yxm.vo.RoomIdAndUserId;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class GameServlet extends WarfareServlet {
    private final IHomeService homeService = new HomeServiceImpl();
    private final IGameService gameService = new GameServiceImpl();
    ObjectMapper objectMapper = new ObjectMapper();
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SysUserPo sysUserPo = (SysUserPo) session.getAttribute(ProjectParameter.SESSION_USER);
        String roomId = request.getParameter("roomId");
        if (sysUserPo!=null){
            RoomIdAndUserId roomIdAndUserId = new RoomIdAndUserId();
            roomIdAndUserId.setRoomId(Integer.parseInt(roomId));
            roomIdAndUserId.setUserId(sysUserPo.getId());
            request.setAttribute("roomIdAndUserId",roomIdAndUserId);
            request.getRequestDispatcher("/jsp/game.jsp").forward(request,response);
        }else{
            //未登录  重定向到项目的根路径 跳转到login页面
            response.sendRedirect(request.getContextPath());
        }
    }
    public void selectMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String roomId = request.getParameter("roomId");
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(Integer.parseInt(roomId));
        retunJson(response,sysRoomMemberPoList);
    }
    public void closeGame(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonMsg jsonMsg = new JsonMsg();
        String roomId = request.getParameter("roomId");
        boolean isOk = this.gameService.deleteRoom(Integer.parseInt(roomId));
        boolean is = this.gameService.deleteRoomUser(Integer.parseInt(roomId));
        if(isOk||is){
            jsonMsg.setState(true);
        }
        retunJson(response,jsonMsg);
    }
}
