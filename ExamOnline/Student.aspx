<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线考试系统</title>
    <link rel="stylesheet" type="text/css" href="CSS/student.css" />
    
    <style type="text/css">
        
        .auto-style1 {
            left: 20px;
            top: 150px;
        }
        
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div id="border">
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
                        </td>
                    </tr>
                </table>
            </div>
            <hr />

            <div id="menu" align="center">
                    <asp:Button ID="btnExam" runat="server" Text="考试" OnClick="btnExam_Click" CssClass="auto-style1" />
                <asp:Button ID="btnScore" runat="server" Text="成绩" OnClick="btnScore_Click" />
                </div>
            <asp:Panel ID="Panel_Exam" runat="server" CssClass="panel">
                <br />
                

                <div align="center">
                    <h2 align="center">
                        <asp:Label ID="Label1" runat="server" Text="您当前有未参加的考试" ForeColor="#CC3300"></asp:Label></h2>
                    
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ID","Exam.aspx?ID={0}") %>' Text="开始考试"></asp:HyperLink>
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
            <asp:Panel ID="Panel_Score" runat="server" CssClass="panel">
                <div align="center">
                    <h1>历次考试成绩</h1>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Name" HeaderText="考试名称" SortExpression="Name" />
                            <asp:BoundField DataField="Course" HeaderText="科目" SortExpression="Course" />
                            <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                            <asp:BoundField DataField="Score" HeaderText="分数" SortExpression="Score" />
                            <asp:BoundField DataField="DateTime" HeaderText="考试时间" SortExpression="DateTime" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamOnlineConnectionString %>" SelectCommand="SELECT * FROM [学生成绩]"></asp:SqlDataSource>
                    <br />
                    <br />
                </div>
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
