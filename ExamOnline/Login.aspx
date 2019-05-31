<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="Login.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login">
        <h1>Login</h1>
            <input type="text" required="required" placeholder="用户名" name="u"></input>
            <input type="password" required="required" placeholder="密码" name="p"></input>
            <button class="but" type="submit" formmethod="get">登录</button>
    </div>
    </form>
</body>
</html>
