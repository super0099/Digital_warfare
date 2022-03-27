package com.yxm.servlet;

import com.yxm.common.RandomNumber;
import com.yxm.common.WarfareServlet;
import com.yxm.dao.IHomeDao;
import com.yxm.dao.impl.HomeDaoImpl;
import com.yxm.po.SysChatPo;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.po.SysUserPo;
import com.yxm.service.IHomeService;
import com.yxm.service.impl.HomeServiceImpl;
import com.yxm.util.ProjectParameter;
import com.yxm.util.Tools;
import com.yxm.vo.InformationList;
import com.yxm.vo.JsonMsg;
import com.yxm.vo.RoomMemberAndRoomFriend;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class HomeServlet extends WarfareServlet {
    private final IHomeService homeService = new HomeServiceImpl();
    private final IHomeDao homeDao = new HomeDaoImpl();
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SysUserPo sysUserPo = (SysUserPo) session.getAttribute(ProjectParameter.SESSION_USER);
        if (sysUserPo!=null){
            request.setAttribute("sysUserPo",sysUserPo);
            //转发
            request.getRequestDispatcher("jsp/home.jsp").forward(request,response);
        }else{
            //未登录  重定向到项目的根路径 跳转到login页面
            response.sendRedirect(request.getContextPath());
        }
    }
    public void selectFriend(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String myId = request.getParameter("myId");
        List<Integer> friendIdList = this.homeService.selectFriendId(Integer.parseInt(myId));
        List<SysUserPo> friendList = this.homeService.selectFriend(friendIdList);
        retunJson(response,friendList);
    }
    public void selectInformation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String myUserId = request.getParameter("myUserId");
        String myFriendId = request.getParameter("myFriendId");
        Integer informationId = this.homeService.selectInformation(Integer.parseInt(myFriendId),Integer.parseInt(myUserId));
        List<InformationList> informationList = this.homeService.selectInformationList(informationId);
        retunJson(response,informationList);
    }
    //打开房间
    public void addRoom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        SysUserPo sysUserPo = (SysUserPo) session.getAttribute(ProjectParameter.SESSION_USER);
        JsonMsg jsonMsg = new JsonMsg();
        String userid= request.getParameter("userId");
        SysRoomPo sysRoomPo = new SysRoomPo();
        RandomNumber randomNumber = new RandomNumber();
        if(Tools.isNotNull(userid)){
            SysRoomPo selectUserRoom = this.homeService.selectUserRoom(Integer.parseInt(userid));
            if(selectUserRoom==null){
                sysRoomPo.setRoomMasterId(Integer.parseInt(userid));
                sysRoomPo.setRoomState(1);
                sysRoomPo.setIsOk(1);
                sysRoomPo.setRoomNumber(randomNumber.RandomN(7));
                sysRoomPo.setPeopleQuantity(6);
                boolean addRoom = this.homeService.addRoom(sysRoomPo);
                if(addRoom){
                    SysRoomPo selectRoom = this.homeService.selectRoom(sysRoomPo.getRoomNumber());
                    SysRoomMemberPo sysRoomMemberPo = new SysRoomMemberPo();
                    sysRoomMemberPo.setRoomId(selectRoom.getId());
                    sysRoomMemberPo.setMemberPortrait(sysUserPo.getUserPortrait());
                    sysRoomMemberPo.setMemberNickName(sysUserPo.getNickName());
                    sysRoomMemberPo.setUserId(Integer.parseInt(userid));
                    sysRoomMemberPo.setMemberLocation(1);
                    sysRoomMemberPo.setWhetherPrepare(2);
                    boolean isOk = this.homeService.addRoomPeople(sysRoomMemberPo);
                    if(isOk){
                        jsonMsg.setState(true);
                        jsonMsg.setData(selectRoom);
                    }else {
                        jsonMsg.setMsg("房间创建失败");
                    }
                }else {
                    jsonMsg.setMsg("房间创建失败");
                }
            }else {
                jsonMsg.setMsg("你已经是另一个房间的房主,无法再次创建房间");
            }
        }else {
            jsonMsg.setMsg("数据异常,无法获取你的信息");
        }
        retunJson(response,jsonMsg);
    }
    //退出房间
    public void closeRoom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonMsg jsonMsg = new JsonMsg();
        String roomId = request.getParameter("roomId");
        String userId = request.getParameter("loginUserId");

        boolean isOk=false;
        if(Tools.isNotNull(roomId)){
            if(Tools.isNotNull(userId)){
                List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeService.selectRoomMember(Integer.parseInt(roomId));
                if(sysRoomMemberPoListy.size()>0){
                    //如果存在多个房间成员,判断删除的是否为房主,是就要转让房主
                    if(sysRoomMemberPoListy.size()>1){
                        SysRoomPo sysRoomPo = this.homeService.selectRoomId(Integer.parseInt(roomId));
                        for(SysRoomMemberPo tlme:sysRoomMemberPoListy){
                            //说明想要退出的是房主
                            if(sysRoomPo.getRoomMasterId()==tlme.getUserId()&&tlme.getUserId()==Integer.parseInt(userId)){
                                int i = 0;
                                for(SysRoomMemberPo data:sysRoomMemberPoListy){
                                    //把房主转移
                                    if(i==1){
                                        //已经转移
                                        isOk = this.homeService.transferRoomMaster(Integer.parseInt(roomId),data.getUserId(),tlme.getUserId());
                                        if(isOk){
                                            jsonMsg.setState(true);
                                        }else {
                                            jsonMsg.setMsg("转移失败");
                                        }
                                    }
                                    i++;
                                }
                            }else {
                                //退出的不是房主,直接删除
                                if(tlme.getUserId()==Integer.parseInt(userId)){
                                    isOk=this.homeDao.deleteRoomUser(tlme.getId());
                                    if(isOk){
                                        jsonMsg.setState(true);
                                    }else {
                                        jsonMsg.setMsg("退出失败");
                                    }
                                }
                            }

                        }
                    }else {
                        //否则把成员删除,和房间删除
                        for(SysRoomMemberPo tlme:sysRoomMemberPoListy){
                            isOk=this.homeService.deleteRoomAndUser(Integer.parseInt(roomId),tlme.getId());
                        }
                        if(isOk){
                            jsonMsg.setState(true);
                        }else {
                            jsonMsg.setMsg("退出失败");
                        }
                    }
                }else {
                    jsonMsg.setMsg("该房间居然没有人");
                }
            }else {
                jsonMsg.setMsg("数据异常");
            }
        }else {
            jsonMsg.setMsg("数据异常");
        }
        retunJson(response,jsonMsg);
    }
    //加入房间
    public void joinRoom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonMsg jsonMsg = new JsonMsg();
        String userId= request.getParameter("userId");
        String roomId = request.getParameter("roomId");
        String memberNickName = request.getParameter("memberNickName");
        String memberPortrait = request.getParameter("memberPortrait");
        if(Tools.isNotNull(userId)){
            if(Tools.isNotNull(roomId)){
                //查询出当前用户是否已经加入其他的房间
                int count = this.homeDao.selectUserRoomCount(Integer.parseInt(userId));
                if(count==0){
                    //查询出当前房间是否存在,人数是否已满
                    SysRoomPo sysRoomPo = this.homeService.selectRoomId(Integer.parseInt(roomId));
                    if(sysRoomPo!=null){
                        List<SysRoomMemberPo> sysRoomMemberPoList = this.homeService.selectRoomMember(Integer.parseInt(roomId));
                        String[] roomLocation = new String[sysRoomMemberPoList.size()];
                        int k=0;
                        for(SysRoomMemberPo tlme:sysRoomMemberPoList){
                            roomLocation[k] = (tlme.getMemberLocation().toString());
                            k++;
                        }
                        if(sysRoomMemberPoList.size()<6){
                            SysRoomMemberPo sysRoomMemberPo = new SysRoomMemberPo();
                            sysRoomMemberPo.setRoomId(Integer.parseInt(roomId));
                            sysRoomMemberPo.setUserId(Integer.parseInt(userId));
                            sysRoomMemberPo.setMemberNickName(memberNickName);
                            sysRoomMemberPo.setMemberPortrait(memberPortrait);
                            sysRoomMemberPo.setWhetherPrepare(1);
                            for(Integer a =0;a<1;a++){
                                if(!Arrays.asList(roomLocation).contains("1")){
                                    sysRoomMemberPo.setMemberLocation(1);
                                    break;
                                }
                                if(!Arrays.asList(roomLocation).contains("2")){
                                    sysRoomMemberPo.setMemberLocation(2);
                                    break;
                                }
                                if(!Arrays.asList(roomLocation).contains("3")){
                                    sysRoomMemberPo.setMemberLocation(3);
                                    break;
                                }
                                if(!Arrays.asList(roomLocation).contains("4")){
                                    sysRoomMemberPo.setMemberLocation(4);
                                    break;
                                }
                                if(!Arrays.asList(roomLocation).contains("5")){
                                    sysRoomMemberPo.setMemberLocation(5);
                                    break;
                                }
                                if(!Arrays.asList(roomLocation).contains("6")){
                                    sysRoomMemberPo.setMemberLocation(6);
                                    break;
                                }
                            }
                            boolean isOk = this.homeService.addRoomPeople(sysRoomMemberPo);
                            if(isOk){
                                jsonMsg.setState(true);
                            }else {
                                jsonMsg.setMsg("加入失败");
                            }
                        }else {
                            jsonMsg.setMsg("人数已满");
                        }
                    }else {
                        jsonMsg.setMsg("该房间已经解散");
                    }
                }else {
                    jsonMsg.setMsg("你已经加入了其他的房间,无法加入");
                }
            }else {
                jsonMsg.setMsg("数据异常,无法加入");
            }
        }else {
            jsonMsg.setMsg("数据异常,无法加入");
        }
        retunJson(response,jsonMsg);
    }
    //加入房间回填好友信息
    public void memberLoad(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String roomId = request.getParameter("roomId");
        String myId = request.getParameter("myId");
        SysRoomPo sysRoomPo = this.homeService.selectRoomId(Integer.parseInt(roomId));
        List<SysRoomMemberPo> sysRoomMemberPoList = this.homeService.selectRoomMember(Integer.parseInt(roomId));
        List<Integer> friendIdList = this.homeService.selectFriendId(Integer.parseInt(myId));
        List<SysUserPo> friendList = this.homeService.selectFriend(friendIdList);
        RoomMemberAndRoomFriend roomMemberAndRoomFriend = new RoomMemberAndRoomFriend();
        roomMemberAndRoomFriend.setFriendList(friendList);
        roomMemberAndRoomFriend.setSysRoomMemberPoList(sysRoomMemberPoList);
        roomMemberAndRoomFriend.setRoomMasterId(sysRoomPo.getRoomMasterId());
        roomMemberAndRoomFriend.setRoomId(Integer.parseInt(roomId));
        roomMemberAndRoomFriend.setRoomNumber(sysRoomPo.getRoomNumber());
        retunJson(response,roomMemberAndRoomFriend);
    }
    //重置房间
    public void resetRoom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonMsg jsonMsg = new JsonMsg();
        String loginUserId = request.getParameter("loginUserId");
        Integer userId = Integer.parseInt(loginUserId);
        if(Tools.isNotNull(loginUserId)){
            SysRoomPo sysRoomPo = this.homeService.selectUserRoom(userId);
            //判断是否为房主
            if(sysRoomPo!=null){
                //查出成员,转让群主
                List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeService.selectRoomMember(sysRoomPo.getId());
                if(sysRoomMemberPoListy.size()>0){
                    //如果存在多个房间成员,判断删除的是否为房主,是就要转让房主
                    if(sysRoomMemberPoListy.size()>1){
                        for(SysRoomMemberPo tlme:sysRoomMemberPoListy){
                            //说明想要退出的是房主
                            if(sysRoomPo.getRoomMasterId()==tlme.getUserId()&&tlme.getUserId()==userId){
                                int i = 0;
                                for(SysRoomMemberPo data:sysRoomMemberPoListy){
                                    //把房主转移
                                    if(i==1){
                                        //已经转移
                                        boolean isOk = this.homeService.transferRoomMaster(sysRoomPo.getId(),data.getUserId(),tlme.getUserId());
                                        if(isOk){
                                            jsonMsg.setState(true);
                                            jsonMsg.setData(sysRoomPo);
                                            break;
                                        }else {
                                            jsonMsg.setMsg("转移失败");
                                            break;
                                        }
                                    }
                                    i++;
                                }
                            }
                        }
                    }else {
                        boolean isOk=false;
                        //否则把成员删除,和房间删除
                        for(SysRoomMemberPo tlme:sysRoomMemberPoListy){
                            isOk=this.homeService.deleteRoomAndUser(sysRoomPo.getId(),tlme.getId());
                        }
                        if(isOk){
                            jsonMsg.setState(true);
                        }else {
                            jsonMsg.setMsg("退出失败");
                        }
                    }
                }else {
                    jsonMsg.setMsg("该房间居然没有人");
                }
            }else {
                jsonMsg.setMsg("没有可重置的房间");
            }
        }else {
            jsonMsg.setMsg("数据异常");
        }
        retunJson(response,jsonMsg);
    }
}
