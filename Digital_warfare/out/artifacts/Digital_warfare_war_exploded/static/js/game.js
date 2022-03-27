// JavaScript Document
var begin = document.getElementById("begin");//测试按钮
var objectMove = document.getElementById("objectMove");//中央战场移动物体
var memberOne = document.getElementById("memberOne");//玩家1
var memberToo = document.getElementById("memberToo");//玩家2
var memberThree = document.getElementById("memberThree");//玩家3
var memberFour = document.getElementById("memberFour");//玩家4
var memberFive = document.getElementById("memberFive");//玩家5
var memberSix = document.getElementById("memberSix");//玩家6
var weaponL = document.getElementById("weaponL");//左武器选择提示框
var weaponR =document.getElementById("weaponR");//右武器选择提示框

//玩家1攻击玩家2的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function OneFightToo(Img,weaponType){
    memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=枪械攻击时使用的人物.png")
    //获取初始值
    var nowTop = memberOne.offsetTop-10;
    var nowLeft = memberOne.offsetLeft+50;
    //获取结束值
    var maxheigth = memberToo.offsetTop+20;
    var maxWidth = memberToo.offsetLeft-15;
    //移动动画得初始值,等于攻击方的top加10;
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -0.5;
    var sheepX = 3;
    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家2攻击玩家1的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function TooFightOne(Img,weaponType){
    //获取初始值
    var nowTop = memberToo.offsetTop+10;
    var nowLeft = memberToo.offsetLeft-20;
    //获取结束值
    var maxheigth = memberOne.offsetTop-30;
    var maxWidth = memberOne.offsetLeft+55;
    //移动动画得初始值,等于攻击方的top加10;
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +0.5;
    var sheepX = -3;
    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家1攻击玩家3的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function OneFightThree(Img,weaponType){
    //获取初始值
    var nowTop = memberOne.offsetTop-10;
    var nowLeft = memberOne.offsetLeft+50;
    //获取结束值
    var maxheigth = memberThree.offsetTop+60;
    var maxWidth = memberThree.offsetLeft-15;
    //移动动画得初始值,等于攻击方的top加10;
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -1.5;
    var sheepX = +3;
    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家3攻击玩家1的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function ThreeFightOne(Img,weaponType){
    //获取初始值
    var nowTop = memberThree.offsetTop+60;
    var nowLeft = memberThree.offsetLeft-15;
    //获取结束值
    var maxheigth = memberOne.offsetTop-10;
    var maxWidth = memberOne.offsetLeft+50;
    //移动动画得初始值,等于攻击方的top加10;
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +1.5;
    var sheepX = -3;
    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家1攻击玩家4的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function OneFightFour(Img,weaponType){
    var nowTop = memberOne.offsetTop;
    var nowLeft = memberOne.offsetLeft+20;
    //移动动画得初始值,等于攻击方的top加10;
    var objectTop = nowTop-15;
    objectMove.style.top = objectTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    var maxheigth = memberFour.offsetTop+70;//计算终点
    var sheepY = -3;

    var varls = window.setInterval(function(){

        nowTop += sheepY
        if (nowTop < maxheigth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
    },1);
}
//玩家4攻击玩家1的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function FourFightOne(Img,weaponType){
    var nowTop = memberFour.offsetTop+60;
    var nowLeft = memberFour.offsetLeft+20;
    //移动动画得初始值,等于攻击方的top加10;
    var objectTop = nowTop;
    objectMove.style.top = objectTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    var maxheigth = memberOne.offsetTop-10;//计算终点
    var sheepY =3;

    var varls = window.setInterval(function(){

        nowTop += sheepY
        if (nowTop > maxheigth) {
            clearInterval(varls);
            if(weaponType==2){
                memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
    },1);
}
//玩家1攻击玩家5的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function OneFightFive(Img,weaponType){
    //初始值
    var nowTop = memberOne.offsetTop-15;
    var nowLeft = memberOne.offsetLeft-15;
    //结束值
    var maxheigth = memberFive.offsetTop+30;
    var maxWidth = memberFive.offsetLeft+50;

    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -1.8;
    var sheepX = -3;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家5攻击玩家1的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function FiveFightOne(Img,weaponType){
    //初始值
    var nowTop = memberFive.offsetTop+30;
    var nowLeft = memberFive.offsetLeft+50;
    //结束值
    var maxheigth = memberOne.offsetTop-15;
    var maxWidth = memberOne.offsetLeft-15;

    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +1.8;
    var sheepX = +3;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家1攻击玩家6的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function OneFightSix(Img,weaponType){
    //初始值
    var nowTop = memberOne.offsetTop-15;
    var nowLeft = memberOne.offsetLeft-15;
    //结束值
    var maxheigth = memberSix.offsetTop+30;
    var maxWidth = memberSix.offsetLeft+50;

    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -0.4;
    var sheepX = -3;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家6攻击玩家1的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function SixFightOne(Img,weaponType){
    //初始值
    var nowTop = memberSix.offsetTop+30;
    var nowLeft = memberSix.offsetLeft+50;
    //结束值
    var maxheigth = memberOne.offsetTop-15;
    var maxWidth = memberOne.offsetLeft-15;

    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +0.4;
    var sheepX = +3;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberOne.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家2攻击玩家3的函数动画,移动动画url和武器参数,弓箭,子弹,医疗瓶,手榴弹,龟派气功,等的移动速度不一样
function TooFightThree(Img,weaponType){
    //初始值
    var nowTop = memberToo.offsetTop+30;
    var nowLeft = memberToo.offsetLeft-10;
    //结束值
    var maxheigth = memberThree.offsetTop+30;
    var maxWidth = memberThree.offsetLeft-10;

    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    var sheepY = -2;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        if (nowTop < maxheigth) {
            clearInterval(varls);
            if(weaponType==2){
                memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
    },1);
}
//玩家3攻击玩家2
function ThreeFightToo(Img,weaponType){
    //初始值
    var nowTop = memberThree.offsetTop+30;
    var nowLeft = memberThree.offsetLeft-10;
    //结束值
    var maxheigth = memberToo.offsetTop+30;
    var maxWidth = memberToo.offsetLeft-10;

    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    var sheepY = +2;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        if (nowTop > maxheigth) {
            clearInterval(varls);
            if(weaponType==2){
                memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
    },1);
}
//玩家2攻击玩家4
function TooFightFour(Img,weaponType){
    //初始值
    var nowTop = memberToo.offsetTop+30;
    var nowLeft = memberToo.offsetLeft-10;
    //结束值
    var maxheigth = memberFour.offsetTop+60;
    var maxWidth = memberFour.offsetLeft+20;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -1.5;
    var sheepX = -3;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家4攻击玩家2
function FourFightToo(Img,weaponType){
    //初始值
    var nowTop = memberFour.offsetTop+60;
    var nowLeft = memberFour.offsetLeft+20;
    //结束值
    var maxheigth = memberToo.offsetTop+30;
    var maxWidth = memberToo.offsetLeft-10;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +1.5;
    var sheepX = +3;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家2攻击玩家5
function TooFightFive(Img,weaponType){
    //初始值
    var nowTop = memberToo.offsetTop+30;
    var nowLeft = memberToo.offsetLeft-10;
    //结束值
    var maxheigth = memberFive.offsetTop+50;
    var maxWidth = memberFive.offsetLeft+50;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -1.1;
    var sheepX = -5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家5攻击玩家2
function FiveFightToo(Img,weaponType){
    //初始值
    var nowTop = memberFive.offsetTop+40;
    var nowLeft = memberFive.offsetLeft+50;
    //结束值
    var maxheigth = memberToo.offsetTop+30;
    var maxWidth = memberToo.offsetLeft-10;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +1;
    var sheepX =+5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家2攻击玩家6
function TooFightSix(Img,weaponType){
    //初始值
    var nowTop = memberToo.offsetTop+30;
    var nowLeft = memberToo.offsetLeft-10;
    //结束值
    var maxheigth = memberSix.offsetTop+30;
    var maxWidth = memberSix.offsetLeft+50;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    var sheepX = -5;

    var varls = window.setInterval(function(){
        nowLeft+=sheepX
        if (nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家6攻击玩家2
function SixFightToo(Img,weaponType){
    //初始值
    var nowTop = memberSix.offsetTop+30;
    var nowLeft = memberSix.offsetLeft+50;
    //结束值
    var maxheigth = memberToo.offsetTop+30;
    var maxWidth = memberToo.offsetLeft-10;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    var sheepX = +5;

    var varls = window.setInterval(function(){
        nowLeft+=sheepX
        if (nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberToo.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家3攻击玩家4
function ThreeFightFour(Img,weaponType){
    //初始值
    var nowTop = memberThree.offsetTop+30;
    var nowLeft = memberThree.offsetLeft-10;
    //结束值
    var maxheigth = memberFour.offsetTop+60;
    var maxWidth = memberFour.offsetLeft+20;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -0.45;
    var sheepX = -5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);

}
//玩家4攻击玩家3
function FourFightThree(Img,weaponType){
    //初始值
    var nowTop = memberFour.offsetTop+60;
    var nowLeft = memberFour.offsetLeft+20;
    //结束值
    var maxheigth = memberThree.offsetTop+30;
    var maxWidth = memberThree.offsetLeft-10;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +0.45;
    var sheepX = +5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);

}
//玩家3攻击玩家5
function ThreeFightFive(Img,weaponType){
    //初始值
    var nowTop = memberThree.offsetTop+30;
    var nowLeft = memberThree.offsetLeft-10;
    //结束值
    var maxheigth = memberFive.offsetTop+30;
    var maxWidth = memberFive.offsetLeft+40;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepX =-5;

    var varls = window.setInterval(function(){
        nowLeft+=sheepX
        if (nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家5攻击玩家3
function FiveFightThree (Img,weaponType){
    //初始值
    var nowTop = memberFive.offsetTop+30;
    var nowLeft = memberFive.offsetLeft+50;
    //结束值
    var maxheigth = memberThree.offsetTop+30;
    var maxWidth = memberThree.offsetLeft-10;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepX = +5;

    var varls = window.setInterval(function(){
        nowLeft+=sheepX
        if (nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家3攻击玩家6
function ThreeFightSix(Img,weaponType){
    //初始值
    var nowTop = memberThree.offsetTop+30;
    var nowLeft = memberThree.offsetLeft-20;
    //结束值
    var maxheigth = memberSix.offsetTop+30;
    var maxWidth = memberSix.offsetLeft+50;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +1.1;
    var sheepX = -5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家6攻击玩家3
function SixFightTree(Img,weaponType){
    //初始值
    var nowTop = memberSix.offsetTop+30;
    var nowLeft = memberSix.offsetLeft+50;
    //结束值
    var maxheigth = memberThree.offsetTop+30;
    var maxWidth = memberThree.offsetLeft-20;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -1.1;
    var sheepX = +5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberThree.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家4攻击玩家5
function FourFightFive(Img,weaponType){
    //初始值
    var nowTop = memberFour.offsetTop+60;
    var nowLeft = memberFour.offsetLeft+20;
    //结束值
    var maxheigth = memberFive.offsetTop+30;
    var maxWidth = memberFive.offsetLeft+50;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +0.5;
    var sheepX = -5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家5攻击玩家4
function FiveFightFour(Img,weaponType){
    //初始值
    var nowTop = memberFive.offsetTop+30;
    var nowLeft = memberFive.offsetLeft+50;
    //结束值
    var maxheigth = memberFour.offsetTop+60;
    var maxWidth = memberFour.offsetLeft+20;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -0.5;
    var sheepX = +5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家4攻击玩家6
function FourFithSix(Img,weaponType){
    //初始值
    var nowTop = memberFour.offsetTop+60;
    var nowLeft = memberFour.offsetLeft+20;
    //结束值
    var maxheigth = memberSix.offsetTop+20;
    var maxWidth = memberSix.offsetLeft+50;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +2.5;
    var sheepX = -5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop > maxheigth&&nowLeft<maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家6攻击玩家4
function SixFightFour(Img,weaponType){
    //初始值
    var nowTop = memberSix.offsetTop+20;
    var nowLeft = memberSix.offsetLeft+50;
    //结束值
    var maxheigth = memberFour.offsetTop+60;
    var maxWidth = memberFour.offsetLeft+20;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = -2.5;
    var sheepX = +5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        nowLeft+=sheepX
        if (nowTop < maxheigth&&nowLeft>maxWidth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFour.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
        objectMove.style.left = nowLeft+"px";
    },1);
}
//玩家5攻击玩家6
function FiveFightSix(Img,weaponType){
    //初始值
    var nowTop = memberFive.offsetTop+20;
    var nowLeft = memberFive.offsetLeft+60;
    //结束值
    var maxheigth = memberSix.offsetTop+20;
    var maxWidth = memberSix.offsetLeft+60;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY = +2.5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        if (nowTop > maxheigth) {
            clearInterval(varls);
            if(weaponType==2){
                memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberSix.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
    },1);
}
//玩家6攻击玩家5
function SixFightFive(Img,weaponType){
    //初始值
    var nowTop = memberSix.offsetTop+20;
    var nowLeft = memberSix.offsetLeft+60;
    //结束值
    var maxheigth = memberFive.offsetTop+20;
    var maxWidth = memberFive.offsetLeft+60;
    //
    objectMove.style.top = nowTop+"px";
    objectMove.style.left = nowLeft+"px";
    objectMove.style.display="block";
    objectMove.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName="+Img);
    //设置动画飞行速度
    var sheepY=-2.5;

    var varls = window.setInterval(function(){
        nowTop += sheepY
        if (nowTop < maxheigth) {
            clearInterval(varls);
            if(weaponType==2){
                memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=被攻击时护盾保护.png");
                setTimeout(function (){
                    memberFive.firstElementChild.setAttribute("src","/Digital_warfare/FileIo?method=getPortraitImage&imgName=中央战场人物.png");
                },1000);
            }
            objectMove.style.display="none";
        }
        objectMove.style.top = nowTop + "px";
    },1);
}

