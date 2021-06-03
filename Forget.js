var CurrentClass = "fa fa-check";//font-awesome中对应√标志的类名
var CurrentColor = "deepskyblue";
var CurrentAlign = "center";
var MistakeClass = "fa fa-close";//font-awesome中对应×标志的类名
var MistakeColor = "orange";
var MistakeAlign = "center";
var Judge = new Array(7);//判定每个模块是否符合表单要求
for(let i=0;i<6;i++)
{
    Judge[i] = false;//初始化
}
//表单提示信息更新
function TipsUpdate(tipsid,text,judge) {
    document.getElementById(tipsid).innerText = text;
    if(judge == true)//输入正确的提示
    {
        document.getElementById(tipsid).className = CurrentClass;
        document.getElementById(tipsid).style.textAlign = CurrentAlign;
        document.getElementById(tipsid).style.color = CurrentColor;
    }
    else//输入错误的提示
    {
        document.getElementById(tipsid).className = MistakeClass;
        document.getElementById(tipsid).style.textAlign = MistakeAlign;
        document.getElementById(tipsid).style.color = MistakeColor;
    }
}
//检查用户名的长度
function UsernameCheck() {
    var Username = document.getElementById("Username");
    Username = Username.value;
    if(Username.length>=8 && Username.length<=10)
    {
        TipsUpdate("UsernameTips","",true);
        Judge[0] = true;
    }
    else
    {
        TipsUpdate("UsernameTips","长度8-10位，建议由数字、字母、特殊字符共同组成。",false);
        Judge[0] = false;
    }
}
//检查手机号长度及正确性
function PhoneNumberLengthCheck() {
    var PhoneNumber = document.getElementById("PhoneNumber");
    PhoneNumber = PhoneNumber.value;
    if(PhoneNumber.length==11)
    {
        TipsUpdate("PhoneNumberTips","",true);
        Judge[1] = true;
    }
    else
    {
        TipsUpdate("PhoneNumberTips","手机号长度不为11位，请检查后重新输入",false);
        Judge[1] = false;
    }
    for(let i=0;i<PhoneNumber.length;i++)
    {
        if(PhoneNumber.charCodeAt(i)<48 || PhoneNumber.charCodeAt(i)>57)
        {
            TipsUpdate("PhoneNumberTips","手机号中包含非数字，请检查后重新输入",false);
            Judge[1] = false;
            break;
        }
    }
}
//邮箱长度检查及邮箱格式合并
function EmailCheck() {
    var Email = document.getElementById("Email");
    var EmailText = document.getElementById("EmailText");
    var Suffix = document.getElementById("Suffix");
    EmailText = EmailText.value;
    if(EmailText.length>=5)
    {
        TipsUpdate("EmailTips","",true);
        Judge[2] = true;
    }
    else
    {
        TipsUpdate("EmailTips","邮箱长度不足5位，请检查后重新输入",false);
        Judge[2] = false;
    }
    Email.value = EmailText + Suffix.value;//邮箱格式合并
}
//对验证码进行检查
function VeriCheck(){
    Verification = document.getElementById("Verification");
    if (Verification.value == TrueValue)
    {
        TipsUpdate("VerificationTips","",true);
        Judge[3] = true;
    }
    else
    {
        TipsUpdate("VerificationTips","验证码不正确，请检查后重新输入",false);
        Judge[3] = false;
    }
}
//检查密码的长度及安全性
function PasswordCheck() {
    var Password = document.getElementById('Password');
    Password = Password.value;
    //判断账号的长度是否符合要求
    if(8<=Password.length && Password.length<=20)
    {
        TipsUpdate("PasswordTips","",true);
        Judge[4] = true;
    }
    else
    {
        TipsUpdate("PasswordTips","长度8-20位，建议由数字、字母、特殊字符共同组成。",false);
        Judge[4] = false;
    }
    var SafeLevel = document.getElementById('SafeLevel');
    var Level = new Array(3);
    Level[0] = 0;
    Level[1] = 0;
    Level[2] = 0;
    var ASCII = 0;
    //判断密码的安全系数，数字、字母、特殊字母均占一定比重。
    for(let i=0;i<Password.length;i++)
    {
        ASCII = Password.charCodeAt(i);
        if(ASCII >=48 & ASCII<=57)
        {
            Level[0] = 1;
        }
        else if((65<=ASCII & ASCII<=90) | (97<=ASCII & ASCII<=122))
        {
            Level[1] = 1;
        }
        else if((0<=ASCII & ASCII<=47) || (91<=ASCII & ASCII<=96) || ASCII>=123)
        {
            Level[2] = 1;
        }
    }
    SafeLevel.style.fontWeight = "bold";
    switch (Level[0]+Level[1]+Level[2]) {
        case 0:SafeLevel.innerText = '无';SafeLevel.style.color = "white";break;
        case 1:SafeLevel.innerText = '低';SafeLevel.style.color = "red";break;
        case 2:SafeLevel.innerText = '中';SafeLevel.style.color = "orange";break;
        case 3:SafeLevel.innerText = '高';SafeLevel.style.color = "#2EAFBB";break;
    }
}
//检查两次密码的一致性
function PasswordSame() {
    var Password = document.getElementById("Password");
    var RePassword = document.getElementById("RePassword");
    if(Password.value==RePassword.value)
    {
        TipsUpdate("RePasswordTips","",true);
        Judge[5] = true;
    }
    else
    {
        TipsUpdate("RePasswordTips","两次密码不一致，请检查后重新输入",false);
        Judge[5] = false;
    }
}
//使密码可见
function LookPassword(Passwordid,Eyeid) {
    Password = document.getElementById(Passwordid);
    Eye = document.getElementById(Eyeid);
    Password.type = "text";
    Eye.className = "fa fa-eye";
    console.log(Password.value);
}
//使密码隐藏
function CoverPassword(Passwordid,Eyeid) {
    Password = document.getElementById(Passwordid);
    Eye = document.getElementById(Eyeid);
    Password.type = "password";
    Eye.className = "fa fa-eye-slash";
}
//对整个表单的填写进行检查
function FormCheck() {
    UsernameCheck();
    PhoneNumberLengthCheck();
    EmailCheck();
    VeriCheck();
    for(let i=0;i<4;i++)
    {
        if(!Judge[i])
        {
            alert("注册信息中存在未正确填写部分，请检查后重新填写！");
            return false;
        }
    }
}
