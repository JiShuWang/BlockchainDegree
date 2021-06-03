/*
Author:王基书
Address:www.loveffc.cn
Earliest Date:2021/4/13
Lastest Date:2021/4/13
Aim:对显示/关闭效果进行实现
*/
function AboutDisplay(divid,iid) {
    var div = document.getElementById(divid);
    var i = document.getElementById(iid);
    if(i.className=="fa fa-lock")
    {
        i.className = "fa fa-unlock";
        div.style.display = "block";
    }
    else if(i.className=="fa fa-unlock")
    {
        i.className = "fa fa-lock";
        div.style.display = "none";
    }
}