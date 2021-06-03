/*
Author:王基书
Address:www.loveffc.cn
Earliest Date:2021/3/15
Lastest Date:2021/3/15
Aim:生成/刷新验证码
*/
TrueValue = "";//正确的验证码
FalseValue = "";//错误的验证码
//进入页面时加载验证码
function Initial() {
    Refresh();
}
//刷新验证码
function Refresh() {
    Code = document.getElementById("VerificationCode");
    TrueValue = "";
    FalseValue = "";
    for(let i=0;i<5;i++)
    {
        var ascii = parseInt(Math.random()*70+58);
        FalseValue += String.fromCharCode(ascii).toString();
        if (ascii<=90)
        {
            FalseValue += " ";
        }
    }
    for(let i=0;i<5;i++)
    {
        var number = parseInt(Math.random()*9);
        TrueValue += number;
        FalseValue += number;
    }
    for(let i=0;i<5;i++)
    {
        var ascii = parseInt(Math.random()*70+58);
        FalseValue += String.fromCharCode(ascii);
        if (ascii<=90)
        {
            FalseValue += " ";
        }
    }
    Code.value = FalseValue;
}