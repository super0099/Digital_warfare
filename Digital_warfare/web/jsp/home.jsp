<%@ page import="com.yxm.po.SysUserPo" %>
<%@ page import="com.yxm.util.ProjectParameter" %><%--
  Created by IntelliJ IDEA.
  User: super007
  Date: 2021/5/31
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!--需要引入jstl-1.2.jar包-->
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/><!--需要引入jstl-1.2.jar包-->
<%SysUserPo sysUserPo = (SysUserPo) request.getAttribute("sysUserPo");%>
<html>
<head>
    <title>数字战争主页</title>
    <link rel="icon" href="${ctx}/static/img/网页图标.jpg">
    <link rel="stylesheet" href="${ctx}/static/css/home.css">
</head>
<body>
<%--头部--%>
<div class="homeTop">
    <%--用户信息区--%>
    <div class="userData">
        <div class="userDataFl clearfix">
            <%--用户头像--%>
            <img src="${ctx}/FileIo?method=getPortraitImage&imgName=<%=sysUserPo.getUserPortrait()%>" id="userImg" class="fl">
            <%--用户昵称和Id--%>
            <div class="userName fl">
                <span id="nickname" style="font-size: 20px"><%=sysUserPo.getNickName()%></span>
                <p id="userName"><a style="color: #FFB800">ID: </a><%=sysUserPo.getUserName()%></p>
            </div>
        </div>
        <div></div>
    </div>
</div>
<%--身体--%>
<div class="homeBody">
    <%--左功能--%>
    <div class="friend" id="friend" style="display: none;">
        <i class="pack" onclick="pack()"></i>
        <div class="friendTop clearfix">
            <ul>
                <li class="headline" onclick="changeStyle(this)"><input type="text" value="1" hidden>系统</li>
                <li class="headline" onclick="changeStyle(this)"><input type="text" value="2" hidden>私聊</li>
                <li class="headline" onclick="changeStyle(this)"><input type="text" value="3" hidden>综合</li>
            </ul>
        </div>
        <div class="friendBody clearfix">
            <%--主页好友框--%>
            <div class="BodyFl fl" id="BodyFl"></div>
            <div class="BodyFr fl">
                <div class="ChatDiv" id="ChatDiv">

                </div>
                <div class="SendData">
                    <input type="text" value="0" id="identifying" hidden>
                    <div class="inputData">
                        <i></i>
                        <form action="">
                            <input type="text" placeholder="点击输入聊天内容" id="sendData" autocomplete="off">
                            <input type="reset" id="reset" hidden>
                        </form>
                    </div>
                    <button type="button" onclick="sendData()">发&nbsp;&nbsp;送</button>
                </div>
            </div>
        </div>
    </div>
    <%--右功能--%>
    <div class="game">
        <p><i class="fl gameIl" onclick="resetRoom()">重置房间</i><i class="fr gameIr">好友列表</i></p>
        <div class="Ranking">
            <span>排位</span>
        </div>
        <div class="establish" onclick="openRoom()">
            <span>创建房间</span>
        </div>
        <div class="roomList">
            <span>房间列表</span>
        </div>
    </div>
</div>
<%--好友邀请信息显示区--%>
<div class="friendInvite" id="friendInvite">

</div>
<%--世界招募信息显示区--%>
<div class="RecruitmentInformation" id="RecruitmentInformation">

</div>
<%--在线人数显示区--%>
<div class="loginCount">
    当前在线人数:
    <input type="text" id="loginCount" readonly>
</div>
<%--系统滚动提示区--%>
<div class="homeButton">
    <%--系统公告区--%>
    <div class="systemNotice" onclick="openS()">
        <i></i>
        <div id="scoll">

        </div>
    </div>
</div>
<%--房间弹出层--%>
<div class="roomPopups" id="roomPopups" style="display: none;">
    <%--roomTop--%>
    <div class="roomTop clearfix">
        <ul>
            <li class="fl" onclick="closeRoom()">
                <i></i>
                <span>主页</span>
            </li>
            <li class="fl">
                <p id="roomCode"></p>
                <input type="text" id="roomId" hidden>
                <input type="text" id="roomMasterId" hidden>
            </li>
        </ul>
    </div>
    <%--roomBody--%>
    <div class="roomBody">
        <%--roomBodyFl--%>
        <div class="roomBodyFl fl">
            <div class="location clearfix" id="location">
                <div class="roomMember">
                </div>
                <div class="roomMember">
                </div>
                <div class="roomMember">
                </div>
                <div class="Vs fl">
                    vs
                </div>
                <div class="roomMember"></div>
                <div class="roomMember"></div>
                <div class="roomMember"></div>
            </div>
            <div class="functionArea">
                <%--房间聊天框--%>
                <div class="chatArea clearfix" id="chatArea"></div>
                <div class="roomChatBut" id="roomChatBut">
                    <div class="roomChatData fl">
                        <i></i>
                        <input type="text" placeholder="想说什么?" id="roomChat" autocomplete="off">
                        <a onclick="roomChat()">发送</a>
                    </div>
                </div>
            </div>
        </div>
        <%--roomBodyFr--%>
        <div class="roomBodyFr fl">
            <div class="roomFriendTile">
                <ul>
                    <li onclick="roomSelectFriendLi(this)" class="roomFriendTileLi" style="border-bottom: 1px solid #FFFFFF;">好友</li>
                    <li class="roomFriendTileLi">战队</li>
                </ul>
            </div>
            <%--好友列表--%>
            <div class="roomFriend" id="roomFriend">

            </div>
            <div class="roomFriendBtn">
                <i></i>
                <button type="button" onclick="recruit()">房间招募</button>
                <div class="fr" onclick="roomSelectFriend()"></div>
            </div>
        </div>
    </div>
</div>
<%--排位弹出层--%>
<div>

</div>
<%--房间列表弹出层--%>
<div>

</div>
<script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
<script>
    var loginUser;//当前在线用户组
    var loginUserId = <%=sysUserPo.getId()%>;
    var loginUserNickName = '<%=sysUserPo.getNickName()%>';
    var loginUserPortrait = '<%=sysUserPo.getUserPortrait()%>';
    var roomMemberCount=0;//当前房间人数
    var ws = null;
    if(WebSocket){
        ws = new WebSocket("wss://192.168.191.1:8443/Digital_warfare/HomeChat");
    }else{
        alert("浏览器不支持Websocket");
    }

    ws.onopen=function(){
        <%--var message = {--%>
        <%--    state:true,//建立连接用true,发送信息用假--%>
        <%--    text: "",--%>
        <%--    userId:'<%=sysUserPo.getId()%>',--%>
        <%--};--%>
        <%--ws.send(JSON.stringify(message));--%>
    }
    ws.onmessage=function(event){
        var ChatDiv = document.getElementById("ChatDiv");
        var obj = JSON.parse(event.data);
        if(obj.state==1){
            var loginCount = document.getElementById("loginCount");
            loginCount.setAttribute("value",obj.count);
            loginUser=obj.loginUser;
        }
        if(obj.state==2){
            var date = Dt(obj.sendDate);
            if(obj.recipient==loginUserId){
                ChatDiv.innerHTML+='<div class="my clearfix"><p><a>'+date+'</a>&nbsp;&nbsp;'+obj.userNickName+'</p><div class="myImg fr"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.userPortrait+'"></div><div class="myContent fr"><span>'+obj.sendText+'</span></div></div>';
                ChatDiv.scrollTop = ChatDiv.scrollHeight;
            }else {
                var reg = new RegExp('\n','g');
                var text = obj.sendText.replace(reg,'<br/>');
                ChatDiv.innerHTML+='<div class="you clearfix"><p>'+obj.sysNickName+'&nbsp;&nbsp;<a>'+date+'</a></p><div class="youImg fl"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.sysPortrait+'"></div><div class="youContent fl"><span>'+text+'</span></div></div>';
                ChatDiv.scrollTop = ChatDiv.scrollHeight;
            }
        }
        if(obj.state==4){
            var date = Dt(obj.sendDate);
            var scolls = document.getElementById("scoll");
            var scollsChild = scolls.childNodes;
            var inputName = $('input[name=therefore]:checked');
            if(obj.senduserId!=loginUserId){
                for(var i=0;i<scollsChild.length;i++){
                    if(scollsChild.length>0){
                        scolls.removeChild(scollsChild[i]);
                    }
                }
                scolls.innerHTML+='<marquee behavior="scoll" direction="left"><span><b style="color: blue;">[好友私信]</b>'+obj.userNickName+':'+obj.sendText+'</span></marquee>';
            }

            if(inputName[0]==undefined){
                return;
            }
            var recipientId = inputName[0].parentElement.lastElementChild.value;
            var friendData = document.getElementsByClassName("friendData");

            for(var i = 0;i<friendData.length;i++){
                if(friendData[i].lastElementChild.value==obj.senduserId){
                    friendData[i].style.border="3px solid #FF00FF";
                }
            }
            if(obj.senduserId==loginUserId){
                ChatDiv.innerHTML+='<div class="my clearfix"><p><a>'+date+'</a>&nbsp;&nbsp;'+obj.userNickName+'</p><div class="myImg fr"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.userPortrait+'"></div><div class="myContent fr"><span>'+obj.sendText+'</span></div></div>';
                ChatDiv.scrollTop = ChatDiv.scrollHeight;
            }
            if(obj.senduserId==recipientId){
                ChatDiv.innerHTML+='<div class="you clearfix"><p>'+obj.userNickName+'&nbsp;&nbsp;<a>'+date+'</a></p><div class="youImg fl"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.userPortrait+'"></div><div class="youContent fl"><span>'+obj.sendText+'</span></div></div>';
                ChatDiv.scrollTop = ChatDiv.scrollHeight;
            }
        }
        //滚动条信息
        if(obj.state==5){
            var date = Dt(obj.sendDate);
            var scolls = document.getElementById("scoll");
            var scollsChild = scolls.childNodes;
            var inputName = $('input[name=therefore]:checked');
            for(var i=0;i<scollsChild.length;i++){
                if(scollsChild.length>0){
                    scolls.removeChild(scollsChild[i]);
                }
            }
            scolls.innerHTML+='<marquee behavior="scoll" direction="left"><span><b style="color: yellow;">[世界信息]</b>'+obj.userNickName+':'+obj.sendText+'</span></marquee>';
            if(inputName[0]==undefined){
                return;
            }
            var recipientId = inputName[0].parentElement.lastElementChild.value;
            if(recipientId==-1){
                if(obj.senduserId==loginUserId){
                    ChatDiv.innerHTML+='<div class="my clearfix"><p><a>'+date+'</a>&nbsp;&nbsp;'+obj.userNickName+'</p><div class="myImg fr"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.userPortrait+'"></div><div class="myContent fr"><span>'+obj.sendText+'</span></div></div>';
                    ChatDiv.scrollTop = ChatDiv.scrollHeight;
                }else {
                    ChatDiv.innerHTML+='<div class="you clearfix"><p>'+obj.userNickName+'&nbsp;&nbsp;<a>'+date+'</a></p><div class="youImg fl"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.userPortrait+'"></div><div class="youContent fl"><span>'+obj.sendText+'</span></div></div>';
                    ChatDiv.scrollTop = ChatDiv.scrollHeight;
                }
            }
        }
        //招募信息
        if(obj.state==6){
            var date = Dt(obj.sendDate);
            var RecruitmentInformation = document.getElementById("RecruitmentInformation");
            var RecruitChild = RecruitmentInformation.childNodes;
            for(var i =0;i<RecruitChild.length;i++){
                if(RecruitChild.length>0){
                    RecruitmentInformation.removeChild(RecruitChild[i]);
                }
            }
            if(obj.sendUserId!=loginUserId){
                RecruitmentInformation.innerHTML+='<div class="RecruitInformation"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.myPortrait+'" class="fl"><div class="RecruitText fl"><span>'+date+'</span><p>'+obj.roomText+'</p></div><div class="RecruitButton fr"><button type="button" onclick="joinRoom('+obj.roomId+')">加入</button></div></div>';
            }
        }
        //房间系统信息
        if(obj.state==7){
            var chatArea = document.getElementById('chatArea');
            chatArea.innerHTML+='<div class="roomUserI fl"><b>[ 系统 ] : </b><span>已发送招募信息</span></div>';
            chatArea.scrollTop = chatArea.scrollHeight;
        }
        //用户退出房间
        if(obj.state==8){
            var roomMember = document.getElementsByClassName("roomMember");
            var roomChatBut = document.getElementById("roomChatBut");
            var roomMasterId = document.getElementById("roomMasterId");
            //旧房主退出
            if(roomMasterId.value==obj.outUserId){
                //循环所以用户框
                for(var i = 0;i<roomMember.length;i++){
                    //获取到用户框孩子标签不等于0;
                    if(roomMember[i].children.length!=0){
                        //将多余的text子元素清除
                        var roomMemberChild = roomMember[i].childNodes;
                        for(var j = 0;j<roomMemberChild.length;j++){
                            if(roomMemberChild[j].nodeType === 3 && roomMemberChild[j].nodeName === '#text'){
                                roomMemberChild[j].parentNode.removeChild(roomMemberChild[j]);
                            }
                        }
                        //获取该用户框的id
                        //一  2  3  1  2
                        var userIds = roomMember[i].firstElementChild.value;
                        //如果用户框id等于房主Id,就改变这个用户框
                        if(obj.roomMasterId==userIds){
                            var roomMemberChild = roomMember[i].childNodes;
                            var id = roomMemberChild[0].value;
                            var img = roomMemberChild[2].getAttribute("src");
                            var name = roomMemberChild[3].innerText;
                            for (var j = roomMemberChild.length - 1; j >= 0; j--) {
                                roomMember[i].removeChild(roomMemberChild[j]);
                                roomMember[i].style.border="1px solid red";
                            }
                            roomMember[i].innerHTML+='<input type="text" hidden value="'+id+'"><i>房主</i><input type="checkbox" name="roomMemberInput" checked hidden><img src="'+img+'"><p>'+name+'</p>';
                            roomMember[i].style.border="1px solid green";
                            if(userIds==loginUserId){
                                roomChatBut.innerHTML+='<button type="button" class="fr" onclick="startGame()">开始游戏</button>';
                            }
                        }
                        //如果等于就执行清空
                        if(userIds==obj.outUserId){
                            var roomMemberChide = roomMember[i].childNodes;
                            for (var j = roomMemberChide.length - 1; j >= 0; j--) {
                                roomMember[i].removeChild(roomMemberChide[j]);
                                roomMember[i].style.border="1px solid red";
                            }
                        }
                    }
                }
            }else {
                //循环所以用户框
                for(var i = 0;i<roomMember.length;i++){
                    //获取到用户框孩子标签不等于0;
                    if(roomMember[i].children.length!=0){
                        var userIds = roomMember[i].firstElementChild.value;
                        //如果等于就执行清空
                        if(userIds==obj.outUserId){
                            var roomMemberChide = roomMember[i].childNodes;
                            for (var j = roomMemberChide.length - 1; j >= 0; j--) {
                                roomMember[i].removeChild(roomMemberChide[j]);
                                roomMember[i].style.border="1px solid red";
                            }
                        }
                    }
                }
            }
            roomMasterId.setAttribute("value",obj.roomMasterId);
            var chatArea = document.getElementById('chatArea');
            chatArea.innerHTML+='<div class="roomUserI fl"><b>[ 系统 ] : </b><span>'+obj.outUserNickName+'退出房间</span></div>';
            chatArea.scrollTop = chatArea.scrollHeight;
        }
        //用户经过招募加入房间
        if(obj.state==9){
            var roomMember = document.getElementsByClassName("roomMember");
            if(obj.joinUserId!=loginUserId){
                for(var i = 0;i<roomMember.length;i++){
                    if(roomMember[i].children.length==0){
                        roomMember[i].innerHTML+='<input type="text" hidden value="'+obj.joinUserId+'"><input type="checkbox" name="roomMemberInput" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.joinMemberPortrait+'"><p>'+obj.joinMemberNickName+'</p>';
                        roomMember[i].style.border="1px solid red"
                        break;
                    }
                }
            }
            var chatArea = document.getElementById('chatArea');
            chatArea.innerHTML+='<div class="roomUserI fl"><b>[ 系统 ] : </b><span>'+obj.joinMemberNickName+'加入房间</span></div>';
            chatArea.scrollTop = chatArea.scrollHeight;
        }
        //用户准备和取消
        if(obj.state==10){
            //获取到需要更改的用户框
            var roomMember = document.getElementsByClassName("roomMember");
            for(var i = 0;i<roomMember.length;i++){
                if(roomMember[i].children.length!=0){
                    var roomMemberChild = roomMember[i].childNodes;
                    for(var j = 0;j<roomMemberChild.length;j++){
                        if(roomMemberChild[j].nodeType === 3 && roomMemberChild[j].nodeName === '#text'){
                            roomMemberChild[j].parentNode.removeChild(roomMemberChild[j]);
                        }
                    }
                    var id = roomMemberChild[0].value;
                    if(id==obj.userId){
                        if(obj.ok){
                            roomMemberChild[1].checked="checked";
                            roomMember[i].style.border="1px solid green";
                        }else{
                            roomMemberChild[1].checked="";
                            roomMember[i].style.border="1px solid red";
                        }
                    }
                }
            }
        }
        //房间发送信息
        if(obj.state==11){
            var chatArea = document.getElementById("chatArea");
            chatArea.innerHTML+='<div class="roomUserI fl"><a>[ '+obj.sendUserNickName+' ] : </a><span>'+obj.sendText+'</span>';
            chatArea.scrollTop = chatArea.scrollHeight;
        }
        //房间好友邀请
        if(obj.state==12){
            var friendInvite = document.getElementById("friendInvite");
            var friendInviteChild = friendInvite.childNodes;
            for(var i =0;i<friendInviteChild.length;i++){
                if(friendInviteChild.length>0){
                    friendInvite.removeChild(friendInviteChild[i]);
                }
            }
            if(obj.friendId==loginUserId){
                friendInvite.innerHTML+='<div class="friendInviteContent clearfix"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+obj.inviteHePortrait+'" class="fl"><div class="friendInviteText fl"><p>'+obj.sendText+'</p></div><button type="button" onclick="joinRoom('+obj.roomId+')">加入</button></div>';
            }
        }
        //开始游戏
        if(obj.state==13){
            var roomId= document.getElementById("roomId").value;
            window.location.replace('${ctx}/game?method=index&roomId='+roomId);
        }
    }

    //获取用户的朋友关系
    function selectFriend(){
        $.post('${ctx}/home?method=selectFriend',{myId:loginUserId},function (jsonMsg){
            for (var i = 0;i<jsonMsg.length;i++){
                if(loginUser.indexOf(jsonMsg[i].id)!=-1){
                    BodyFl.innerHTML+='<div class="friendData clearfix" onclick="openFriend('+jsonMsg[i].id+',this)"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+jsonMsg[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+jsonMsg[i].nickName+'</span><p>在线</p></div><input type="text" value="'+jsonMsg[i].id+'"hidden></div>';
                }
            }
            for (var i = 0;i<jsonMsg.length;i++){
                if(loginUser.indexOf(jsonMsg[i].id)==-1){
                        BodyFl.innerHTML +='<div class="friendData clearfix" onclick="openFriend('+jsonMsg[i].id+',this)"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+jsonMsg[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+jsonMsg[i].nickName+'</span><a>离线</a></div><input type="text" value="'+jsonMsg[i].id+'"hidden></div>';
                }
            }
        })
    }
    //获取好友互发的信息
    function openFriend(o,k){
        var friendData = document.getElementsByClassName("friendData");
        var ChatDiv = document.getElementById("ChatDiv");
        for(var i = 0;i<friendData.length;i++){
            friendData[i].style.border ="none";
        }
        for (var i = ChatDiv.children.length - 1; i >= 0; i--) {
            ChatDiv.removeChild(ChatDiv.children[i]);
        }
        k.style.border="3px solid #eb7350";
        k.firstElementChild.checked="checked";
        $.post("${ctx}/home?method=selectInformation",{
            myUserId:loginUserId,
            myFriendId:o
        },function (data){
            for(var i=0;i<data.length;i++){
                var date = Dt(data[i].sendDate);
                if(data[i].sendUserId==loginUserId){
                    ChatDiv.innerHTML+='<div class="my clearfix"><p><a>'+date+'</a>&nbsp;&nbsp;'+data[i].nickName+'</p><div class="myImg fr"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+data[i].userPortrait+'"></div><div class="myContent fr"><span>'+data[i].sendText+'</span></div></div>';
                    ChatDiv.scrollTop = ChatDiv.scrollHeight;
                }else {
                    ChatDiv.innerHTML+='<div class="you clearfix"><p><a>'+date+'</a>&nbsp;&nbsp;'+data[i].nickName+'</p><div class="youImg fl"><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+data[i].userPortrait+'"></div><div class="youContent fl"><span>'+data[i].sendText+'</span></div></div>';
                    ChatDiv.scrollTop = ChatDiv.scrollHeight;
                }
            }
        });
    }
    //获取系统信息
    function systemData(){
        var img = "System.jpg";
        BodyFl.innerHTML+='<div class="friendData clearfix" onclick="openSystem(this)"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+img+'" class="fl"><div class="friendName fl"><span>系统小a</span><p>在线</p></div><input type="text" value="0"hidden></div>';
    }
    //用户发送信息
    function sendData(){
        var reset = document.getElementById('reset');
        var sendData = document.getElementById("sendData").value;
        var identifying = document.getElementById("identifying");
        var inputName = $('input[name=therefore]:checked');
        if(identifying.value==0){
            layer.msg("你想在那个频道对话?");
            reset.click();
            return;
        }
        if(inputName.length==0){
            layer.msg("你想和谁对话?");
            reset.click();
            return;
        }
        if(sendData==null||sendData==undefined||sendData==""){
            layer.msg("总得说些什么吧")
            return;
        }
        var recipientId = inputName[0].parentElement.lastElementChild.value;
        //发送信息给系统
        if(recipientId==0){
            var message = {
                state:3,
                sendDate:new Date(),
                myNickName:loginUserNickName,
                myPortrait:loginUserPortrait,
                sysNickName:'机器人小a',
                sysPortrait:'System.jpg',
                sendText:sendData,
                recipient:recipientId,
                sendUserId:loginUserId
            };
            ws.send(JSON.stringify(message));
            reset.click();
        }
        //发送信息给其他
        if(recipientId>0){
            var message = {
                state:4,
                sendDate:new Date(),
                myNickName:loginUserNickName,
                myPortrait:loginUserPortrait,
                sendText:sendData,
                recipientId:recipientId,
                sendUserId:loginUserId
            };
            ws.send(JSON.stringify(message));
            reset.click();
        }
        //发送信息给世界
        if(recipientId==-1){
            var message = {
                state:5,
                sendDate:new Date(),
                myNickName:loginUserNickName,
                myPortrait:loginUserPortrait,
                sendText:sendData,
                sendUserId:loginUserId
            };
            ws.send(JSON.stringify(message));
            reset.click();
        }
    }
    //获取综合信息
    function synthesize(){
        var img = "Waord.jpeg";
        BodyFl.innerHTML+='<div class="friendData clearfix" onclick="openWorld(this)"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+img+'" class="fl"><div class="friendName fl"><span>世界</span></div><input type="text" value="-1" hidden></div>';
    }
    //打开房间
    function openRoom(){
        var roomPopups = document.getElementById("roomPopups");
        var roomMasterId =  document.getElementById("roomMasterId");
        var roomMember = document.getElementsByClassName("roomMember");

        var roomChatBut = document.getElementById("roomChatBut");
        var layerIndex = layer.load();
        $.post("${ctx}/home?method=addRoom",{
            userId:loginUserId
        },function (jsonMsg){
            if(jsonMsg.state){
                roomSelectFriend();
                roomId.setAttribute("value",jsonMsg.data.id);
                roomMasterId.setAttribute("value",jsonMsg.data.roomMasterId);
                document.getElementById("roomCode").innerText=jsonMsg.data.roomNumber;
                roomMemberCount++;
                if(loginUserId==jsonMsg.data.roomMasterId){
                    for(var i = 0;i<roomMember.length;i++){
                        if(i==0){
                            roomMember[i].innerHTML+='<input type="text" hidden value="'+loginUserId+'"><i>房主</i><input type="checkbox" name="roomMemberInput" checked hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+loginUserPortrait+'"><p>'+loginUserNickName+'</p>';
                            roomMember[i].style.border="1px solid green";
                            roomChatBut.innerHTML+='<button type="button" class="fr" onclick="startGame()">开始游戏</button>';
                        }
                    }
                }
                setTimeout(function (){
                    roomPopups.style.display="block";
                    layer.close(layerIndex);
                },1500);
            }else {
                layer.msg(jsonMsg.msg);
                layer.close(layerIndex);
            }
        });
    }
    //准备
    function prepare(k){
        var userId;
        k.style.display="none";
        k.parentElement.lastElementChild.style.display="block";
        k.parentElement.parentElement.style.border="1px solid green";
        var kChild = k.parentElement.parentElement.childNodes;
        var roomId = document.getElementById("roomId").value;
        for(var j = 0;j<kChild.length;j++){
            if(kChild[j].nodeType === 3 && kChild[j].nodeName === '#text'){
                kChild[j].parentNode.removeChild(kChild[j]);
            }
        }
        kChild[1].checked="checked";
        userId = kChild[0].value;
        var message = {
            state:10,
            userId:userId,
            roomId:roomId,
            isOk:true
        };
        ws.send(JSON.stringify(message));
    }
    //取消准备
    function noPrepare(k){
        var userId
        k.style.display="none";
        k.parentElement.firstElementChild.style.display="block";
        k.parentElement.parentElement.style.border="1px solid red";
        var kChild = k.parentElement.parentElement.childNodes;
        var roomId = document.getElementById("roomId").value;
        for(var j = 0;j<kChild.length;j++){
            if(kChild[j].nodeType === 3 && kChild[j].nodeName === '#text'){
                kChild[j].parentNode.removeChild(kChild[j]);
            }
        }
        kChild[1].checked="";
        userId = kChild[0].value;
        var message = {
            state:10,
            userId:userId,
            roomId:roomId,
            isOk:false
        };
        ws.send(JSON.stringify(message));
    }
    //关闭房间
    function closeRoom(){
        var roomPopups = document.getElementById("roomPopups");
        var chatArea = document.getElementById("chatArea");
        var roomMasterId =  document.getElementById("roomMasterId");
        var roomId = document.getElementById("roomId");
        var roomMember = document.getElementsByClassName('roomMember');
        var roomChatBut = document.getElementById("roomChatBut");
        $.post("${ctx}/home?method=closeRoom",{
            roomId:roomId.value,
            loginUserId:loginUserId
        },function (jsonMsg){
            if(jsonMsg.state){
                roomMemberCount--;
                var message = {
                    state:8,
                    outUserId:loginUserId,
                    roomId:roomId.value,
                    outUserNickName:loginUserNickName,
                    outUserPortrait:loginUserPortrait
                };
                ws.send(JSON.stringify(message));
                roomPopups.style.display="none";
                for (var i = chatArea.children.length - 1; i >= 0; i--) {
                    chatArea.removeChild(chatArea.children[i]);
                }
                for(var i =0;i<roomMember.length;i++){
                    for (var j = roomMember[i].children.length - 1; j >= 0; j--) {
                        roomMember[i].removeChild(roomMember[i].children[j]);
                    }

                }
                if(loginUserId==roomMasterId.value){
                    roomChatBut.removeChild(roomChatBut.lastElementChild);
                }
                var roomMemberInput = $('input[name=roomMemberInput]');
                for(var i=0;i<roomMemberInput.length;i++){
                    roomMemberInput[i].checked="";
                }
            }
        });

    }
    //查询回填房间内的好友信息
    function roomSelectFriend(){
        var roomFriend = document.getElementById("roomFriend");
        for (var i = roomFriend.children.length - 1; i >= 0; i--) {
            roomFriend.removeChild(roomFriend.children[i]);
        }
        $.post('${ctx}/home?method=selectFriend',{myId:loginUserId},function (jsonMsg){
            for (var i = 0;i<jsonMsg.length;i++){
                if(loginUser.indexOf(jsonMsg[i].id)!=-1){
                    roomFriend.innerHTML+='<div class="friendData clearfix"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+jsonMsg[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+jsonMsg[i].nickName+'</span><p>在线</p></div><div class="invite"><button type="button" onclick="inviteHe('+jsonMsg[i].id+')">邀请</button></div><input type="text" value="'+jsonMsg[i].id+'"hidden></div>';
                }
            }
            for (var i = 0;i<jsonMsg.length;i++){
                if(loginUser.indexOf(jsonMsg[i].id)==-1){
                    roomFriend.innerHTML +='<div class="friendData clearfix"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+jsonMsg[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+jsonMsg[i].nickName+'</span><a>离线</a></div><input type="text" value="'+jsonMsg[i].id+'"hidden></div>';
                }
            }
        })
    }
    //点击房间好友
    function roomSelectFriendLi(k){
        var roomFriendTileLi = document.getElementsByClassName("roomFriendTileLi");
        for(var i = 0;i<roomFriendTileLi.length;i++){
            roomFriendTileLi[i].style.borderBottom="";
        }
        k.style.borderBottom="1px solid #FFFFFF";
        var roomFriend = document.getElementById("roomFriend");
        for (var i = roomFriend.children.length - 1; i >= 0; i--) {
            roomFriend.removeChild(roomFriend.children[i]);
        }
        $.post('${ctx}/home?method=selectFriend',{myId:loginUserId},function (jsonMsg){
            for (var i = 0;i<jsonMsg.length;i++){
                if(loginUser.indexOf(jsonMsg[i].id)!=-1){
                    roomFriend.innerHTML+='<div class="friendData clearfix"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+jsonMsg[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+jsonMsg[i].nickName+'</span><p>在线</p></div><div class="invite"><button type="button" onclick="inviteHe('+jsonMsg[i].id+')">邀请</button></div><input type="text" value="'+jsonMsg[i].id+'"hidden></div>';
                }
            }
            for (var i = 0;i<jsonMsg.length;i++){
                if(loginUser.indexOf(jsonMsg[i].id)==-1){
                    roomFriend.innerHTML +='<div class="friendData clearfix"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+jsonMsg[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+jsonMsg[i].nickName+'</span><a>离线</a></div><input type="text" value="'+jsonMsg[i].id+'"hidden></div>';
                }
            }
        })
    }
    //房间招募
    function recruit(){
        var roomId = document.getElementById("roomId");
        if(roomId==null||roomId==undefined||roomId==""){
            layer.msg("数据异常,招募失败");
            return;
        }
        if(roomMemberCount==6){
            layer.msg("人数已满");
            return;
        }
        var message = {
            state:6,
            sendDate:new Date(),
            myNickName:loginUserNickName,
            myPortrait:loginUserPortrait,
            sendUserId:loginUserId,
            roomId:roomId.value,
        };
        ws.send(JSON.stringify(message));
    }
    //点击招募信息加入房间
    function joinRoom(roomId){
        var roomPopups = document.getElementById("roomPopups");
        var roomMember = document.getElementsByClassName("roomMember");
        var layerIndex = layer.load();
        //判断房间是否存在,判断房间人数是否已满
        $.post("${ctx}/home?method=joinRoom",{
            roomId:roomId,
            userId:loginUserId,
            memberNickName:loginUserNickName,
            memberPortrait:loginUserPortrait
        },function (Msg){
            if(Msg.state){
                $.post("${ctx}/home?method=memberLoad",{
                    roomId:roomId,
                    myId:loginUserId
                },function (jsonMsg){
                    var message = {
                        state:9,
                        joinUserId:loginUserId,
                        roomId:roomId,
                        joinMemberNickName:loginUserNickName,
                        joinMemberPortrait:loginUserPortrait
                    };
                    ws.send(JSON.stringify(message));
                    var friend = jsonMsg.friendList;
                    var roomMemberList = jsonMsg.sysRoomMemberPoList;
                    var roomMaster = document.getElementById("roomMasterId");
                    var room = document.getElementById("roomId");
                    roomMaster.setAttribute("value",jsonMsg.roomMasterId);
                    room.setAttribute("value",jsonMsg.roomId);
                    document.getElementById("roomCode").innerText=jsonMsg.roomNumber;
                    var roomFriend = document.getElementById("roomFriend");
                    for (var i = roomFriend.children.length - 1; i >= 0; i--) {
                        roomFriend.removeChild(roomFriend.children[i]);
                    }
                    //回填好友
                    for (var i = 0;i<friend.length;i++){
                        if(loginUser.indexOf(friend[i].id)!=-1){
                            roomFriend.innerHTML+='<div class="friendData clearfix"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+friend[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+friend[i].nickName+'</span><p>在线</p></div><div class="invite"><button type="button" onclick="inviteHe('+friend[i].id+')">邀请</button></div><input type="text" value="'+friend[i].id+'"hidden></div>';
                        }
                    }
                    for (var i = 0;i<friend.length;i++){
                        if(loginUser.indexOf(friend[i].id)==-1){
                            roomFriend.innerHTML +='<div class="friendData clearfix"><input type="radio" name="therefore" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+friend[i].userPortrait+'" class="fl"><div class="friendName fl"><span>'+friend[i].nickName+'</span><a>离线</a></div><input type="text" value="'+friend[i].id+'"hidden></div>';
                        }
                    }
                    //回填房间成员
                    for(var j = 0;j<roomMemberList.length;j++){
                        var a = roomMemberList[j].memberLocation-1;
                        if(jsonMsg.roomMasterId==roomMemberList[j].userId){
                            roomMember[a].innerHTML+='<input type="text" hidden value="'+roomMemberList[j].userId+'"><i>房主</i><input type="checkbox" name="roomMemberInput" checked hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+roomMemberList[j].memberPortrait+'"><p>'+roomMemberList[j].memberNickName+'</p>';
                            roomMember[a].style.border="1px solid green";
                        }
                        if(jsonMsg.roomMasterId!=roomMemberList[j].userId&&roomMemberList[j].userId==loginUserId){
                            if(roomMemberList[j].whetherPrepare==1){
                                roomMember[a].innerHTML+='<input type="text" hidden value="'+roomMemberList[j].userId+'"><input type="checkbox" name="roomMemberInput" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+roomMemberList[j].memberPortrait+'"><p>'+roomMemberList[j].memberNickName+'</p><div class="roomMemberBtn"><button type="button" class="prepare" onclick="prepare(this)">准备</button><button type="button" class="noPrepare" onclick="noPrepare(this)" style="display: none">取消准备</button></div>';
                                roomMember[a].style.border="1px solid red";
                            }
                            if(roomMemberList[j].whetherPrepare==2){
                                roomMember[a].innerHTML+='<input type="text" hidden value="'+roomMemberList[j].userId+'"><input type="checkbox" name="roomMemberInput" checked hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+roomMemberList[j].memberPortrait+'"><p>'+roomMemberList[j].memberNickName+'</p><div class="roomMemberBtn"><button type="button" class="prepare" onclick="prepare(this)">准备</button><button type="button" class="noPrepare" onclick="noPrepare(this)" style="display: none">取消准备</button></div>';
                                roomMember[a].style.border="1px solid green";
                            }
                        }
                        if(jsonMsg.roomMasterId!=roomMemberList[j].userId&&roomMemberList[j].userId!=loginUserId){
                            if(roomMemberList[j].whetherPrepare==1){
                                roomMember[a].innerHTML+='<input type="text" hidden value="'+roomMemberList[j].userId+'"><input type="checkbox" name="roomMemberInput" hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+roomMemberList[j].memberPortrait+'"><p>'+roomMemberList[j].memberNickName+'</p>';
                                roomMember[a].style.border="1px solid red";
                            }
                            if(roomMemberList[j].whetherPrepare==2) {
                                roomMember[a].innerHTML+='<input type="text" hidden value="'+roomMemberList[j].userId+'"><input type="checkbox" name="roomMemberInput" checked hidden><img src="${ctx}/FileIo?method=getPortraitImage&imgName='+roomMemberList[j].memberPortrait+'"><p>'+roomMemberList[j].memberNickName+'</p>';
                                roomMember[a].style.border="1px solid green";
                            }
                        }
                    }
                    setTimeout(function (){
                        roomPopups.style.display="block";
                        layer.close(layerIndex);
                    },1500);
                });
            }else {
                layer.close(layerIndex);
                layer.msg(Msg.msg);
            }
        });
    }
    //房间内聊天
    function roomChat(){
        var roomChat = document.getElementById("roomChat").value;
        var roomId = document.getElementById("roomId").value;
        if(roomId==null||roomId==undefined||roomId==""){
            layer.msg("数据异常");
            return;
        }
        if(roomChat==null||roomChat==undefined||roomChat==""){
            layer.msg("总得说些什么吧");
            return;
        }
        var message = {
            state:11,
            sendUserId:loginUserId,
            roomId:roomId,
            sendUserNickName:loginUserNickName,
            sendText:roomChat
        };
        ws.send(JSON.stringify(message));
        document.getElementById("roomChat").value="";
    }
    //邀请好友
    function inviteHe(o){
        var roomId =document.getElementById("roomId").value;
        var message = {
            state:12,
            friendId:o,
            roomId:roomId,
            inviteHePortrait:loginUserPortrait,
            sendText:"你的好友想和你一起游戏"
        };
        ws.send(JSON.stringify(message));
        layer.msg("邀请成功");
    }
    //开始游戏
    function startGame(){
        var roomId= document.getElementById("roomId").value;
        var roomMemberInput = $('input[name=roomMemberInput]');
        var count = 0;
        for(var i = 0;i<roomMemberInput.length;i++){
            if(roomMemberInput[i].checked){
                count++;
            }else {
                break;
            }
        }
        if(count==6){
            var message = {
                state:13,
                roomId:roomId
            };
            ws.send(JSON.stringify(message));
            <%----%>
        }else {
            layer.msg("还有人没有准备")
            return;
        }
    }
    //重置房间
    function resetRoom(){
        $.post("${ctx}/home?method=resetRoom",{
            loginUserId:loginUserId
        },function (jsonMsg){
            if(jsonMsg.state){
                var data = jsonMsg.data;
                if(data!=null){
                    var message = {
                        state:8,
                        outUserId:loginUserId,
                        roomId:data.id,
                        outUserNickName:loginUserNickName,
                        outUserPortrait:loginUserPortrait
                    };
                    ws.send(JSON.stringify(message));
                }
            }else {
                layer.msg(jsonMsg.msg);
            }
        });
    }
</script>
<script src="${ctx}/static/js/home.js"></script>
</body>
</html>
