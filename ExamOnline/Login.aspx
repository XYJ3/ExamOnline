<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="login.css" />
    <style type="text/css">
       
        
        
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        
        <div id="name">
            <h1>在线考试系统</h1>
        </div>
        <div id="login">
            <h1>Login</h1>
            <div style="text-align:center;">
            <asp:RadioButtonList ID="rbtlLogin" runat="server" RepeatDirection="Horizontal" CellSpacing="5" Width="100%" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="White">
                <asp:ListItem>学生</asp:ListItem>
                <asp:ListItem>教师</asp:ListItem>
                <asp:ListItem>管理员</asp:ListItem>
            </asp:RadioButtonList>
            </div>
            <br />
            <input id="Text1" type="text" class="tb" placeholder="用户名" />
            <input id="Password1" type="password" class="tb" placeholder="密码" />
            <asp:Button ID="btnLogin" runat="server" Text="登录" CssClass="btn" Width="100%" OnClick="btnLogin_Click" />

        </div>
            
    </form>
    
    
</body>
</html>
