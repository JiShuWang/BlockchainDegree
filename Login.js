var CurrentClass = "fa fa-check";//font-awesome中对应√标志的类名
var CurrentColor = "deepskyblue";
var MistakeClass = "fa fa-close";//font-awesome中对应×标志的类名
var MistakeColor = "orange";
var Judge = new Array(2);//判定每个模块是否符合表单要求
for(let i=0;i<3;i++)
{
    Judge[i] = false;//初始化
}
//表单提示信息更新
function TipsUpdate(tipsid,text,judge) {
    document.getElementById(tipsid).innerText = text;
    if(judge == true)//输入正确的提示
    {
        document.getElementById(tipsid).className = CurrentClass;
        document.getElementById(tipsid).style.color = CurrentColor;
    }
    else//输入错误的提示
    {
        document.getElementById(tipsid).className = MistakeClass;
        document.getElementById(tipsid).style.color = MistakeColor;
    }
}
//对账号进行检查
function UsernameCheck() {
    Username = document.getElementById("Username");
    Username = Username.value;
    if(Username.length==0)
    {
        TipsUpdate("UsernameTips","账号为空，请重新输入",false);
        Judge[0] = false;
    }
    else if(Username.length<=10 && Username.length>=8)
    {
        TipsUpdate("UsernameTips","",true);
        Judge[0] = true;
    }
    else
    {
        TipsUpdate("UsernameTips","账号长度不符合规定，请重新输入",false);
        Judge[0] = false;
    }
}
//对密码进行检查
function PasswordCheck() {
    Password = document.getElementById("Password");
    Password = Password.value;
    if(Password.length==0)
    {
        TipsUpdate("PasswordTips","密码为空，请重新输入",false);
        Judge[1] = false;
    }
    else if(Password.length<=20 && Password.length>=8)
    {
        TipsUpdate("PasswordTips","",true);
        Judge[1] = true;
    }
    else
    {
        TipsUpdate("PasswordTips","密码长度不符合规定，请重新输入",false);
        Judge[1] = false;
    }
}
//对验证码进行检查
function VeriCheck(){
    Verification = document.getElementById("Verification");
    if (Verification.value == TrueValue)
    {
        TipsUpdate("VerificationTips","",true);
        Judge[2] = true;
    }
    else
    {
        TipsUpdate("VerificationTips","验证码不正确，请检查后重新输入",false);
        Judge[2] = false;
    }
}
//对整个表单进行检查
function FormCheck() {
    UsernameCheck();
    PasswordCheck();
    VeriCheck();
    for(let i=0;i<3;i++)
    {
        if(!Judge[i])
        {
            alert("注册信息中存在未正确填写部分，请检查后重新填写！");
            return false;
        }
    }
}
