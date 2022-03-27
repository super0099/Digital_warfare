<%--
  Created by IntelliJ IDEA.
  User: super007
  Date: 2021/5/30
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!--需要引入jstl-1.2.jar包-->
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/><!--需要引入jstl-1.2.jar包-->
<html>
<head>
    <title>数字战争登录</title>
    <link rel="icon" href="${ctx}/static/img/网页图标.jpg">
    <link rel="stylesheet" href="${ctx}/static/css/login.css">
</head>
<body>
    <div class="login-body" id="loginGG">
        <div class="login fl" id="login">
            <div class="dateTime" id="loginDateTime"></div>
            <input type="text" value="1" id="styleId" hidden>
            <div class="loginL" id="loginL">
                <form action="">
                    <div class="loginUserName">
                        <input type="text" id="loginUserName" placeholder="请输入账号" autocomplete="off">
                    </div>
                    <div class="loginPassword">
                        <input type="password" id="loginPassword" placeholder="请输入密码">
                    </div>
                    <input type="reset" id="loginReset" hidden>
                </form>
            </div>
            <div class="registerL" style="display: none;" id="registerL">
                <form action="">
                    <div class="loginUserName">
                        <input type="text" id="registerUserName" placeholder="请输入账号" autocomplete="off">
                    </div>
                    <div class="loginPassword">
                        <input type="password" id="registerPassword" placeholder="请输入密码">
                    </div>
                    <div class="loginPhone">
                        <input type="text" id="registerPhone" placeholder="请输入手机号" autocomplete="off">
                    </div>
                    <input type="reset" id="registerReset" hidden>
                </form>
            </div>
            <div class="loginButton">
                <span style="top: -12px;left: 125px;" onclick="char()"><</span>
                <button type="button" id="Logins" onclick="login()">Login</button>
                <button type="button" style="display: none;" id="Register" onclick="Register()">Register</button>
                <span style="top: -12px;right: 125px;" onclick="char()">></span>
            </div>
        </div>
    </div>
    <div class="popups" id="popups" style="display: none;">
        <p>请完善您的基本信息</p>
        <img src="" alt="上传头像" ondblclick="openFile()" id="userPortrait"><br>
        <input type="file" hidden onchange="alter()" id="imgFile">
        <input type="text" id="nickName" placeholder="输入昵称"><br>
        <button type="button" id="submit" onclick="submit()">提交</button>
    </div>
<script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
<script src="${ctx}/static/js/login.js"></script>
<script>
function login(){
    var loginUserName= $("#loginUserName").val();
    var loginPassword = $("#loginPassword").val();
    if(loginUserName==null||loginUserName==undefined||loginUserName==""){
        layer.msg("请输入账号");
        return;
    }
    if(loginPassword==null||loginPassword==""||loginPassword==undefined){
        layer.msg("请输入密码");
        return;
    }
    $.post("${ctx}/login?method=login",{loginUserName:loginUserName,loginPassword:loginPassword},function (jsonMsg){
        if(jsonMsg.state){
            var data = jsonMsg.data;
            $.post("${ctx}/login?method=selectData",{Id:data.userName},function (msg){
                if(msg.state){
                    window.location.replace("${ctx}/home?method=index");
                }else {
                    document.getElementById("loginGG").style.display="none";
                    document.getElementById("popups").style.display="block";
                }
            })
        }else {
            layer.msg(jsonMsg.msg);
        }
    });
}
function Register(){
    var userPassword = /^[a-zA-Z]\w{5,17}$/;
    var userName = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;
    var phone = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
    var registerUserName= $("#registerUserName").val();
    var registerPassword = $("#registerPassword").val();
    var registerPhone = $("#registerPhone").val();
    if(!userName.test(registerUserName)){
        layer.msg("账号必须以字母开头并且和数字组合")
        return;
    }
    if(!userPassword.test(registerPassword)){
        layer.msg("密码必须以字母开头并且和数字组合,不能有特殊符号")
        return;
    }
    if(!phone.test(registerPhone)){
        layer.msg("手机号不存在")
        return;
    }
    var layerIndex = layer.load();
    $.post("${ctx}/login?method=Register",{registerUserName:registerUserName,registerPassword:registerPassword,registerPhone:registerPhone}
    ,function (jsonMsg){
        layer.close(layerIndex);
        if(jsonMsg.state){
            layer.msg(jsonMsg.msg);
            document.getElementById("registerL").style.display="none";
            document.getElementById("loginL").style.display="block";
            document.getElementById("Register").style.display="none";
            document.getElementById("Logins").style.display="block";
            document.getElementById("loginUserName").setAttribute("value",registerUserName);
            document.getElementById("styleId").setAttribute("value",1);
            document.getElementById("registerReset").click();
        }else {
            layer.msg(jsonMsg.msg);
        }
    });
}
function submit(){
    var formData = new FormData();
    var file = $("#imgFile").get(0).files[0];
    var name = $("#nickName").val();
    if(file==null||file==undefined||file==""){
        layer.msg("头像不能为空");
        return;
    }
    if(name==null||name==undefined||name==""){
        layer.msg("昵称不能为空");
        return;
    }
    formData.append("portrait",file);
    formData.append("nickname",name);
    var xhm = null;
    if (window.XMLHttpRequest) {
        xhm = new XMLHttpRequest();
    } else {
        xhm = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var layerIndex = layer.load();
    xhm.open("post", "${ctx}/FileIo?method=modification");
    xhm.send(formData);
    xhm.onreadystatechange = function (jsonMsg) {
        layer.close(layerIndex);
        if (xhm.readyState == 4 && xhm.status == 200) {
            var obj = JSON.parse(jsonMsg.currentTarget.responseText);
            if(obj.state){
                window.location.replace("${ctx}/home?method=index");
            }else {
                layer.msg(obj.msg);
            }
        }
    }
}
</script>
</body>
</html>
