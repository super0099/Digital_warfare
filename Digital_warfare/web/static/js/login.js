$(function (){
    var loginDateTime = document.getElementById("loginDateTime");
    setInterval(function (){
        var date = new Date();
        loginDateTime.innerHTML = '<span>'+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds()+'</span><br><p>'+(date.getMonth() + 1)+'-'+date.getDate()+'</p>';
    },1000);
})
function char(){
    var styleId = document.getElementById("styleId");
    var registerL = document.getElementById("registerL");
    var loginL =document.getElementById("loginL");
    var Register = document.getElementById('Register');
    var Logins = document.getElementById("Logins");
    var val = styleId.value;
    console.log(val++);
    if(val%2==1){
        loginL.style.display="block";
        Logins.style.display="block";
        registerL.style.display="none";
        Register.style.display="none";
    }
    if(val%2==0){
        loginL.style.display="none";
        Logins.style.display="none";
        registerL.style.display="block";
        Register.style.display="block";
    }
    styleId.setAttribute("value",val++);
}
//---------------图片上传
regexImageFilter = /^(?:image\/bmp|image\/gif|image\/jpg|image\/jpeg|image\/png)$/i;
var imgReader = new FileReader();
function openFile(){
    var imgFile = $("#imgFile");
    imgFile.click();
}
function alter(){
    var imgfFile = document.getElementById("imgFile").files[0];
    if (regexImageFilter.test(imgfFile.type)) {
        imgReader.readAsDataURL(imgfFile);
    } else {
        alert("选择的不是一个有效的图片文件");
    }
}
imgReader.onload = function (evt) {
    document.getElementById("userPortrait").setAttribute("src", evt.target.result);

}