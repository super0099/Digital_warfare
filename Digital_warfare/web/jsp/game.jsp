
<%@ page import="com.yxm.vo.RoomIdAndUserId" %><%--
  Created by IntelliJ IDEA.
  User: super007
  Date: 2021/6/7
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!--需要引入jstl-1.2.jar包-->
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/><!--需要引入jstl-1.2.jar包-->
<%RoomIdAndUserId roomIdAndUserId = (RoomIdAndUserId)request.getAttribute("roomIdAndUserId");%>
<html>
<head>
  <title>游戏页面</title>
  <link rel="icon" href="${ctx}/static/img/网页图标.jpg">
  <link rel="stylesheet" href="${ctx}/static/css/game.css">
</head>
<body>
<!--闹钟倒计时-->
<div class="clock" id="clock" style="display: none;">
  <input type="text" value="45" id="countDown">
</div>
<!--玩家1-->
<div class="playerOne player" id="playerOne">
  <input type="text" value="1" hidden>
  <!--玩家1,左对应的武器和数--><!--区别左右,1为左-->
  <div class="playerOneLeftImg fl">
    <input type="text" value="1" readonly class="member" id="player1LF" onClick="myLeftCode(this)"><br>
    <input type="text" value="1" hidden class="isLefts">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg" onclick="attacks(this)">
  </div>
  <!--玩家1,个人资料-->
  <div class="playerOneData fl">
    <p id="player1N"></p>
    <img src="" id="player1I"><br>
    <div class="healthPoint clearfix">
      <i class="fl"></i>
      <input type="text" value="30" class="fr">
    </div>
  </div>
  <!--玩家1,右对应的武器--><!--区别左右,1为左,2为右-->
  <div class="playerOneRightImg fl">
    <input type="text" value="1" readonly class="member" id="player1RF"  onClick="myRightCode(this)"><br>
    <input type="text" value="2" hidden class="isRights">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg" onclick="attacks(this)">
  </div>
  <%--用户Id--%>
  <input type="text" value="" hidden id="userId1" class="oneId">
</div>
<div class="playerToo player" id="playerToo">
  <input type="text" value="2" hidden>
  <!--玩家2,右对应的武器和数-->
  <div class="playerTooRight">
    <input type="text" value="1" readonly class="member" id="player2RF" onClick="join(this)"><br>
    <input type="text" value="2" hidden class="isRights">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div><br>
  <!--玩家2,左对应的武器和数-->
  <div class="playerOneLeftImg fl">
    <input type="text" value="1" readonly class="member" id="player2LF" onClick="join(this)"><br>
    <input type="text" value="1" hidden class="isLefts">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <!--玩家2,个人资料-->
  <div class="playerOneData fl">
    <p id="player2N"></p>
    <img src="" id="player2I"><br>
    <div class="healthPoint clearfix">
      <i class="fl"></i>
      <input type="text" value="30" class="fr">
    </div>
  </div>
  <%--用户Id--%>
  <input type="text" value="" hidden id="userId2" class="tooId">
</div>
<div class="playerThree player" id="playerThree">
  <input type="text" value="3" hidden>
  <!--玩家3,左对应的武器和数-->
  <div class="playerThreeLeft fl">
    <input type="text" value="1" readonly class="member" id="player3LF" onClick="join(this)"><br>
    <input type="text" value="1" hidden class="isLefts">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <!--玩家3,个人资料-->
  <div class="playerOneData fl">
    <div class="healthPoint clearfix">
      <i class="fl"></i>
      <input type="text" value="30" class="fr">
    </div>
    <img src="" id="player3I"><br>
    <p id="player3N">极速-2</p>
  </div><br>
  <!--玩家3,右对应的武器-->
  <div class="playerOneRight">
    <input type="text" value="1" readonly class="member" id="player3RF" onClick="join(this)"><br>
    <input type="text" value="2" hidden class="isRights">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <%--用户Id--%>
  <input type="text" value="" hidden id="userId3" class="threeId">
</div>
<div class="playerFour player" id="playerFour">
  <input type="text" value="4" hidden>
  <!--玩家4,左对应的武器和数-->
  <div class="playerFourLeft fl">
    <input type="text" value="1" readonly class="member" id="player4LF" onClick="join(this)"><br>
    <input type="text" value="1" hidden class="isLefts">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <!--玩家4,个人资料-->
  <div class="playerOneData fl">
    <div class="healthPoint clearfix">
      <i class="fl"></i>
      <input type="text" value="30" class="fr">
    </div>
    <img src="" id="player4I"><br>
    <p id="player4N"></p>
  </div>
  <!--玩家4,右对应的武器-->
  <div class="playerFourRight fl">
    <input type="text" value="1" readonly class="member" id="player4RF" onClick="join(this)"><br>
    <input type="text" value="2" hidden class="isRights">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <%--用户Id--%>
  <input type="text" value="" hidden id="userId4" class="fourId">
</div>
<div class="playerFive player" id="playerFive">
  <input type="text" value="5" hidden>
  <!--玩家5,个人资料-->
  <div class="playerOneData fl">
    <div class="healthPoint clearfix">
      <i class="fl"></i>
      <input type="text" value="30" class="fr">
    </div>
    <img src="" id="player5I"><br>
    <p id="player5N"></p>
  </div><br>
  <!--玩家5,右对应的武器-->
  <div class="playerFiveRight fl">
    <input type="text" value="1" readonly class="member" id="player5RF" onClick="join(this)"><br>
    <input type="text" value="2" hidden class="isRights">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <!--玩家5,左对应的武器-->
  <div class="playerFiveLeft fl">
    <input type="text" value="1" readonly class="member" id="player5LF" onClick="join(this)"><br>
    <input type="text" value="1" hidden class="isLefts">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <%--用户Id--%>
  <input type="text" value="" hidden id="userId5" class="fiveId">
</div>
<div class="playerSix player" id="playerSix">
  <input type="text" value="6" hidden>
  <!--玩家6,右对应的武器-->
  <div class="playerSixRight fl">
    <input type="text" value="1" readonly class="member" id="player6RF" onClick="join(this)"><br>
    <input type="text" value="2" hidden class="isRights">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div><br>
  <!--玩家6,个人资料-->
  <div class="playerOneData fl">
    <p id="player6N"></p>
    <img src="" id="player6I"><br>
    <div class="healthPoint clearfix">
      <i class="fl"></i>
      <input type="text" value="30" class="fr">
    </div>
  </div>
  <!--玩家6,左对应的武器-->
  <div class="playerSixLeft fl">
    <input type="text" value="1" readonly class="member" id="player6LF" onClick="join(this)"><br>
    <input type="text" value="1" hidden class="isLefts">
    <img src="${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png" class="memberImg">
  </div>
  <%--用户Id--%>
  <input type="text" value="" hidden id="userId6" class="sixId">
</div>
<!--中央战场定位-->
<div class="battleground">
  <!--中央战场-->
  <div class="battlegroundPosision" id="battlegroundPosision">
    <!--移动物体-->
    <img src="#" class="objectMove" id="objectMove" style="display: none;">
    <!--成员形象-->
    <div class="memberOne oneId" id="memberOne" onclick="attackMy(this)">
      <input type="text" class="positions" value="1" hidden>
      <img src="${ctx}/FileIo?method=getPortraitImage&imgName=中央战场人物.png">
    </div>
    <div class="memberToo tooId" id="memberToo" onclick="attackMy(this)">
      <input type="text" class="positions" value="2" hidden>
      <img src="${ctx}/FileIo?method=getPortraitImage&imgName=中央战场人物.png">
    </div>
    <div class="memberThree threeId" id="memberThree" onclick="attackMy(this)">
      <input type="text" class="positions" value="3" hidden>
      <img src="${ctx}/FileIo?method=getPortraitImage&imgName=中央战场人物.png">
    </div>
    <div class="memberFour fourId" id="memberFour" onclick="attackMy(this)">
      <input type="text" class="positions" value="4" hidden>
      <img src="${ctx}/FileIo?method=getPortraitImage&imgName=中央战场人物.png">
    </div>
    <div class="memberFive fiveId" id="memberFive" onclick="attackMy(this)">
      <input type="text" class="positions" value="5" hidden>
      <img src="${ctx}/FileIo?method=getPortraitImage&imgName=中央战场人物.png">
    </div>
    <div class="memberSix sixId" id="memberSix" onclick="attackMy(this)">
      <input type="text" class="positions" value="6" hidden>
      <img src="${ctx}/FileIo?method=getPortraitImage&imgName=中央战场人物.png">
    </div>
  </div>
</div>
<!--显示当前轮数-->
<div class="bout" id="begin">
  <p>当前回合: <input type="text" id="bout" readonly value="1"></p>
</div>
<!--信息提示-->
<div class="messageArea" id="messageArea">

<%--  <div class="sysMessage">--%>
<%--    <p>[系统提示]: <span>极速获取突击步枪</span></p>--%>
<%--  </div>--%>
<%--  <div class="userMessage">--%>
<%--    <p>[玩家]: <span>快点啊,我等到花都谢了</span></p>--%>
<%--  </div>--%>
</div>
<!--左武器选择框 1是子弹,2是盾牌-->
<div class="weaponL" style="display: none;" id="weaponL">
  <div>
    <img src="" onclick="weaponLs(this)">
    <input type="text" value="" hidden>
  </div>
  <div>
    <img src="" onclick="weaponLs(this)">
    <input type="text" value="" hidden>
  </div>
</div>
<!--右武器选择框-->
<div class="weaponR" style="display: none;" id="weaponR">
  <div>
    <img src="" onclick="weaponRs(this)">
    <input type="text" value="" hidden>
  </div>
  <div>
    <img src="" onclick="weaponRs(this)">
    <input type="text" value="" hidden>
  </div>
</div>
<!--信息发送-->
<div class="roomChatArea">
  <div class="roomChatData">
    <i></i>
    <input type="text" placeholder="想说什么?" id="roomChat" autocomplete="off">
    <a onclick="roomChat()">发送</a>
  </div>
</div>
<%--提示--%>
<div class="hint" id="hint" style="display: none;">
    <p>轮到你了</p>
</div>
<div class="diePlayer" id="diePlayer" style="display: none">
  <h1>你已经阵亡</h1>
</div>
<div class="closeGame" id="closeGame" style="display: none;">
  <h1>游戏结束</h1>
  <button type="button" onclick="closeGame()">返回主页</button>
</div>
<script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
<script src="${ctx}/static/js/game.js"></script>
<script>
  var joinCode;//我操作点击的数字
  var myCode;//我操作点击的数字的input标签,可用于识别左右
  var isOkJoin=0;//用来区别玩家在本轮是否进行操作
  var isAttack = 0;//用来区别玩家在本轮是否进行了一次攻击
  var boutCode=1;//当前轮数
  var handlers=0;//当前操作的玩家的数组位置
  var roomId = <%=roomIdAndUserId.getRoomId()%>;
  var myUserId = <%=roomIdAndUserId.getUserId()%>;
  var second = 10;//倒计时
  var ws = null;
  var elements = [];//回填页面的数组
  var playerPosition = [];//服务器返回的数组
  var enemyPlayer = [];//友方玩家集合
  var oppositePlayer = [];//敌方玩家集合
  var myWeapon =-1;//我使用的武器,如果等于-1说明我没有点击武器
  var myWeaponLR = -1;//记录玩家使用的是左武器还是右武器
  var diePlayers = [];//死亡玩家集合
  var explode =[];//爆炸特效消失
  var we;//我方
  var they;//敌方
  var roomIdcc;
  if(WebSocket){
    ws = new WebSocket("wss://192.168.191.1:8443/Digital_warfare/startGame");
  }else{
    alert("浏览器不支持Websocket");
  }
  ws.onopen=function (){
  }

  //回填数据,获取房间位置为1的用户也就是第一个开始的用户,并且把闹钟位置固定在他对应的位置上
  $(function (){
    $.post("${ctx}/game?method=selectMember",{roomId:roomId},function (data){
      for(var i = 0;i<data.length;i++){
        playerPosition.push(data[i]);
      }
      //获取玩家位置
      var player = document.getElementsByClassName("player");
      var player1N = document.getElementById("player1N");
      var player1I = document.getElementById("player1I");
      var player2N = document.getElementById("player2N");
      var player2I = document.getElementById("player2I");
      var player3N = document.getElementById("player3N");
      var player3I = document.getElementById("player3I");
      var player4N = document.getElementById("player4N");
      var player4I = document.getElementById("player4I");
      var player5N = document.getElementById("player5N");
      var player5I = document.getElementById("player5I");
      var player6N = document.getElementById("player6N");
      var player6I = document.getElementById("player6I");
      var userId1 = document.getElementById("userId1");
      var userId2 = document.getElementById("userId2");
      var userId3 = document.getElementById("userId3");
      var userId4 = document.getElementById("userId4");
      var userId5 = document.getElementById("userId5");
      var userId6 = document.getElementById("userId6");
      var j=0;
      //调整用户的顺序
      for(var i = 0;i<data.length;i++){
        if(data[i].userId==myUserId){
          break;
        }
        j++;
      }
      for(var i = j;i<data.length;i++){
        elements.push(data[i]);
      }
      for(var i = 0;i<data.length;i++){
        if(j>i){
          elements.push(data[i]);
        }
      }
      //回填页面玩家数据
      player1N.innerText=elements[0].memberNickName;
      player2N.innerText=elements[1].memberNickName;
      player3N.innerText=elements[2].memberNickName;
      player4N.innerText=elements[3].memberNickName;
      player5N.innerText=elements[4].memberNickName;
      player6N.innerText=elements[5].memberNickName;
      userId1.setAttribute("value",elements[0].userId);
      userId2.setAttribute("value",elements[1].userId);
      userId3.setAttribute("value",elements[2].userId);
      userId4.setAttribute("value",elements[3].userId);
      userId5.setAttribute("value",elements[4].userId);
      userId6.setAttribute("value",elements[5].userId);
      player1I.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+elements[0].memberPortrait);
      player2I.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+elements[1].memberPortrait);
      player3I.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+elements[2].memberPortrait);
      player4I.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+elements[3].memberPortrait);
      player5I.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+elements[4].memberPortrait);
      player6I.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+elements[5].memberPortrait);

      //获取我方阵容
      var battleArray =0;
      for(var i = 0;i<playerPosition.length;i++){
        if(playerPosition[i].userId==myUserId){
          battleArray = playerPosition[i].memberLocation;
          break;
        }
      }
      if(battleArray>3){
        for(var i=0;i<playerPosition.length;i++){
          if(playerPosition[i].memberLocation>3){
            enemyPlayer.push(playerPosition[i]);
          }
        }
      }
      if(battleArray<4){
        for(var i=0;i<playerPosition.length;i++){
          if(playerPosition[i].memberLocation<4){
            enemyPlayer.push(playerPosition[i]);
          }
        }
      }
      //获取敌方阵容
      var oppositeList =[];
      for(var i =0;i<playerPosition.length;i++){
        oppositeList.push(playerPosition[i]);
      }
      oppositePlayer=oppositeList;
      for(var i=0;i<enemyPlayer.length;i++){
        oppositePlayer.splice(oppositePlayer.indexOf(enemyPlayer[i]),1);
      }
      //我方阵容添加标识
      if(playerPosition[0].userId==myUserId){
        for(var o=0;o<enemyPlayer.length;o++){
          for(var j = 0;j<player.length;j++){
            if(enemyPlayer[o].userId==player[j].lastElementChild.value){
              player[j].style.border = "2px solid #FFB800";
            }
          }
        }
      }
      //获取到第一个操作玩家位置,显示计时器,并且启动游戏计时
      for(var i = 0;i<player.length;i++){
        if(player[i].lastElementChild.value==playerPosition[0].userId){
          //获取到第一个操作玩家的位置
          var clockLocation = player[i].firstElementChild.value;
          var clock = document.getElementById("clock");
          //并且把计时器位置放在该位置
          if(clockLocation==1){
            //玩家5,闹钟位置top:90,left:80.
            //玩家6闹钟位置top:600,left:80.
            //玩家1闹钟位置top:700,left:565.
            //玩家2闹钟位置top:620,left:1390.
            //玩家3闹钟位置top:95,left:1390.
            //玩家4闹钟位置top:95,left:850.
            clock.style.top = 700+"px";
            clock.style.left = 565+"px";
            clock.style.display="block";
            if(playerPosition[0].userId==myUserId){
              clockBegin();
            }
          }
          if(clockLocation==2){
            clock.style.top = 620+"px";
            clock.style.left = 1390+"px";
            clock.style.display="block";
            if(playerPosition[0].userId==myUserId){
              clockBegin();
            }
          }
          if(clockLocation==3){
            clock.style.top = 95+"px";
            clock.style.left = 1390+"px";
            clock.style.display="block";
            if(playerPosition[0].userId==myUserId){
              clockBegin();
            }
          }
          if(clockLocation==4){
            clock.style.top = 95+"px";
            clock.style.left = 850+"px";
            clock.style.display="block";
            if(playerPosition[0].userId==myUserId){
              clockBegin();
            }
          }
          if(clockLocation==5){
            clock.style.top = 90+"px";
            clock.style.left = 80+"px";
            clock.style.display="block";
            if(playerPosition[0].userId==myUserId){
              clockBegin();
            }
          }
          if(clockLocation==6){
            clock.style.top = 600+"px";
            clock.style.left = 80+"px";
            clock.style.display="block";
            if(playerPosition[0].userId==myUserId){
              clockBegin();
            }
          }
        }
      }
    });
  });

  //倒计时
  function clockBegin(){
    var Down = window.setInterval(function(){
      if(diePlayers.length==3){
        var we = 0;
        for(var i=0;i<diePlayers.length;i++){
          for(var j=0;j<oppositePlayer.length;j++){
            if(diePlayers[i]==oppositePlayer[j]){
              we++;
            }
          }
        }
        if(we==3||we==0){
          var message = {
            state:15,
            roomId:roomId,
          };
          ws.send(JSON.stringify(message));
          clearInterval(Down);
          return;
        }
      }
      if(diePlayers.length>=5){
        console.log(diePlayers);
        var message = {
          state:15,
          roomId:roomId,
        };
        ws.send(JSON.stringify(message));
        clearInterval(Down);
        return;
      }
      if(diePlayers.length==4){
        var we = 0;
        for(var i=0;i<diePlayers.length;i++){
          console.log(diePlayers[i]);
          for(var j=0;j<oppositePlayer.length;j++){
            console.log(oppositePlayer[j]);
            if(diePlayers[i]==oppositePlayer[j]){
              we++;
            }
          }
        }
        if(we==3||we==1){
          console.log(diePlayers);
          var message = {
            state:15,
            roomId:roomId,
          };
          ws.send(JSON.stringify(message));
          clearInterval(Down);
          return;
        }
      }
      var message = {
        state:1,
        roomId:roomId,
        second:second
      };
      ws.send(JSON.stringify(message));
    },1000);
  }
  //系统后台支撑
  ws.onmessage=function (event){
    var obj = JSON.parse(event.data);
    var isLefts = document.getElementsByClassName("isLefts");
    var isRights = document.getElementsByClassName("isRights");
    //全局倒计时
    if(obj.state==1){
      var player = document.getElementsByClassName("player");
      var countDown = document.getElementById("countDown");
      countDown.setAttribute("value",obj.second);
      if(second>0){
        if(second<10){
          countDown.style.color="red";
        }
        second--;
      }else {
        second=10;
        var clock = document.getElementById('clock');
        clock.style.display="none";
        for(var i = 0;i<player.length;i++){
          player[i].style.border="none";
        }
        handlers++;
        if(handlers>5){
          boutCode++;
          handlers=0;
          var bout = document.getElementById("bout");
          bout.setAttribute("value",boutCode);
        }
        nextPlay();
      }
    }
    //玩家数字相加小于5大于0
    if(obj.state==2){
      var isLefts = document.getElementsByClassName("isLefts");
      var isRights = document.getElementsByClassName("isRights");
      if(obj.isLeft==2){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
          if(isLeftsParentId==obj.userId){
            var setCode = isLefts[i].parentElement.firstElementChild.value;
            if(setCode==6){
              for(var i = 0;i<isRights.length;i++){
                var isLeftsCode = isRights[i].value;
                if(isLeftsCode==obj.isLeft){
                  var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
                  if(isLeftsParentId==obj.userId){
                    var setCodes = isRights[i].parentElement.firstElementChild;
                    var setImg = isRights[i].parentElement.lastElementChild;
                    setCodes.setAttribute("value",obj.joinCode);
                    setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=箭.png");
                    break;
                  }
                }
              }
            }else {
              for(var i = 0;i<isRights.length;i++){
                var isLeftsCode = isRights[i].value;
                if(isLeftsCode==obj.isLeft){
                  var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
                  if(isLeftsParentId==obj.userId){
                    var setCodes = isRights[i].parentElement.firstElementChild;
                    var setImg = isRights[i].parentElement.lastElementChild;
                    setCodes.setAttribute("value",obj.joinCode);
                    setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
                    break;
                  }
                }
              }
            }
            break;
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
          if(isLeftsParentId==obj.userId){
            var setCode = isRights[i].parentElement.firstElementChild.value;
            if(setCode==6){
              for(var i = 0;i<isLefts.length;i++){
                var isLeftsCode = isLefts[i].value;
                if(isLeftsCode==obj.isLeft){
                  var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
                  if(isLeftsParentId==obj.userId){
                    var setCodes = isLefts[i].parentElement.firstElementChild;
                    setCodes.setAttribute("value",obj.joinCode);
                    var setImg = isLefts[i].parentElement.lastElementChild;
                    setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=箭.png");
                    break;
                  }
                }
              }
            }else {
              for(var i = 0;i<isLefts.length;i++){
                var isLeftsCode = isLefts[i].value;
                if(isLeftsCode==obj.isLeft){
                  var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
                  if(isLeftsParentId==obj.userId){
                    var setCodes = isLefts[i].parentElement.firstElementChild;
                    setCodes.setAttribute("value",obj.joinCode);
                    var setImg = isLefts[i].parentElement.lastElementChild;
                    setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
                    break;
                  }
                }
              }
            }
            break;
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家武器选择框
    if(obj.state==5){
      if(obj.isLeft==2){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isRights[i].parentElement.lastElementChild;
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isLefts[i].parentElement.lastElementChild;
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //等于玩家数字相加等于5
    if(obj.state==4){
      if(obj.isLeft==2){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isRights[i].parentElement.firstElementChild;
              setCode.setAttribute("value",obj.joinCode);
              break;
            }
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isLefts[i].parentElement.firstElementChild;
              setCode.setAttribute("value",obj.joinCode);
              break;
            }
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家数字相加等于6
    if(obj.state==3){
      if(obj.isLeft==2){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isRights[i].parentElement.firstElementChild;
              var setImg = isRights[i].parentElement.lastElementChild;
              setCode.setAttribute("value",obj.joinCode);
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode!=obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isLefts[i].parentElement.lastElementChild;
              var setCode = isLefts[i].parentElement.firstElementChild.value;
              if(setCode<5){
                setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=箭.png");
                break;
              }
            }
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isLefts[i].parentElement.firstElementChild;
              setCode.setAttribute("value",obj.joinCode);
              var setImg = isLefts[i].parentElement.lastElementChild;
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode!=obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isRights[i].parentElement.lastElementChild;
              var setCode = isRights[i].parentElement.firstElementChild.value;
              if(setCode<5){
                setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=箭.png");
                break;
              }
            }
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家数字相加等于7
    if(obj.state==6){
      if(obj.isLeft==2){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isRights[i].parentElement.firstElementChild;
              var setImg = isRights[i].parentElement.lastElementChild;
              setCode.setAttribute("value",obj.joinCode);
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode!=obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isLefts[i].parentElement.lastElementChild;
              var setCode = isLefts[i].parentElement.firstElementChild.value;
              if(setCode<5){
                setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
                break;
              }
            }
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isLefts[i].parentElement.firstElementChild;
              setCode.setAttribute("value",obj.joinCode);
              var setImg = isLefts[i].parentElement.lastElementChild;
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode!=obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isRights[i].parentElement.lastElementChild;
              var setCode = isRights[i].parentElement.firstElementChild.value;
              if(setCode<5){
                setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
                break;
              }
            }
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家数字相加等于8
    if(obj.state==7){
      if(obj.isLeft==2){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isRights[i].parentElement.firstElementChild;
              var setImg = isRights[i].parentElement.lastElementChild;
              setCode.setAttribute("value",obj.joinCode);
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode!=obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isLefts[i].parentElement.lastElementChild;
              var setCode = isLefts[i].parentElement.firstElementChild.value;
              if(setCode<5){
                setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
                break;
              }
            }
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isLefts[i].parentElement.firstElementChild;
              setCode.setAttribute("value",obj.joinCode);
              var setImg = isLefts[i].parentElement.lastElementChild;
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode!=obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setImg = isRights[i].parentElement.lastElementChild;
              var setCode = isRights[i].parentElement.firstElementChild.value;
              if(setCode<5){
                setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
                break;
              }
            }
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家数字相加等于9
    if(obj.state==8){
      if(obj.isLeft==2){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isRights[i].parentElement.firstElementChild;
              var setImg = isRights[i].parentElement.lastElementChild;
              setCode.setAttribute("value",obj.joinCode);
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isLefts[i].parentElement.firstElementChild;
              var setImg = isLefts[i].parentElement.lastElementChild;
              setCode.setAttribute("value",obj.joinCode);
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家数字相加等于0
    if(obj.state==9){
      if(obj.isLeft==2){
        for(var i = 0;i<isRights.length;i++){
          var isLeftsCode = isRights[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isRights[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isRights[i].parentElement.firstElementChild;
              var setImg = isRights[i].parentElement.lastElementChild;
              setCode.setAttribute("value",obj.joinCode);
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
      }
      if(obj.isLeft==1){
        for(var i = 0;i<isLefts.length;i++){
          var isLeftsCode = isLefts[i].value;
          if(isLeftsCode==obj.isLeft){
            var isLeftsParentId = isLefts[i].parentElement.parentElement.lastElementChild.value;
            if(isLeftsParentId==obj.userId){
              var setCode = isLefts[i].parentElement.firstElementChild;
              var setImg = isLefts[i].parentElement.lastElementChild;
              setCode.setAttribute("value",obj.joinCode);
              setImg.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName="+obj.weaponImg);
              break;
            }
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.message+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家聊天
    if(obj.state==10){
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="userMessage"><p>['+obj.userName+']: <span>'+obj.sendText+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
    }
    //玩家攻击,678
    if(obj.state==11){
      //获取攻击玩家位置,获取被攻击玩家位置,判断使用的是什么武器再改变移动动画物体图片,判断被攻击玩家是否存在5,
      var attackUserId = obj.attackUserId;//攻击玩家的Id;
      var attackedUserId = obj.attackedUserId;//被攻击玩家Id;
      var attackPlace = 0;
      var attackedPlace = 0;
      //获取到攻击玩家的位置
      for(var i = 0;i<elements.length;i++){
        if(elements[i].userId==attackUserId){
          attackPlace=i;
          break;
        }
      }
      //获取到被攻击玩家的位置
      for(var i=0;i<elements.length;i++){
        if(elements[i].userId==attackedUserId){
          attackedPlace=i;
          break;
        }
      }
      if(obj.myWeapon==7||obj.myWeapon==8||obj.myWeapon==6){
        //12
        if(attackPlace==0&&attackedPlace==1){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j12.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="12.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            OneFightToo(Img,2);
            shield(obj)
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            OneFightToo(Img,1);
            bruise(obj)
          }
          sendDataMe(obj);
        }
        //13
        if(attackPlace==0&&attackedPlace==2){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j13.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="13.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            OneFightThree(Img,2);
            shield(obj);
          }else {
            OneFightThree(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //14
        if(attackPlace==0&&attackedPlace==3){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j14.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="14.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            OneFightFour(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            OneFightFour(Img,1);
            bruise(obj);
          }
          var messageArea =document.getElementById('messageArea');
          messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.sendText+'</span></p></div>';
          messageArea.scrollTop = messageArea.scrollHeight;
        }
        //15
        if(attackPlace==0&&attackedPlace==4){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j15.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="15.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            OneFightFive(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            OneFightFive(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //16
        if(attackPlace==0&&attackedPlace==5){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j16.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="16.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            OneFightSix(Img,2);
            shield(obj)
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            OneFightSix(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //21
        if(attackPlace==1&&attackedPlace==0){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j45.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="45.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            TooFightOne(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            TooFightOne(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //23
        if(attackPlace==1&&attackedPlace==2){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j14.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="14.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            TooFightThree(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            TooFightThree(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //24
        if(attackPlace==1&&attackedPlace==3){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j15.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="15.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            TooFightFour(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            TooFightFour(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //25
        if(attackPlace==1&&attackedPlace==4){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j15.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="15.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            TooFightFive(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            TooFightFive(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //26
        if(attackPlace==1&&attackedPlace==5){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j62.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="62.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            TooFightSix(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            TooFightSix(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //31
        if(attackPlace==2&&attackedPlace==0){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j46.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="46.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            ThreeFightOne(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            ThreeFightOne(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //32
        if(attackPlace==2&&attackedPlace==1){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j14.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="41.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            ThreeFightToo(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            ThreeFightToo(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //34
        if(attackPlace==2&&attackedPlace==3){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j15.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="15.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            ThreeFightFour(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            ThreeFightFour(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //35
        if(attackPlace==2&&attackedPlace==4){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j62.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="62.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            ThreeFightFive(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            ThreeFightFive(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //36
        if(attackPlace==2&&attackedPlace==5){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j45.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="45.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            ThreeFightSix(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            ThreeFightSix(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //41
        if(attackPlace==3&&attackedPlace==0){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j41.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="41.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FourFightOne(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FourFightOne(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //42
        if(attackPlace==3&&attackedPlace==1){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j42.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="42.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FourFightToo(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FourFightToo(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //43
        if(attackPlace==3&&attackedPlace==2){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j43.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="43.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FourFightThree(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FourFightThree(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //45
        if(attackPlace==3&&attackedPlace==4){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j45.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="45.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FourFightFive(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FourFightFive(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //46
        if(attackPlace==3&&attackedPlace==5){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j46.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="46.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FourFithSix(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FourFithSix(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //51
        if(attackPlace==4&&attackedPlace==0){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j42.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="42.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FiveFightOne(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FiveFightOne(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //52
        if(attackPlace==4&&attackedPlace==1){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j43.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="43.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FiveFightToo(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FiveFightToo(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //53
        if(attackPlace==4&&attackedPlace==2){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j26.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="26.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FiveFightThree(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FiveFightThree(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //54
        if(attackPlace==4&&attackedPlace==3){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j26.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="26.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FiveFightFour(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FiveFightFour(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //56
        if(attackPlace==4&&attackedPlace==5){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j41.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="41.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            FiveFightSix(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            FiveFightSix(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //61
        if(attackPlace==5&&attackedPlace==0){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j43.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="43.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            SixFightOne(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            SixFightOne(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //62
        if(attackPlace==5&&attackedPlace==1){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j26.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="26.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            SixFightToo(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            SixFightToo(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //63
        if(attackPlace==5&&attackedPlace==2){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j13.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="13.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            SixFightTree(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            SixFightTree(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //64
        if(attackPlace==5&&attackedPlace==3){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j13.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="13.png";
          }
          if(obj.immune){
            //获取敌方护盾,计算损耗,我方武器计算损耗
            SixFightFour(Img,2);
            shield(obj);
          }else {
            //我方武器计算损耗,敌方生命计算损耗
            SixFightFour(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
        //65
        if(attackPlace==5&&attackedPlace==4){
          var Img = null;
          if(obj.myWeapon==6){
            Img = "j14.png";
          }else if(obj.myWeapon==7||obj.myWeapon==8){
            Img="14.png";
          }
          if(obj.immune){
            SixFightFive(Img,2);
            shield(obj);
          }else {
            SixFightFive(Img,1);
            bruise(obj);
          }
          sendDataMe(obj);
        }
      }
    }
    //玩家攻击手榴弹
    if(obj.state==12){
      var player = document.getElementsByClassName("player");
      var positions = document.getElementsByClassName("positions");
      var healthPoint = document.getElementsByClassName("healthPoint");
      var opponent = obj.opposite;
      for(var j = 0;j<opponent.length;j++){
        for(var i = 0;i<player.length;i++){
          var userIds = player[i].lastElementChild.value;
          if(opponent[j]==userIds){
            positions[i].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=爆炸特效.png");
            explode.push(i);
          }
        }
        for(var i = 0;i<healthPoint.length;i++){
          var userIds = healthPoint[i].parentElement.parentElement.lastElementChild.value;
          if(opponent[j]==userIds){
            var bloodVolume = healthPoint[i].lastElementChild.value;
            var residue = bloodVolume - 6;
            if(residue>0){
              healthPoint[i].lastElementChild.setAttribute("value",residue);
            }else {
              healthPoint[i].lastElementChild.setAttribute("value",0);
            }
            if(healthPoint[i].lastElementChild.value<1){
              dieGame(userIds);
              for(var c = 0;c<elements.length;c++){
                if(elements[c].userId==userIds){
                  diePlayers.push(elements[c]);
                }
              }
              positions[i].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=墓碑.png")
            }
          }
        }
      }
      var member = document.getElementsByClassName("member");
      for(var i = 0;i<member.length;i++){
        var memberParentId = member[i].parentElement.parentElement.lastElementChild.value;
        if(memberParentId==obj.attackId){
          if(member[i].value==obj.myWeapon){
            member[i].setAttribute("value",1);
            member[i].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
            break;
          }
        }
      }
      var messageArea =document.getElementById('messageArea');
      messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.sendData+'</span></p></div>';
      messageArea.scrollTop = messageArea.scrollHeight;
      figure();
    }
    //游戏结束
    if(obj.state==15){
      var closeGame = document.getElementById("closeGame");
      var diePlayer = document.getElementById("diePlayer");
      diePlayer.style.display="none";
      closeGame.style.display="block";
      roomIdcc=obj.roomId;
    }
  }
  //获取左边我需要新增的数
  function myLeftCode(o){
    var code = parseInt(handlers);
    if(playerPosition[code].userId==myUserId){
      if(isOkJoin==0){
        var figure = o.value;
        myCode = o;
        joinCode=figure;
        o.style.border="1px solid green";
      }else {
        layer.msg("一轮只能操作一次");
      }
    }else {
      layer.msg("还没轮到你");
    }
  }
  //获取右边我需要新增的数
  function myRightCode(o){
    var code = parseInt(handlers);
    if(playerPosition[code].userId==myUserId){
      if(isOkJoin==0){
        var figure = o.value;
        myCode = o;
        joinCode=figure;
        o.style.border="3px solid red";
      }else {
        layer.msg("一轮只能操作一次");
      }
    }else {
      layer.msg("还没轮到你");
    }
  }
  //获取敌方的数
  function join(o){
    var code = parseInt(handlers);
    var heUserId = o.parentElement.parentElement.lastElementChild.value;
    if(playerPosition[code].userId==myUserId){
      if(joinCode==undefined||joinCode==null||joinCode==""){
        layer.msg("请选择你想和它相加的数字");
        return;
      }
      for(var i = 0;i<enemyPlayer.length;i++){
        if(enemyPlayer[i].userId==heUserId){
          layer.msg("不能和友方玩家组合数字");
          return;
        }
      }
      if(isOkJoin>0){
        layer.msg("一轮只能加一次");
        return;
      }
      var figure;
      figure = o.value;
      o.style.border="1px solid red";
      joinCode=parseInt(joinCode)+parseInt(figure);
      //大于9,就减去10
      if(joinCode>9){
        joinCode=joinCode-10
      }
      isOkJoin++;
      myCodeParent = myCode.parentElement;
      var myCodeChild = myCodeParent.childNodes;
      for(var i = 0;i<myCodeChild.length;i++){
        if(myCodeChild[i].nodeType === 3 && myCodeChild[i].nodeName === '#text'){
          myCodeChild[i].parentNode.removeChild(myCodeChild[i]);
        }
      }
      var isLeft = myCodeChild[2].value;
      if(joinCode<5&&joinCode>0){
        var message = {
          state:2,
          roomId:roomId,
          joinCode:joinCode,
          userId:myUserId,
          heUserId:heUserId,
          isLeft:isLeft,
          weaponImg:"子弹.png"
        };
        ws.send(JSON.stringify(message));
      }
      if(joinCode==5){
        //大于5出现提示武器选择
        if(isLeft==1){
          weaponL.style.display = "block";
          weaponL.firstElementChild.firstElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=盾牌.png");
          weaponL.firstElementChild.lastElementChild.setAttribute("value",2);
          weaponL.lastElementChild.firstElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
          weaponL.lastElementChild.lastElementChild.setAttribute("value",1);
          var message = {
            state:4,
            roomId:roomId,
            joinCode:joinCode,
            userId:myUserId,
            heUserId:heUserId,
            isLeft:isLeft,
          };
          ws.send(JSON.stringify(message));
        }
        if(isLeft==2){
          weaponR.style.display="block";
          weaponR.firstElementChild.firstElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=盾牌.png");
          weaponR.firstElementChild.lastElementChild.setAttribute("value",2);
          weaponR.lastElementChild.firstElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
          weaponR.lastElementChild.lastElementChild.setAttribute("value",1);
          var message = {
            state:4,
            roomId:roomId,
            joinCode:joinCode,
            userId:myUserId,
            heUserId:heUserId,
            isLeft:isLeft,
          };
          ws.send(JSON.stringify(message));
        }
      }
      if(joinCode==6){
        var message = {
          state:3,
          roomId:roomId,
          joinCode:joinCode,
          userId:myUserId,
          heUserId:heUserId,
          isLeft:isLeft,
          weaponImg:"复合弓.png"
        };
        ws.send(JSON.stringify(message));
      }
      if(joinCode==7){
        var message = {
          state:6,
          roomId:roomId,
          joinCode:joinCode,
          userId:myUserId,
          heUserId:heUserId,
          isLeft:isLeft,
          weaponImg:"手枪.png"
        };
        ws.send(JSON.stringify(message));
      }
      if(joinCode==8){
        var message = {
          state:7,
          roomId:roomId,
          joinCode:joinCode,
          userId:myUserId,
          heUserId:heUserId,
          isLeft:isLeft,
          weaponImg:"突击步枪.png"
        };
        ws.send(JSON.stringify(message));
      }
      if(joinCode==9){
        var message = {
          state:8,
          roomId:roomId,
          joinCode:joinCode,
          userId:myUserId,
          heUserId:heUserId,
          isLeft:isLeft,
          weaponImg:"手榴弹.png"
        };
        ws.send(JSON.stringify(message));
      }
      if(joinCode==0){
        var message = {
          state:9,
          roomId:roomId,
          joinCode:joinCode,
          userId:myUserId,
          heUserId:heUserId,
          isLeft:isLeft,
          weaponImg:"医疗瓶.png"
        };
        ws.send(JSON.stringify(message));
      }
    }else {
      layer.msg("还没轮到你");
    }
  }
  //点击左武器选择框
  function weaponLs(o){
    var weaponTypeCode = o.parentElement.lastElementChild.value;
    if(weaponTypeCode==1){
      var message = {
        state:5,
        roomId:roomId,
        userId:myUserId,
        isLeft:1,
        weaponTypeCode:weaponTypeCode,
        weaponImg:"子弹.png"
      };
      ws.send(JSON.stringify(message));
    }
    if(weaponTypeCode==2){
      var message = {
        state:5,
        roomId:roomId,
        userId:myUserId,
        isLeft:1,
        weaponTypeCode:weaponTypeCode,
        weaponImg:"盾牌.png"
      };
      ws.send(JSON.stringify(message));
    }
    o.parentElement.parentElement.style.display="none";
  }
  //点击右武器选择框
  function weaponRs(o){
    var weaponTypeCode = o.parentElement.lastElementChild.value;
    if(weaponTypeCode==1){
      var message = {
        state:5,
        roomId:roomId,
        userId:myUserId,
        isLeft:2,
        weaponTypeCode:weaponTypeCode,
        weaponImg:"子弹.png"
      };
      ws.send(JSON.stringify(message));
    }
    if(weaponTypeCode==2){
      var message = {
        state:5,
        roomId:roomId,
        userId:myUserId,
        isLeft:2,
        weaponTypeCode:weaponTypeCode,
        weaponImg:"盾牌.png"
      };
      ws.send(JSON.stringify(message));
    }
    o.parentElement.parentElement.style.display="none";
  }
  //下一个计时器出现的位置
  function nextPlay(){
    var player = document.getElementsByClassName("player");
    var code = parseInt(handlers);
    if(diePlayers.indexOf(playerPosition[code])>-1){
      handlers++;
      if(handlers>5){
        handlers=0;
      }
      nextPlay();
      return;
    }
    //获取到操作玩家的位置
    for(var i = 0;i<player.length;i++){
      if(player[i].lastElementChild.value==playerPosition[code].userId){
        var clockLocation = player[i].firstElementChild.value;
        var clock = document.getElementById("clock");
        //并且把计时器位置放在该位置
        if(clockLocation==1){
          clock.style.top = 700+"px";
          clock.style.left = 565+"px";
          clock.style.display="block";
          isOkJoin=0;
          isAttack=0;
          for(var o=0;o<enemyPlayer.length;o++){
            for(var j = 0;j<player.length;j++){
              if(enemyPlayer[o].userId==player[j].lastElementChild.value){
                player[j].style.border = "1px solid #FFB800";
              }
            }
          }
          hint();
        }
        if(clockLocation==2){
          clock.style.top = 620+"px";
          clock.style.left = 1390+"px";
          clock.style.display="block";
        }
        if(clockLocation==3){
          clock.style.top = 95+"px";
          clock.style.left = 1390+"px";
          clock.style.display="block";
        }
        if(clockLocation==4){
          clock.style.top = 95+"px";
          clock.style.left = 850+"px";
          clock.style.display="block";
        }
        if(clockLocation==5){
          clock.style.top = 90+"px";
          clock.style.left = 80+"px";
          clock.style.display="block";
        }
        if(clockLocation==6){
          clock.style.top = 600+"px";
          clock.style.left = 80+"px";
          clock.style.display="block";
        }
      }
    }
  }
  //游戏内聊天
  function roomChat(){
    var roomChat = document.getElementById("roomChat");
    if(roomChat.value==null||roomChat.value==undefined||roomChat.value==""){
      layer.msg("总得说些什么吧");
      return;
    }
    var message = {
      state:10,
      roomId:roomId,
      userId:myUserId,
      sendText:roomChat.value
    };
    ws.send(JSON.stringify(message));
    roomChat.value="";
  }
  //使用武器进行攻击
  function attacks(o){
    var weaponType = o.parentElement.firstElementChild.value;
    var judgeLR = o.parentElement.children;
    var code = parseInt(handlers);
    var bout = document.getElementById("bout").value;
    //判断是否到第三回合,判断点击的图片是否为攻击性武器
    if(playerPosition[code].userId==myUserId){
      if(weaponType>5){
        if(bout>=3){
          var player = document.getElementsByClassName("player");
          for(var i = 0;i<oppositePlayer.length;i++){
            for (var j = 0;j<player.length;j++){
              var playerId = player[j].lastElementChild.value;
              if(oppositePlayer[i].userId==playerId){
                layer.msg("请选择你要攻击的玩家");
                myWeapon=weaponType;//把武器数值赋值给全局我的攻击武器
                myWeaponLR=judgeLR[2].value;
              }
            }
          }
        }else {
          layer.msg("现在处于和平回合,不能发动攻击");
        }
      }else {
        layer.msg("抱歉这个不是攻击性武器,无法进行攻击");
      }
    }else {
      layer.msg("还没轮到你");
    }
  }
  //点击了我攻击的人
  function attackMy(o){
    var code = parseInt(handlers);
    var a = o.getAttribute("class");
    var b = a.split(" ");
    var c = document.getElementsByClassName(b[1]);
    if(playerPosition[code].userId==myUserId){
      if(isAttack==0){
        if(myWeapon>-1){
          //攻击性武器无法攻击队友,除了医疗瓶,
          if(myWeapon<=9&&myWeapon>=6){
            for(var i =0;i<enemyPlayer.length;i++){
              if(enemyPlayer[i].userId==c[0].value){
                layer.msg("该武器无法对友方使用");
                return;
              }
            }
          }
          if(myWeapon<=5){
            layer.msg("不是攻击性武器");
            return;
          }
          if(myWeaponLR==-1){
            layer.msg("请选择你的武器");
            return;
          }
          //判断如果是6,7,8等武器,需要获取另一个是否是弹药消耗品
          if(myWeapon==6||myWeapon==7||myWeapon==8){
            var member = document.getElementsByClassName("member");
            if(myWeaponLR==1){
              var RightCount = document.getElementById("player1RF").value;
              //是弹药消耗品,判断对方是否存在五
              if(RightCount>0&&RightCount<5){
                var attackedUserId = c[0].value;
                var immune =false;
                for(var i = 0;i<member.length;i++){
                  var memberParentId = member[i].parentElement.parentElement.lastElementChild.value;
                  if(memberParentId==attackedUserId){
                    if(member[i].value==5){
                      immune=true;
                      break;
                    }
                  }
                }
                var message = {
                  state:11,
                  roomId:roomId,
                  attackUserId:myUserId,//攻击玩家Id
                  attackedUserId:attackedUserId,//被攻击玩家Id
                  myWeapon:myWeapon,//使用的武器
                  consumables:RightCount,//消耗品数量
                  immune:immune//敌方存在五,免疫伤害
                };
                ws.send(JSON.stringify(message));
                isAttack++;
              }else {
                layer.msg("你没有弹药消耗品");
                return;
              }
            }
            if(myWeaponLR==2){
              var LeftCount = document.getElementById("player1LF").value;
              var attackedUserId = c[0].value;
              //是弹药消耗品,判断对方是否存在五
              if(LeftCount>0&&LeftCount<5){
                var immune =false;
                for(var i = 0;i<member.length;i++){
                  var memberParentId = member[i].parentElement.parentElement.lastElementChild.value;
                  if(memberParentId==attackedUserId){
                    if(member[i].value==5){
                      immune=true;
                      break;
                    }
                  }
                }
                var message = {
                  state:11,
                  roomId:roomId,
                  attackUserId:myUserId,//攻击玩家Id
                  attackedUserId:attackedUserId,//被攻击玩家Id
                  myWeapon:myWeapon,//使用的武器
                  consumables:LeftCount,//消耗品数量
                  immune:immune//敌方存在五,免疫伤害
                };
                ws.send(JSON.stringify(message));
                isAttack++;
              }else {
                layer.msg("你没有弹药消耗品");
                return;
              }
            }
          }
          //判断如果是9,0
          if(myWeapon==9||myWeapon==0){
            var oppositePlayers = [];
            for(var i =0;i<oppositePlayer.length;i++){
              oppositePlayers.push(oppositePlayer[i].userId);
            }
            if(myWeapon==9){
              var message = {
                state:12,
                roomId:roomId,
                attackUserId:myUserId,//攻击玩家Id
                myWeapon:myWeapon,//使用的武器
                opposite:oppositePlayers
              };
              ws.send(JSON.stringify(message));
              isAttack++;
            }
            if(myWeapon==0){

            }
          }
        }else {
          layer.msg("你还没选择你的武器");
        }
      }else {
        layer.msg("一轮只能操作一次");
      }
    }else {
      layer.msg("还没轮到你");
    }
  }
  //轮到我的提示
  function hint(){
    var hint = document.getElementById("hint");
    hint.style.display="block";
    setTimeout(function (){
      hint.style.display="none";
    },2500);
  }
  function bruise(obj){
    var member = document.getElementsByClassName("member");
    //我方武器损耗
    for(var i = 0;i<member.length;i++){
      var memberParentId = member[i].parentElement.parentElement.lastElementChild.value;
      if(memberParentId==obj.attackUserId){
        if(member[i].value==obj.myWeapon){
          member[i].setAttribute("value",1);
          member[i].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
          break;
        }
      }
    }
    //敌方生命值损耗
    var healthPoint = document.getElementsByClassName("healthPoint");
    var positions = document.getElementsByClassName("positions");
    for(var i = 0;i<healthPoint.length;i++){
      var healthPointParentId = healthPoint[i].parentElement.parentElement.lastElementChild.value;
      if(healthPointParentId==obj.attackedUserId){
        var bloodVolume = healthPoint[i].lastElementChild.value;
        var residue = bloodVolume - obj.consumables;
        if(residue>0){
          healthPoint[i].lastElementChild.setAttribute("value",residue);
        }else {
          healthPoint[i].lastElementChild.setAttribute("value",0);
        }
        if(healthPoint[i].lastElementChild.value<1){

          dieGame(healthPointParentId);
          for(var c = 0;c<elements.length;c++){
            if(elements[c].userId==healthPointParentId){
              diePlayers.push(elements[c]);
              break;
            }
          }
          positions[i].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=墓碑.png");
        }
        break;
      }
    }
  }
  function dieGame(o){
    var member = document.getElementsByClassName("member");
    //将死亡玩家两个数字和弹出层弹出
    if(o==myUserId){
      var diePlayerPage = document.getElementById("diePlayer");
      for(var c= 0;c<member.length;c++){
        var memberParentId = member[c].parentElement.parentElement.lastElementChild.value;
        if(memberParentId==o){
          member[c].setAttribute("value",0);
        }
      }
      var positions = document.getElementsByClassName("positions");
      for (var i = 0;i<positions.length;i++){
        positions[0].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=墓碑.png");
      }
      diePlayerPage.style.display = "block";
    }else {
      for(var c= 0;c<member.length;c++){
        var memberParentId = member[c].parentElement.parentElement.lastElementChild.value;
        if(memberParentId==o){
          member[c].setAttribute("value",0);
        }
      }
    }
  }
  function shield(obj){
    var member = document.getElementsByClassName("member");
    //计算敌方护盾损耗
    for(var i = 0;i<member.length;i++){
      var memberParentId = member[i].parentElement.parentElement.lastElementChild.value;
      if(memberParentId==obj.attackedUserId){
        if(member[i].value==5){
          member[i].setAttribute("value",1);
          member[i].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
          break;
        }
      }
    }
    //计算我方武器损耗
    for(var i = 0;i<member.length;i++){
      var memberParentId = member[i].parentElement.parentElement.lastElementChild.value;
      if(memberParentId==obj.attackUserId){
        if(member[i].value==obj.myWeapon){
          member[i].setAttribute("value",1);
          member[i].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=子弹.png");
          break;
        }
      }
    }
  }
  function sendDataMe(obj){
    var messageArea =document.getElementById('messageArea');
    messageArea.innerHTML+='<div class="sysMessage"><p>[系统提示]: <span>'+obj.sendText+'</span></p></div>';
    messageArea.scrollTop = messageArea.scrollHeight;
  }
  function figure(){
    var healthPoint = document.getElementsByClassName("healthPoint");
    var positions = document.getElementsByClassName("positions");
    setTimeout(function (){
      for(var i =0;i<explode.length;i++){
        if(healthPoint[explode[i]].lastElementChild.value==0){
          positions[explode[i]].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=墓碑.png");
        }else if(healthPoint[explode[i]].lastElementChild.value>0){
          positions[explode[i]].parentElement.lastElementChild.setAttribute("src","${ctx}/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
        }
      }
    },1500);
  }
  function closeGame(){
    $.post("${ctx}/game?method=closeGame",{
      roomId:roomIdcc
    },function (json){
      if(json.state){
        window.location.replace("${ctx}/home?method=index");
      }
    });
  }
</script>
</body>
</html>
