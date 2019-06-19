<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线考试系统</title>
    <link rel="stylesheet" type="text/css" href="main.css" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div id="border">
            <div id="title">
                <h1>在 线 考 试 系 统<br/></h1>
                <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            </div>
            <hr />
            <div style="color:white;">

                <table align="center" style="width: 100%; border:none;">
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
                        </td>
                    </tr>
                </table>
            </div>
            <hr />

            <div id="menu">
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                </div>
            <asp:Panel ID="Panel_Stu" runat="server" CssClass="panel">
                <br />
                

                <div align="center">
                    <h2 align="center">
                        <asp:Label ID="Label1" runat="server" Text="您当前有未参加的考试" ForeColor="#CC3300"></asp:Label></h2>
                    
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ID","Default.aspx?ID={0}") %>' Text="开始考试"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    
                    <br />

                </div>
                <br />
                <br />
            </asp:Panel>
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
