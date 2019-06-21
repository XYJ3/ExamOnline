<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="Exam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>考试</title>
    <link rel="stylesheet" type="text/css" href="CSS/student.css" />
    <script language="javascript">
    var sec = 0;
    var min = 0;
    var hou = 0;
    flag = 0;
    idt = window.setTimeout("countDown();", 1000);
    function countDown() {
        sec++;
        if (sec == 60) { sec = 0; min += 1; }
        if (min == 60) { min = 0; hou += 1; }
        document.getElementById("lblTime").innerText = min + "分 " + sec + " 秒";
        idt = window.setTimeout("countDown();", 1000);
        if (min == 10) {
            document.getElementById("btnSubmit").click();
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <div id="title">
                <h1>在 线 考 试 系 统<br/></h1>
            </div>
            <hr />
            <div style="color:white;">

                <table align="center" style="width: 100%; border:none; ">
                    <tr>
                        <td>账号：<asp:Label ID="lblID" runat="server"></asp:Label>
                        </td>
                        <td>姓名：<asp:Label ID="lblName" runat="server"></asp:Label>
                        </td>
                        <td>性别：<asp:Label ID="lblSex" runat="server"></asp:Label>
                        </td>
                        <td>班级：<asp:Label ID="lblClass" runat="server"></asp:Label>
                        </td>
                        <td>身份：<asp:Label ID="lblSF" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnInfo" runat="server" OnClick="btnInfo_Click" Text="个人中心" />
                            <asp:Button ID="btnLoginOut" runat="server" OnClick="btnLoginOut_Click" Text="登出" />
                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="交卷" />
                        </td>
                    </tr>
                </table>
            </div>
            <div id="time" style="background-color:beige;width:70%;height:80px">
                <h2>
                <asp:Label ID="lblExamName" runat="server"></asp:Label></h2>
                <asp:Label ID="lblTime" runat="server" ForeColor="#990000"></asp:Label>
            </div>
            
            <div style="width:70%;background-color:white;height:1000px">
              
                <asp:Panel ID="Panel1" runat="server" HorizontalAlign="left"></asp:Panel>
                
            </div>
            
        </div>
    </form>
</body>
</html>
