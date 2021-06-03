var ClickCount = new Array(4);
for(let i=0;i<4;i++)
{
    ClickCount[i] = 0;
}
function Modify(element,elementid) {
    var element = document.getElementById(element);
    var Tips = document.getElementById("Tips"+elementid);
    if(ClickCount[elementid]%2==0)//开启修改
    {
        element.readOnly = false;
        element.style.color = "deepskyblue";
        element.style.cursor = "revert";
        Tips.innerHTML = '<i class="'+'fa fa-edit"></i>关闭修改';
        ClickCount[elementid] += 1;
    }
    else//关闭修改
    {
        element.readOnly = true;
        element.style.color = "black";
        element.style.cursor = "default";
        Tips.innerHTML = '<i class="'+'fa fa-edit"></i>修改';
        ClickCount[elementid] += 1;
    }

}