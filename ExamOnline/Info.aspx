<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 45px;
            
        }
        .auto-style2 {
            width: 96px;
            text-align:right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center" style="width:350px">
            <asp:Panel ID="Panel_Stu" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">学号：</td>
                        <td>
                            <asp:TextBox ID="txb_Stu_ID" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">姓名：</td>
                        <td>
                            <asp:TextBox ID="txb_Stu_Name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">性别：</td>
                        <td>
                            <asp:RadioButtonList ID="rbl_Stu_Sex" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">班级：</td>
                        <td>
                            <asp:TextBox ID="txb_Stu_Class" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">密码：</td>
                        <td style="text-align:center">
                            <asp:TextBox ID="txb_Stu_Passwd" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel_Tea" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">工号：</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">姓名：</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">性别：</td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">科目：</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">密码：</td>
                        <td style="text-align:center">
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:Button ID="Button2" runat="server" Text="修改" OnClick="Button2_Click"  />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel_Admin" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">账号：</td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">姓名：</td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">性别：</td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">密码：</td>
                        <td style="text-align:center">
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:Button ID="Button3" runat="server" Text="修改" OnClick="Button3_Click"  />
                        </td>
                    </tr>
                </table>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
