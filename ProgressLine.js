/*
Author:王基书
Address:www.loveffc.cn
Earliest Date:2021/3/15
Lastest Date:2021/3/15
Aim:在页面最上方显示浏览进度条
*/
function getClientHeight(){
    var clientHeight=0;
    if(document.body.clientHeight&&document.documentElement.clientHeight){
        var clientHeight=(document.body.clientHeight<document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
    }else{
        var clientHeight=(document.body.clientHeight>document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
    }
    return clientHeight;
}
function getScrollHeight(){
    return Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);
}
function getScrollTop(){
    var scrollTop=0;
    if(document.documentElement&&document.documentElement.scrollTop){
        scrollTop=document.documentElement.scrollTop;
    }else if(document.body){
        scrollTop=document.body.scrollTop;
    }
    return scrollTop;
}
window.onscroll=function(){
    var height=getClientHeight();//滚动条长度
    var theight=getScrollTop();// 窗口滚动条高度
    var rheight=getScrollHeight(); // 窗口可视范围的高度
    var percent = (theight / (rheight - height)) * 100;
    var Line = document.getElementById("Line");

    if(theight == 0)
    {
        Line.style.background = "#F5F5F5";
        Line.style.width = "100%";
    }
    else{
        Line.style.background = "#66CD00";
        Line.style.width = percent + '%';
    }
}