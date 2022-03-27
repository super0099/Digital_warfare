package com.yxm.webSocketFunction;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yxm.common.GetHttpSessionConfigurator;
import com.yxm.dao.IHomeDao;
import com.yxm.dao.impl.HomeDaoImpl;
import com.yxm.po.SysRoomMemberPo;
import com.yxm.po.SysUserPo;
import com.yxm.service.IGameService;
import com.yxm.service.impl.GameServiceImpl;
import com.yxm.util.ProjectParameter;
import com.yxm.vo.*;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value ="/startGame",configurator= GetHttpSessionConfigurator.class)
public class GameWebSocket {
    private final IGameService gameService = new GameServiceImpl();
    private final IHomeDao homeDao = new HomeDaoImpl();
    private static Map<Integer,GameWebSocket> sessionMap = new ConcurrentHashMap<>();
    private Session session;
    private HttpSession httpSession;
    private Integer loginUserId;
    private String loginUserName;
    private final ObjectMapper objectMapper = new ObjectMapper();
    @OnOpen
    public void onOpen(Session session, EndpointConfig config){

        HttpSession httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        SysUserPo loginUser = (SysUserPo) httpSession.getAttribute(ProjectParameter.SESSION_USER);
        loginUserName=loginUser.getNickName();
        loginUserId = loginUser.getId();
        this.httpSession = httpSession;
        this.session=session;
        sessionMap.put(loginUserId,this);
    }
    @OnMessage
    public void onMessage(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer state = json.getInt("state");
        //全局计时器
        if(state==1){
            systemGameMessage(msg);
        }
        //玩家和玩家相加得到的数<5
        if(state==2){
            joinAndJoin(msg);
        }
        //玩家和玩家相加得数等于6
        if(state==3){
            joinAndJoinSix(msg);
        }
        //玩家和玩家相加得数等于5
        if(state==4){
            joinAndJoinFive(msg);
        }
        //武器选择框
        if(state==5){
            selectWeapon(msg);
        }
        //玩家和玩家相加得数等于7
        if(state==6){
            joinAndJoinSeven(msg);
        }
        //玩家和玩家相加得数等于8
        if(state==7){
            joinAndJoinEight(msg);
        }
        //玩家和玩家相加得数等于9
        if(state==8){
            joinAndJoinNine(msg);
        }
        //玩家和玩家相加得数等于0
        if(state==9){
            joinAndJoinZero(msg);
        }
        //游戏内玩家聊天
        if(state==10){
            gameChat(msg);
        }
        //玩家使用复合弓,手枪,突击步枪进行攻击
        if(state==11){
            attackEleven(msg);
        }
        //玩家使用手榴弹进行攻击
        if(state==12){
            grenade(msg);
        }
        //玩家使用医疗瓶
        if(state==13){

        }
        //游戏结束
        if(state==15){
            closeGame(msg);
        }
    }
    @OnError
    public void onError(Throwable error){
        System.out.println("发生错误");
    }
    @OnClose
    public void onClose(){
        sessionMap.remove(loginUserId);  //从set中删除
        System.out.println(sessionMap.size());
    }
    public void systemGameMessage(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SystemGameData systemGameData = new SystemGameData();
        systemGameData.setState(1);
        systemGameData.setSecond(json.getInt("second"));
        String strJson = objectMapper.writeValueAsString(systemGameData);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinAndJoin(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("heUserId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = "玩家"+myPo.getNickName()+"和玩家"+hePo.getNickName()+"相加获得数字"+json.getInt("joinCode");
        joinAndJoin.setJoinCode(json.getInt("joinCode"));
        joinAndJoin.setState(2);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        joinAndJoin.setWeaponImg(json.getString("weaponImg"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinAndJoinSix(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("heUserId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = "玩家"+myPo.getNickName()+"和玩家"+hePo.getNickName()+"相加获得数字6,格外获取复合弓";
        joinAndJoin.setJoinCode(json.getInt("joinCode"));
        joinAndJoin.setState(3);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        joinAndJoin.setWeaponImg(json.getString("weaponImg"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinAndJoinFive(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("heUserId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = "玩家"+myPo.getNickName()+"和玩家"+hePo.getNickName()+"相加获得数字5";
        joinAndJoin.setJoinCode(json.getInt("joinCode"));
        joinAndJoin.setState(4);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void selectWeapon(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = null;
        if(json.getInt("weaponTypeCode")==1){
            message = "玩家"+myPo.getNickName()+"获得五颗子弹";
        }
        if(json.getInt("weaponTypeCode")==2){
            message = "玩家"+myPo.getNickName()+"获得盾牌";
        }
        joinAndJoin.setState(5);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        joinAndJoin.setWeaponImg(json.getString("weaponImg"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinAndJoinSeven(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("heUserId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = "玩家"+myPo.getNickName()+"和玩家"+hePo.getNickName()+"相加获得数字7,格外获取手枪";
        joinAndJoin.setJoinCode(json.getInt("joinCode"));
        joinAndJoin.setState(6);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        joinAndJoin.setWeaponImg(json.getString("weaponImg"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinAndJoinEight(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("heUserId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = "玩家"+myPo.getNickName()+"和玩家"+hePo.getNickName()+"相加获得数字8,格外获取突击步枪";
        joinAndJoin.setJoinCode(json.getInt("joinCode"));
        joinAndJoin.setState(7);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        joinAndJoin.setWeaponImg(json.getString("weaponImg"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinAndJoinNine(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("heUserId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = "玩家"+myPo.getNickName()+"和玩家"+hePo.getNickName()+"相加获得数字9,格外获取高爆手雷";
        joinAndJoin.setJoinCode(json.getInt("joinCode"));
        joinAndJoin.setState(8);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        joinAndJoin.setWeaponImg(json.getString("weaponImg"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void joinAndJoinZero(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("heUserId"));
        JoinAndJoin joinAndJoin = new JoinAndJoin();
        String message = "玩家"+myPo.getNickName()+"和玩家"+hePo.getNickName()+"相加获得数字0,格外获取医疗瓶";
        joinAndJoin.setJoinCode(json.getInt("joinCode"));
        joinAndJoin.setState(9);
        joinAndJoin.setMessage(message);
        joinAndJoin.setUserId(json.getInt("userId"));
        joinAndJoin.setIsLeft(json.getInt("isLeft"));
        joinAndJoin.setWeaponImg(json.getString("weaponImg"));
        String strJson = objectMapper.writeValueAsString(joinAndJoin);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void gameChat(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo myPo = this.homeDao.selectFriend(json.getInt("userId"));
        GameChat gameChat = new GameChat();
        gameChat.setSendText(json.getString("sendText"));
        gameChat.setUserName(myPo.getNickName());
        gameChat.setState(10);
        String strJson = objectMapper.writeValueAsString(gameChat);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void attackEleven(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        SysUserPo hePo = this.homeDao.selectFriend(json.getInt("attackedUserId"));
        Integer myWeapon = json.getInt("myWeapon");
        Integer consumables = json.getInt("consumables");
        boolean immune = json.getBoolean("immune");
        String sendData = null;
        Integer harm = 0;
        if(myWeapon==6){
            harm = consumables;
            if(immune){
                sendData = "玩家["+loginUserName+"]使用复合弓攻击了玩家["+hePo.getNickName()+"],但是被该玩家格挡了";
            }else {
                sendData = "玩家["+loginUserName+"]使用复合弓攻击了玩家["+hePo.getNickName()+"]造成了"+harm+"点伤害";
            }
        }
        if(myWeapon==7){
            harm = consumables*2;
            if(immune){
                sendData = "玩家["+loginUserName+"]使用手枪攻击了玩家["+hePo.getNickName()+"],但是被该玩家格挡了";
            }else {
                sendData = "玩家["+loginUserName+"]使用手枪攻击了玩家["+hePo.getNickName()+"]造成了"+harm+"点伤害";
            }
        }
        if(myWeapon==8){
            harm = consumables*3;
            if(immune){
                sendData = "玩家["+loginUserName+"]使用突击步枪攻击了玩家["+hePo.getNickName()+"],但是被该玩家格挡了";
            }else {
                sendData = "玩家["+loginUserName+"]使用突击步枪攻击了玩家["+hePo.getNickName()+"]造成了"+harm+"点伤害";
            }
        }
        AttackEleven attackElevens = new AttackEleven();
        attackElevens.setAttackUserId(json.getInt("attackUserId"));
        attackElevens.setAttackedUserId(json.getInt("attackedUserId"));
        attackElevens.setState(json.getInt("state"));
        attackElevens.setMyWeapon(json.getInt("myWeapon"));
        attackElevens.setConsumables(harm);
        attackElevens.setImmune(json.getBoolean("immune"));
        attackElevens.setSendText(sendData);
        String strJson = objectMapper.writeValueAsString(attackElevens);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void grenade(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        AttackGrenade attackGrenade = new AttackGrenade();
        attackGrenade.setAttackId(json.getInt("attackUserId"));
        attackGrenade.setState(12);
        attackGrenade.setOpposite(json.getJSONArray("opposite"));
        attackGrenade.setSendData("玩家["+loginUserName+"]使用手榴弹对敌方玩家造成群体伤害");
        attackGrenade.setMyWeapon(json.getInt("myWeapon"));
        String strJson = objectMapper.writeValueAsString(attackGrenade);
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(strJson);
                }
            }
        }
    }
    public void closeGame(String msg) throws IOException {
        JSONObject json = JSONObject.fromObject(msg);
        Integer roomId = json.getInt("roomId");
        List<Integer> roomMemberId = new ArrayList<>();
        List<SysRoomMemberPo> sysRoomMemberPoList = this.gameService.selectRoomMember(roomId);
        for(SysRoomMemberPo sysRoomMemberPo:sysRoomMemberPoList){
            roomMemberId.add(sysRoomMemberPo.getUserId());
        }
        for(Integer key : sessionMap.keySet()){
            for (int friends:roomMemberId) {
                if(key==friends){
                    GameWebSocket userSession = sessionMap.get(key);
                    userSession.session.getBasicRemote().sendText(msg);
                }
            }
        }
    }

}
