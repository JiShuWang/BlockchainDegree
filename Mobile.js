/*
Author:王基书
Address:www.loveffc.cn
Earliest Date:2021/3/16
Lastest Date:2021/3/18
Aim:实现移动端的特别操作，例如移动端导航
*/
var MobileMenuClick = 0;
//在移动端通过点击来显示/关闭导航栏
function MobileNavigator() {
    var PublicHeader = document.getElementById("Public-Header");
    var MenuMobile = document.getElementById("Menu-Mobile");
    if(MobileMenuClick%2==0)//显示导航栏
    {
        PublicHeader.style.display = "block";
        MobileMenuClick += 1;
        MenuMobile.style.left = "50%";
    }
    else//关闭导航栏
    {
        PublicHeader.style.display = "none";
        MobileMenuClick += 1;
        MenuMobile.style.left = "30px";
    }
}
var UserManageClick = 0;
//在移动端通过点击来显示/关闭二级菜单
function UserNavigator() {
    var UserManage = document.getElementById("UserManage");
    if(UserManageClick%2==0)//显示二级菜单
    {
        UserManage.style.display = "block";
        UserManageClick += 1;
    }
    else //关闭二级菜单
    {
        UserManage.style.display = "none";
        UserManageClick += 1;
    }
}
//在移动端显示区块的数据
function BlockData(parameter) {
    var Timer = "";
    var Parameter = document.getElementById(parameter);
    clearInterval(Timer);
    if(document.documentElement.clientWidth<1200)
    {
        if(parameter.indexOf("Block")!=-1)
        {
            Parameter.innerText = "区块号表示该学位证书所存储的位置。";
            setInterval(function () {
                Parameter.innerText = "";
            },5000);
        }
        else if(parameter.indexOf("Hash")!=-1)
        {
            Parameter.innerText = "该学位证书所对应的哈希值，该值是唯一的，因此可用于核验证书真伪。";
            setInterval(function () {
                Parameter.innerText = "";
            },5000);
        }
    }
}