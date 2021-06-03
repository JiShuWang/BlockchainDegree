/*
Author:王基书
Address:www.loveffc.cn
Earliest Date:2021/3/8
Lastest Date:2021/3/18
Aim:对所有表单的格式及操作进行判断
*/
var CurrentClass = "fa fa-check";//font-awesome中对应√标志的类名
var CurrentColor = "deepskyblue";
var CurrentAlign = "center";
var MistakeClass = "fa fa-close";//font-awesome中对应×标志的类名
var MistakeColor = "orange";
var MistakeAlign = "center";
var RegisterJudge = new Array(7);//判定注册功能的表单各个模块填写的正确性
var LoginJudge = new Array(3);//判定登录功能的表单各个模块填写的正确性
var ForgetJudge = new Array(6);//判定重置密码功能的表单各个模块填写的正确性
var UserJudge = new Array(2);//判定个人信息页面的表单各个模块填写的正确性
var CertificateJudge = new Array(7);//判定实名认证页面的表单各个模块填写的正确性
for(let i=0;i<8;i++)
{
    RegisterJudge[i] = false;//初始化
}
for(let i=0;i<3;i++)
{
    LoginJudge[i] = false;
}
for(let i=0;i<6;i++)
{
    ForgetJudge[i] = false;
}
for(let i=0;i<2;i++)
{
    UserJudge[i] = false;
}
for(let i=0;i<7;i++)
{
    CertificateJudge[i] = false;
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
function UsernameCheck(page) {
    var Username = document.getElementById("Username");
    Username = Username.value;
    if(Username.length>=8 && Username.length<=10)
    {
        TipsUpdate("UsernameTips","",true);
        RegisterJudge[0] = true;
        LoginJudge[0] = true;
        ForgetJudge[0] = true;
        return true;
    }
    if(page=="Register")
    {
        RegisterJudge[0] = false;
        if(Username.length<8)
        {
            TipsUpdate("UsernameTips","长度小于8位，建议由数字、字母、特殊字符共同组成。",false);
        }
        else if(Username.length>10)
        {
            TipsUpdate("UsernameTips","长度大于10位，建议由数字、字母、特殊字符共同组成。",false);
        }
    }
    else if(page=="Login" || page=="Forget")
    {
        LoginJudge[0] = false;
        ForgetJudge[0] = false;
        if(Username.length<8)
        {
            TipsUpdate("UsernameTips","长度小于8位。",false);
        }
        else if(Username.length>10)
        {
            TipsUpdate("UsernameTips","长度大于10位。",false);
        }
    }
}
//检查密码的长度及安全性
function PasswordCheck(page) {
    var Password = document.getElementById('Password');
    Password = Password.value;
    if(page=="Register" || page=="Forget")
    {
        console.log(Password);
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
            case 3:SafeLevel.innerText = '高';SafeLevel.style.color = "deepskyblue";break;
        }
        RegisterJudge[1] = false;
        ForgetJudge[4] = false;
        if(Password.length<8)
        {
            TipsUpdate("PasswordTips","长度小于8位，建议由数字、字母、特殊字符共同组成。",false);
        }
        else if(Password.length>21)
        {
            TipsUpdate("PasswordTips","长度大于20位，建议由数字、字母、特殊字符共同组成。",false);
        }
    }
    else if(page=="Login" )
    {
        LoginJudge[1] = false;
        if(Password.length<8)
        {
            TipsUpdate("PasswordTips","长度小于8位。",false);
        }
        else if(Password.length>21)
        {
            TipsUpdate("PasswordTips","长度大于20位。",false);
        }
    }
    if(Password.length>=8 && Password.length<=20)
    {
        TipsUpdate("PasswordTips","",true);
        RegisterJudge[1] = true;
        LoginJudge[1] = true;
        ForgetJudge[4] = true;
    }
}
//检查两次密码的一致性
function PasswordSame() {
    var Password = document.getElementById("Password");
    var RePassword = document.getElementById("RePassword");
    if(Password.value==RePassword.value)
    {
        TipsUpdate("RePasswordTips","",true);
        RegisterJudge[2] = true;
        ForgetJudge[5] = true;
    }
    else
    {
        TipsUpdate("RePasswordTips","两次密码不一致，请检查后重新输入",false);
        RegisterJudge[2] = false;
        ForgetJudge[5] = true;
    }
}
//使密码可见
function LookPassword(Passwordid,Eyeid) {
    Password = document.getElementById(Passwordid);
    Eye = document.getElementById(Eyeid);
    Password.type = "text";
    Eye.className = "fa fa-eye";
}
//使密码隐藏
function CoverPassword(Passwordid,Eyeid) {
    Password = document.getElementById(Passwordid);
    Eye = document.getElementById(Eyeid);
    Password.type = "password";
    Eye.className = "fa fa-eye-slash";
}
//手机端查看密码及隐藏密码
var MobileClick1 = 0;
var MobileClick2 = 0;
function MobilePassword(Passwordid,Eyeid) {
    if(document.documentElement.clientWidth<1200)//设备属于移动端
    {
        if(Eyeid=="Eye")//密码
        {
            if(MobileClick1%2==0)//显示密码
            {
                LookPassword(Passwordid,Eyeid);
                MobileClick1 += 1;
            }
            else//隐藏密码
            {
                CoverPassword(Passwordid,Eyeid);
                MobileClick1 += 1;
            }
        }
        else //确认密码
        {
            if(MobileClick2%2==0)//显示密码
            {
                LookPassword(Passwordid,Eyeid);
                MobileClick2 += 1;
            }
            else//隐藏密码
            {
                CoverPassword(Passwordid,Eyeid);
                MobileClick2 += 1;
            }
        }
    }
}
//检查手机号长度及正确性
function PhoneNumberCheck() {
    var PhoneNumber = document.getElementById("PhoneNumber");
    PhoneNumber = PhoneNumber.value;
    for(let i=0;i<PhoneNumber.length;i++)
    {
        if(PhoneNumber.charCodeAt(i)<48 || PhoneNumber.charCodeAt(i)>57)
        {
            TipsUpdate("PhoneNumberTips","手机号中包含非数字，请检查后重新输入",false);
            RegisterJudge[3] = false;
            ForgetJudge[1] = false;
            UserJudge[0] = false;
            return false;
        }
    }
    if(PhoneNumber.length==11) {
        TipsUpdate("PhoneNumberTips", "", true);
        RegisterJudge[3] = true;
        ForgetJudge[1] = true;
        UserJudge[0] = true;
    }
    else
    {
        TipsUpdate("PhoneNumberTips","手机号长度不为11位，请检查后重新输入",false);
        RegisterJudge[3] = false;
        ForgetJudge[1] = false;
        UserJudge[0] = false;
    }
}
//检查证件号码的长度
function IDCheck() {
    var IDType = document.getElementById("IDType");
    IDType = IDType.value;
    var ID = document.getElementById("ID");
    ID = ID.value;
    if (IDType == "居民身份证")
    {
        var Expression = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (Expression.test(ID)==true)
        {
            TipsUpdate("IDTips","",true);
            RegisterJudge[4] = true;
        }
        else
        {
            TipsUpdate("IDTips","居民身份证格式不正确，请检查后重新输入",false);
            RegisterJudge[4] = false;
        }
    }
    else if(IDType == "港澳身份证")
    {
        var Expression = /^([A-Z]\d{6,10}(\(\w{1}\))?)$/;//判断港澳身份证是否合法的正则表达式
        if(Expression.test(ID) == true)
        {
            TipsUpdate("IDTips","",true);
            RegisterJudge[4] = true;
        }
        else
        {
            TipsUpdate("IDTips","港澳身份证格式不正确，请检查后重新输入",false);
            RegisterJudge[4] = false;
        }
    }
    else if(IDType == "台湾身份证")
    {
        var Expression = /^\d{8}|^[a-zA-Z0-9]{10}|^\d{18}$/;//判断台湾身份证是否合法的正则表达式
        if(Expression.test(ID) == true)
        {
            TipsUpdate("IDTips","",true);
            RegisterJudge[4] = true;
        }
        else
        {
            TipsUpdate("IDTips","台湾身份证格式不正确，请检查后重新输入",false);
            RegisterJudge[4] = false;
        }
    }
    else if(IDType == "护照")
    {
        var Expression = /^([a-zA-z]|[0-9]){5,17}$/;//判断护照身份证是否合法的正则表达式
        if(Expression.test(ID) == true)
        {
            TipsUpdate("IDTips","",true);
            RegisterJudge[4] = true;
        }
        else
        {
            TipsUpdate("IDTips","护照格式不正确，请检查后重新输入",false);
            RegisterJudge[4] = false;
        }
    }
}
//检查姓名长度
function NameCheck() {
    var Name = document.getElementById("Name");
    Name = Name.value;
    if(Name.length>=2)
    {
        TipsUpdate("NameTips","",true);
        RegisterJudge[5] = true;
    }
    else
    {
        TipsUpdate("NameTips","姓名长度小于2位，请检查后重新输入",false);
        RegisterJudge[5] = false;
    }
}
//邮箱长度检查及邮箱格式合并
function EmailCheck() {
    var Email = document.getElementById("Email");
    var EmailText = document.getElementById("EmailText");
    var Suffix = document.getElementById("Suffix");
    EmailText = EmailText.value;
    if(EmailText.length<5)
    {
        TipsUpdate("EmailTips","邮箱长度不足5位，请检查后重新输入",false);
        RegisterJudge[6] = false;
        ForgetJudge[2] = false;
    }
    else if(EmailText.length>=5 && EmailText.length<=20)
    {
        TipsUpdate("EmailTips","",true);
        RegisterJudge[6] = true;
        ForgetJudge[2] = true;
        UserJudge[1] = true;
    }
    else if(EmailText.length>=21)
    {
        TipsUpdate("EmailTips","邮箱长度超过20位，请检查后重新输入",true);
        RegisterJudge[6] = false;
        ForgetJudge[2] = false;
        UserJudge[1] = false;
    }
    Email.value = EmailText + Suffix.value;//邮箱格式合并
}
//对验证码进行检查
function VeriCheck(){
    Verification = document.getElementById("Verification");
    if (Verification.value == TrueValue)
    {
        TipsUpdate("VerificationTips","",true);
        RegisterJudge[7] = true;
        LoginJudge[2] = true;
        ForgetJudge[3] = true;
    }
    else
    {
        TipsUpdate("VerificationTips","验证码不正确，请检查后重新输入",false);
        RegisterJudge[7] = false;
        LoginJudge[2] = false;
        ForgetJudge[3] = false;
    }
}
var ClickCount = new Array(4);
for(let i=0;i<4;i++)
{
    ClickCount[i] = 0;
}
//对高校名称的填写进行检查
function UniversityCheck() {
    var University = document.getElementById("University");
    University = University.value;
    if(University.length==0)
    {
        CertificateJudge[0] = false;
    }
    else
    {
        CertificateJudge[0] = true;
    }
}
//对学院名称的填写进行检查
function CollegeCheck() {
    var College = document.getElementById("College");
    College = College.value;
    if(College.length==0)
    {
        CertificateJudge[1] = false;
        return false;
    }
    else
    {
        CertificateJudge[1] = true;
    }
}
//对专业名称的填写进行检查
function MajorCheck() {
    var Major = document.getElementById("Major");
    Major = Major.value;
    if(Major.length==0)
    {
        CertificateJudge[2] = false;
        return false;
    }
    else
    {
        CertificateJudge[2] = true;
    }
}
//对学位名称的填写进行检查
function DegreeCheck() {
    var Degree = document.getElementById("Degree");
    Degree = Degree.value;
    if(Degree.length==0)
    {
        CertificateJudge[3] = false;
        return false;
    }
    else
    {
        CertificateJudge[3] = true;
    }
}
//对年级的填写进行检查
function GradeCheck() {
    var Grade = document.getElementById("Grade");
    Grade = Grade.value;
    if(Grade.length==0)
    {
        CertificateJudge[4] = false;
        return false;
    }
    else
    {
        CertificateJudge[4] = true;
    }
}
//对班级的填写进行检查
function ClassCheck() {
    var Class = document.getElementById("Class");
    Class = Class.value;
    if(Class.length==0)
    {
        CertificateJudge[5] = false;
        return false;
    }
    else
    {
        CertificateJudge[5] = true;
    }
}
//对学号的填写进行检查
function StudentIDCheck() {
    var StudentID = document.getElementById("StudentID");
    StudentID = StudentID.value;
    if(StudentID.length==0)
    {
        CertificateJudge[6] = false;
        return false;
    }
    else
    {
        CertificateJudge[6] = true;
    }
}
//证书查询页面的切换
function CertificateSwap(option){
    var Education = document.getElementById("Education");
    var Degree = document.getElementById("Degree");
    if(option=="Education")
    {
        Education.style.display = "block";
        Degree.style.display = "none";
    }
    else if(option=="Degree")
    {
        Education.style.display = "none";
        Degree.style.display = "block";
    }
}
//对注册功能的表单填写进行检查
function RegisterFormCheck() {
    UsernameCheck("Register");
    PasswordCheck("Register");
    PasswordSame();
    PhoneNumberCheck();
    IDCheck();
    NameCheck();
    EmailCheck();
    VeriCheck();
    for(let i=0;i<8;i++)
    {
        if(!RegisterJudge[i])
        {
            alert("注册信息中存在未正确填写部分，请检查后重新填写！");
            return false;
        }
    }
    return true;
}
//对登录页面的表单填写进行检查
function LoginFormCheck() {
    UsernameCheck("Login");
    PasswordCheck("Login");
    VeriCheck();
    for(let i=0;i<3;i++)
    {
        if(!LoginJudge[i])
        {
            alert("登录信息中存在未正确填写部分，请检查后重新填写！");
            return false;
        }
    }
    return true;
}
//对重置密码页面的表单填写进行检查
function ForgetFormCheck() {
    UsernameCheck("Forget");
    PhoneNumberCheck();
    EmailCheck();
    VeriCheck();
    for(let i=0;i<4;i++)
    {
        if(!ForgetJudge[i])
        {
            alert("重置密码信息中存在未正确填写部分，请检查后重新填写！");
            return false;
        }
    }
    return true;
}
//对重置密码页面的表单填写进行检查
function SetPasswordFormCheck() {
    PasswordCheck("Forget");
    PasswordSame();
    VeriCheck();
    if(!ForgetJudge[3] || !ForgetJudge[4] || !ForgetJudge[5])
    {
        alert("重置密码信息中存在未正确填写部分，请检查后重新填写！");
        return false;
    }
    return true;
}
//对实名认证页面的表单填写进行检查
function CertificateFormCheck() {
    UniversityCheck();
    CollegeCheck();
    MajorCheck();
    DegreeCheck();
    GradeCheck();
    ClassCheck();
    StudentIDCheck();
    for(let i=0;i<7;i++)
    {
        if(!CertificateJudge[i])
        {
            alert("所有项均为必填项，请认真检查未填写的项目。")
            return false;
        }
    }
    return true;
}
//对证书查询页面的搜索栏填写进行检查
function SearchCheck(option){
    if(option=="Education")
    {
        var EducationID = document.getElementById("EducationID");
        var EducationName = document.getElementById("EducationName");
        EducationID = EducationID.value;
        EducationName = EducationName.value;
        if(EducationID.length==0)
        {
            alert("请填写你需要查询的学历证书编号！");
            return false;
        }
        if(EducationName.length==0)
        {
            alert("请填写该学历证书所属人的姓名！");
            return false;
        }
        return true;
    }
    else if(option=="Degree")
    {
        var DegreeID = document.getElementById("DegreeID");
        var DegreeName = document.getElementById("DegreeName");
        DegreeID = DegreeID.value;
        DegreeName = DegreeName.value;
        if(DegreeID.length==0)
        {
            alert("请填写你需要查询的学历证书编号！");
            return false;
        }
        if(DegreeName.length==0)
        {
            alert("请填写该学历证书所属人的姓名！");
            return false;
        }
        return true;
    }
}
//对证书核验页面的搜索栏填写进行检查
function VerificationCheck(option){
    if(option=="Education")
    {
        var EducationID = document.getElementById("EducationID");
        var EducationName = document.getElementById("EducationName");
        EducationID = EducationID.value;
        EducationName = EducationName.value;
        if(EducationID.length==0)
        {
            alert("请填写你需要核验的学历证书编号！");
            return false;
        }
        if(EducationName.length==0)
        {
            alert("请填写该学历证书对应的哈希值！");
            return false;
        }
        return true;
    }
    else if(option=="Degree")
    {
        var DegreeID = document.getElementById("DegreeID");
        var DegreeName = document.getElementById("DegreeName");
        DegreeID = DegreeID.value;
        DegreeName = DegreeName.value;
        if(DegreeID.length==0)
        {
            alert("请填写你需要查询的学位证书编号！");
            return false;
        }
        if(DegreeName.length==0)
        {
            alert("请填写该学位证书对应的哈希值！");
            return false;
        }
        return true;
    }
}
//根据Search页面的传值选择SearchResult页面的显示效果
function CertificateChoose() {
    var URL = window.location.search;
    var Education = document.getElementById("Education");
    var Degree = document.getElementById("Degree");
    if(URL.indexOf("Education")!=-1)
    {
        Education.style.display = "block";
        Degree.style.display = "none";
    }
    else if(URL.indexOf("Degree")!=-1)
    {
        Education.style.display = "none";
        Degree.style.display = "block";
    }
}

