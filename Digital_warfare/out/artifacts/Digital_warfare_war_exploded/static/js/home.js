
var friend = document.getElementById("friend");
var headline = document.getElementsByClassName("headline");
function pack(){
    friend.style.display="none";
}
function openS(){
    friend.style.display="block";
}
function changeStyle(o){
    var BodyFl = document.getElementById("BodyFl");
    var ChatDiv = document.getElementById("ChatDiv");
    var identifying = document.getElementById("identifying");
    for (var i =0;i<headline.length;i++){
        headline[i].style.backgroundImage="";
    }
    o.style.backgroundImage="linear-gradient(to bottom,rgba(0,0,0,0.5), rgba(0,0,1,0.3),white)";
    var code = o.firstElementChild.value;
    if(code==1){
        for (var i = BodyFl.children.length - 1; i >= 0; i--) {
            BodyFl.removeChild(BodyFl.children[i]);
        }
        for (var i = ChatDiv.children.length - 1; i >= 0; i--) {
            ChatDiv.removeChild(ChatDiv.children[i]);
        }
        identifying.setAttribute("value",1);
        systemData();
    }
    if(code==2){
        for (var i = BodyFl.children.length - 1; i >= 0; i--) {
            BodyFl.removeChild(BodyFl.children[i]);
        }
        for (var i = ChatDiv.children.length - 1; i >= 0; i--) {
            ChatDiv.removeChild(ChatDiv.children[i]);
        }
        identifying.setAttribute("value",2);
        selectFriend();
    }
    if(code==3){
        for (var i = BodyFl.children.length - 1; i >= 0; i--) {
            BodyFl.removeChild(BodyFl.children[i]);
        }
        for (var i = ChatDiv.children.length - 1; i >= 0; i--) {
            ChatDiv.removeChild(ChatDiv.children[i]);
        }
        identifying.setAttribute("value",3);
        synthesize();
    }

}
function openSystem(k){
    k.style.border="3px solid #eb7350";
    k.firstElementChild.checked="checked";
    var message = {
        state:2,
        sendDate:new Date(),
        nickName:'机器人小a',
        sendText:'您好我是客服小a,请问我有什么可以帮到您?'+'\n'+'1.回复:"玩法"获取最全攻略'+'\n'+'2.回复:"开发"获得开发的团队信息'+'\n'+'3.回复:"新手礼包"获得萌新特宠',
        portrait:'System.jpg',
        recipient:loginUserId
    };
    ws.send(JSON.stringify(message));
}
//打开世界窗口
function openWorld(k){
    var friendData = document.getElementsByClassName("friendData");
    for(var i = 0;i<friendData.length;i++){
        friendData[i].style.border ="none";
    }
    k.style.border="3px solid #eb7350";
    k.firstElementChild.checked="checked";
}
function Dt(o){
    var dt = new Date(o);
    return dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate() + " " +
        dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
}