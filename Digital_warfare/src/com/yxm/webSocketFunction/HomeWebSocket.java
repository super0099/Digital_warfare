package com.yxm.webSocketFunction;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yxm.common.GetHttpSessionConfigurator;
import com.yxm.dao.IHomeDao;
import com.yxm.dao.impl.HomeDaoImpl;
import com.yxm.po.SysChatPo;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysRoomPo;
import com.yxm.po.SysUserPo;
import com.yxm.util.ProjectParameter;
import com.yxm.vo.*;
import net.sf.json.JSONObject;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.*;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value ="/HomeChat",configurator=GetHttpSessionConfigurator.class)
public class HomeWebSocket {
    private static Map<Integer,HomeWebSocket> sessionMap = new ConcurrentHashMap<>();
    private Session session;
    private HttpSession httpSession;
    private Integer loginUserId;
    private String loginUserName;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final IHomeDao homeDao = new HomeDaoImpl();
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) throws IOException {
        HttpSession httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        SysUserPo loginUser = (SysUserPo) httpSession.getAttribute(ProjectParameter.SESSION_USER);
        loginUserName=loginUser.getNickName();
        loginUserId = loginUser.getId();
        this.httpSession = httpSession;
        this.session=session;
        sessionMap.put(loginUserId,this);
        System.out.println("用户"+loginUser.getNickName()+"已登录");
        System.out.println("当前在线人数为"+sessionMap.size());
        for(Integer key : sessionMap.keySet()){
            HomeWebSocket userSession = sessionMap.get(key);
            userSession.session.getBasicRemote().sendText(JsonStr());
        }
    }

    @OnMessage
    public void onMessage(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer state = json.getInt("state");
        if(state==2){
            SystemSend(msg);
        }
        if(state==3){
            try {
                userSendSys(msg);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        //用户之间的聊天
        if(state==4){
            userSendUser(msg);
        }
        //世界窗口
        if(state==5){
            userSendWard(msg);
        }
        //房间招募
        if(state==6){
            roomRecruit(msg);
        }
        //用户退出房间
        if(state==8){
            closeRoom(msg);
        }
        //用户加入房间
        if(state==9){
            joinRoom(msg);
        }
        //用户准备和取消准备
        if(state==10){
            whetherPrepare(msg);
        }
        //房间内聊天
        if(state==11){
            roomChat(msg);
        }
        //房间邀请好友
        if(state==12){
            inviteHe(msg);
        }
        //开始游戏
        if(state==13){
            startGame(msg);
        }
    }
    

    @OnError
    public void onError(Throwable error) {
        System.out.println("发生错误");
    }
    @OnClose
    public void onClose() throws IOException {
        sessionMap.remove(loginUserId);  //从set中删除
        for(Integer key : sessionMap.keySet()){
            HomeWebSocket userSession = sessionMap.get(key);
            userSession.session.getBasicRemote().sendText(JsonStr());
        }
    }

    //返回在线用户和在线用户数组
    public String JsonStr() throws JsonProcessingException {
        SystemData systemData = new SystemData();
        systemData.setState(1);
        systemData.setCount(sessionMap.size());
        List<Integer> loginUser =new ArrayList<>();
        for(Integer key : sessionMap.keySet()){
            loginUser.add(key);
        }
        systemData.setLoginUser(loginUser);
        String strJson = objectMapper.writeValueAsString(systemData);
        return strJson;
    }

    public void SystemSend(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer recipient = json.getInt("recipient");
        SystemData systemData = new SystemData();
        systemData.setSendDate(json.getString("sendDate"));
        systemData.setState(json.getInt("state"));
        systemData.setSysNickName(json.getString("nickName"));
        systemData.setSendText(json.getString("sendText"));
        systemData.setSysPortrait(json.getString("portrait"));
        String strJson = objectMapper.writeValueAsString(systemData);
        for(Integer key : sessionMap.keySet()){
            if(key==recipient){
                HomeWebSocket userSession = sessionMap.get(key);
                userSession.session.getBasicRemote().sendText(strJson);
            }
        }
    }
    public void userSendSys(String msg) throws IOException, InterruptedException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer recipient = json.getInt("sendUserId");
        String sendText = json.getString("sendText");
        SystemData myData = new SystemData();
        myData.setState(2);
        myData.setSendDate(json.getString("sendDate"));
        myData.setUserNickName(json.getString("myNickName"));
        myData.setUserPortrait(json.getString("myPortrait"));
        myData.setSendText(json.getString("sendText"));
        myData.setRecipient(recipient);
        String myStrJson = objectMapper.writeValueAsString(myData);
        Thread threadmain = Thread.currentThread();
        for(Integer key : sessionMap.keySet()) {
            if (key == recipient) {
                HomeWebSocket userSession = sessionMap.get(key);
                userSession.session.getBasicRemote().sendText(myStrJson);
            }
        }
        threadmain.sleep(600);//使线程睡眠600毫秒
        if(!"玩法".equals(sendText)&&!"开发".equals(sendText)&&!"新手礼包".equals(sendText)&&
        !"你叫什么".equals(sendText)&&!"你好".equals(sendText)&&!"去死吧".equals(sendText)&&
        !"我叫什么".equals(sendText)){
            SystemData systemData = new SystemData();
            systemData.setState(2);
            systemData.setSysPortrait(json.getString("sysPortrait"));
            systemData.setSysNickName(json.getString("sysNickName"));
            systemData.setSendText("怪我不够强大不能识别你说什么");
            systemData.setSendDate(json.getString("sendDate"));
            String strJson = objectMapper.writeValueAsString(systemData);
            for(Integer key : sessionMap.keySet()){
                if(key==recipient){
                    HomeWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }else {
            if("玩法".equals(sendText)){
                SystemData systemData = new SystemData();
                systemData.setState(2);
                systemData.setSysPortrait(json.getString("sysPortrait"));
                systemData.setSysNickName(json.getString("sysNickName"));
                systemData.setSendText("有手就行");
                systemData.setSendDate(json.getString("sendDate"));
                String strJson = objectMapper.writeValueAsString(systemData);
                for(Integer key : sessionMap.keySet()){
                    if(key==recipient){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
            if("开发".equals(sendText)){
                SystemData systemData = new SystemData();
                systemData.setState(2);
                systemData.setSysPortrait(json.getString("sysPortrait"));
                systemData.setSysNickName(json.getString("sysNickName"));
                systemData.setSendText("老板一个人在死磕");
                systemData.setSendDate(json.getString("sendDate"));
                String strJson = objectMapper.writeValueAsString(systemData);
                for(Integer key : sessionMap.keySet()){
                    if(key==recipient){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
            if("新手礼包".equals(sendText)){
                SystemData systemData = new SystemData();
                systemData.setState(2);
                systemData.setSysPortrait(json.getString("sysPortrait"));
                systemData.setSysNickName(json.getString("sysNickName"));
                systemData.setSendText("钱都不充还想要礼包");
                systemData.setSendDate(json.getString("sendDate"));
                String strJson = objectMapper.writeValueAsString(systemData);
                for(Integer key : sessionMap.keySet()){
                    if(key==recipient){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
            if("你叫什么".equals(sendText)){
                SystemData systemData = new SystemData();
                systemData.setState(2);
                systemData.setSysPortrait(json.getString("sysPortrait"));
                systemData.setSysNickName(json.getString("sysNickName"));
                systemData.setSendText("我叫小a,记住咯");
                systemData.setSendDate(json.getString("sendDate"));
                String strJson = objectMapper.writeValueAsString(systemData);
                for(Integer key : sessionMap.keySet()){
                    if(key==recipient){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
            if("你好".equals(sendText)){
                SystemData systemData = new SystemData();
                systemData.setState(2);
                systemData.setSysPortrait(json.getString("sysPortrait"));
                systemData.setSysNickName(json.getString("sysNickName"));
                systemData.setSendText("你好,我的主人");
                systemData.setSendDate(json.getString("sendDate"));
                String strJson = objectMapper.writeValueAsString(systemData);
                for(Integer key : sessionMap.keySet()){
                    if(key==recipient){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
            if("去死吧".equals(sendText)){
                SystemData systemData = new SystemData();
                systemData.setState(2);
                systemData.setSysPortrait(json.getString("sysPortrait"));
                systemData.setSysNickName(json.getString("sysNickName"));
                systemData.setSendText("骂人是不好的");
                systemData.setSendDate(json.getString("sendDate"));
                String strJson = objectMapper.writeValueAsString(systemData);
                for(Integer key : sessionMap.keySet()){
                    if(key==recipient){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
            if("我叫什么".equals(sendText)){
                SystemData systemData = new SystemData();
                systemData.setState(2);
                systemData.setSysPortrait(json.getString("sysPortrait"));
                systemData.setSysNickName(json.getString("sysNickName"));
                systemData.setSendText(loginUserName);
                systemData.setSendDate(json.getString("sendDate"));
                String strJson = objectMapper.writeValueAsString(systemData);
                for(Integer key : sessionMap.keySet()){
                    if(key==recipient){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
        }

    }
    public void userSendUser(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer sendUserId = json.getInt("sendUserId");
        Integer recipientId = json.getInt("recipientId");
        SysUserPo sysUserPo = this.homeDao.selectFriend(recipientId);
        SystemData systemData = new SystemData();
        systemData.setState(4);
        systemData.setSendText(json.getString("sendText"));
        systemData.setUserPortrait(json.getString("myPortrait"));
        systemData.setUserNickName(json.getString("myNickName"));
        systemData.setSysNickName(sysUserPo.getNickName());
        systemData.setSysPortrait(sysUserPo.getUserPortrait());
        systemData.setRecipient(recipientId);
        systemData.setSenduserId(sendUserId);
        systemData.setSendDate(json.getString("sendDate"));
        String strJson = objectMapper.writeValueAsString(systemData);
        int[] friend = {sendUserId,recipientId};
        Integer friendId = this.homeDao.selectInformation(sendUserId,recipientId);
        SysChatPo sysChatPo = new SysChatPo();
        sysChatPo.setSendUserId(sendUserId);
        sysChatPo.setFriendId(friendId);
        sysChatPo.setSendText(json.getString("sendText"));
        boolean isOk = this.homeDao.insertChat(sysChatPo);
        if(isOk){
            for(Integer key : sessionMap.keySet()){
                for (int friends:friend) {
                    if(key==friends){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
        }else {
            System.out.println("数据异常出现错误,新增信息的时候出现错误");
        }
    }
    public void userSendWard(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        SystemData systemData = new SystemData();
        systemData.setState(5);
        systemData.setSenduserId(jsonObject.getInt("sendUserId"));
        systemData.setSendDate(jsonObject.getString("sendDate"));
        systemData.setSendText(jsonObject.getString("sendText"));
        systemData.setUserNickName(jsonObject.getString("myNickName"));
        systemData.setUserPortrait(jsonObject.getString("myPortrait"));
        String strJson = objectMapper.writeValueAsString(systemData);
        for(Integer key : sessionMap.keySet()){
            HomeWebSocket userSession = sessionMap.get(key);
            userSession.session.getBasicRemote().sendText(strJson);
        }
    }
    public void roomRecruit(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        SystemRoomData systemRoomData = new SystemRoomData();
        Integer roomId = jsonObject.getInt("roomId");
        SysRoomPo sysRoomPo = this.homeDao.selectRoomId(roomId);
        List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeDao.selectRoomMember(roomId);
        systemRoomData.setState(jsonObject.getInt("state"));
        systemRoomData.setRoomId(jsonObject.getInt("roomId"));
        systemRoomData.setSendDate(jsonObject.getString("sendDate"));
        systemRoomData.setMyNickName(jsonObject.getString("myNickName"));
        systemRoomData.setMyPortrait(jsonObject.getString("myPortrait"));
        systemRoomData.setSendUserId(jsonObject.getInt("sendUserId"));
        systemRoomData.setRoomText("火力全开"+sysRoomPo.getPeopleQuantity()+"缺"+(sysRoomPo.getPeopleQuantity()-sysRoomMemberPoListy.size()));
        String strJson = objectMapper.writeValueAsString(systemRoomData);
        for(Integer key : sessionMap.keySet()){
            HomeWebSocket userSession = sessionMap.get(key);
            userSession.session.getBasicRemote().sendText(strJson);
        }
        roomHint(msg);
    }
    public void roomHint(String msg) throws IOException {
        SystemRoomData systemRoomData = new SystemRoomData();
        List<Integer> roomMember = new ArrayList<>();
        JSONObject jsonObject = JSONObject.fromObject(msg);
        Integer roomId = jsonObject.getInt("roomId");
        List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeDao.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoListy){
            roomMember.add(sysRoomMemberPo.getUserId());
        }
        systemRoomData.setState(7);
        String strJson = objectMapper.writeValueAsString(systemRoomData);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMember) {
                if(key==friends){
                    HomeWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void closeRoom(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        Integer roomId = jsonObject.getInt("roomId");
        Integer outUserId = jsonObject.getInt("outUserId");
        SysRoomPo sysRoomPo = this.homeDao.selectRoomId(roomId);
        OutRoomUser outRoomUser = new OutRoomUser();
        List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeDao.selectRoomMember(roomId);

        List<Integer> roomMember = new ArrayList<>();
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoListy){
            roomMember.add(sysRoomMemberPo.getUserId());
        }
        if(roomMember.size()>0){
            outRoomUser.setRoomMasterId(sysRoomPo.getRoomMasterId());
        }
        outRoomUser.setOutUserId(outUserId);
        outRoomUser.setRoomId(roomId);
        outRoomUser.setState(8);
        outRoomUser.setOutUserNickName(jsonObject.getString("outUserNickName"));
        outRoomUser.setOutUserPortrait(jsonObject.getString("outUserPortrait"));
        String strJson = objectMapper.writeValueAsString(outRoomUser);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMember) {
                if(key==friends){
                    HomeWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinRoom(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        JoinRoomUser joinRoomUser = new JoinRoomUser();
        joinRoomUser.setRoomId(jsonObject.getInt("roomId"));
        joinRoomUser.setJoinUserId(jsonObject.getInt("joinUserId"));
        joinRoomUser.setState(9);
        joinRoomUser.setJoinMemberNickName(jsonObject.getString("joinMemberNickName"));
        joinRoomUser.setJoinMemberPortrait(jsonObject.getString("joinMemberPortrait"));
        List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeDao.selectRoomMember(jsonObject.getInt("roomId"));
        joinRoomUser.setRoomMemberCount(sysRoomMemberPoListy.size());
        List<Integer> roomMember = new ArrayList<>();
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoListy){
            roomMember.add(sysRoomMemberPo.getUserId());
        }
        String strJson = objectMapper.writeValueAsString(joinRoomUser);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMember) {
                if(key==friends){
                    HomeWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void whetherPrepare(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        List<Integer> roomMember = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeDao.selectRoomMember(jsonObject.getInt("roomId"));
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoListy){
            roomMember.add(sysRoomMemberPo.getUserId());
        }
        WhetherPrepareVo whetherPrepareVo = new WhetherPrepareVo();
        whetherPrepareVo.setOk(jsonObject.getBoolean("isOk"));
        whetherPrepareVo.setState(jsonObject.getInt("state"));
        whetherPrepareVo.setRoomId(jsonObject.getInt("roomId"));
        whetherPrepareVo.setUserId(jsonObject.getInt("userId"));
        boolean isOk = this.homeDao.updateWhetherPrepare(jsonObject.getInt("roomId"),jsonObject.getInt("userId"),jsonObject.getBoolean("isOk"));
        if(isOk){
            String strJson = objectMapper.writeValueAsString(whetherPrepareVo);
            for(Integer key : sessionMap.keySet()){
                for (int friends:roomMember) {
                    if(key==friends){
                        HomeWebSocket userSession = sessionMap.get(key);
                        userSession.session.getBasicRemote().sendText(strJson);
                    }
                }
            }
        }
    }
    public void roomChat(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        List<Integer> roomMember = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeDao.selectRoomMember(jsonObject.getInt("roomId"));
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoListy){
            roomMember.add(sysRoomMemberPo.getUserId());
        }
        roomCahtVo roomCahtVo = new roomCahtVo();
        roomCahtVo.setRoomId(jsonObject.getInt("roomId"));
        roomCahtVo.setSendText(jsonObject.getString("sendText"));
        roomCahtVo.setState(11);
        roomCahtVo.setSendUserId(jsonObject.getInt("sendUserId"));
        roomCahtVo.setSendUserNickName(jsonObject.getString("sendUserNickName"));
        String strJson = objectMapper.writeValueAsString(roomCahtVo);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMember) {
                if(key==friends){
                    HomeWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void inviteHe(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        Integer friendId = jsonObject.getInt("friendId");
        InviteHeVo inviteHeVo = new InviteHeVo();
        inviteHeVo.setFriendId(jsonObject.getInt("friendId"));
        inviteHeVo.setRoomId(jsonObject.getInt("roomId"));
        inviteHeVo.setState(jsonObject.getInt("state"));
        inviteHeVo.setSendText(jsonObject.getString("sendText"));
        inviteHeVo.setInviteHePortrait(jsonObject.getString("inviteHePortrait"));
        String strJson = objectMapper.writeValueAsString(inviteHeVo);
        for(Integer key : sessionMap.keySet()){
            if(key==friendId){
                HomeWebSocket userSession = sessionMap.get(key);
                userSession.session.getBasicRemote().sendText(strJson);
            }
        }
    }
    public void startGame(String msg) throws IOException {
        JSONObject jsonObject = JSONObject.fromObject(msg);
        List<Integer> roomMember = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoListy = this.homeDao.selectRoomMember(jsonObject.getInt("roomId"));
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoListy){
            roomMember.add(sysRoomMemberPo.getUserId());
        }
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMember) {
                if(key==friends){
                    HomeWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(msg);
                }
            }
        }
    }
}
