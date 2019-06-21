<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理员</title>
    <link href="CSS/student.css" rel="stylesheet" />
    <style type="text/css">
        
        .auto-style3 {
            
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="title">
                <h1>在 线 考 试 系 统<br/></h1>
            </div>
            <hr />
            <div style="color:white;">

                <table align="center" style="width: 100%; border:none; ">
                    <tr>
                        <td>姓名：<asp:Label ID="lblName" runat="server"></asp:Label>
                        </td>
                        <td>性别：<asp:Label ID="lblSex" runat="server"></asp:Label>
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

            <div id="menu" >
                    <asp:Button ID="btnStu" runat="server" Text="学生信息管理"  OnClick="btnStu_Click" />
                <asp:Button ID="btnTea" runat="server" Text="教师信息管理" OnClick="btnTea_Click"  />
                </div>
            <asp:Panel ID="Panel_Stu" runat="server" CssClass="panel">
                <br />
                <h1 style="text-align:center">学生信息管理</h1>
                <br />
                <div align="center">检索<asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>学号</asp:ListItem>
                        <asp:ListItem>姓名</asp:ListItem>
                        <asp:ListItem>性别</asp:ListItem>
                        <asp:ListItem>班级</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnFind" runat="server" Text="检索" OnClick="btnFind_Click" />
                    <asp:Button ID="btnShowAllStu" runat="server" Text="显示全部" OnClick="btnShowAllStu_Click" />
                    <asp:Button ID="btnStuIns" runat="server" Text="录入" OnClick="btnStuIns_Click" />
                    <br />
                    <br />
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"  ForeColor="#333333" GridLines="None"  OnSelectedIndexChanged="GridView3_SelectedIndexChanged" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="学号" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                            <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                            <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                            <asp:BoundField DataField="Passwd" HeaderText="密码" SortExpression="Passwd" />
                            <asp:CommandField  ShowSelectButton="True" />
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
                    <asp:Panel ID="Panel_StuInsert" runat="server" Width="300px">
                        <h2>学生信息</h2>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style3">学号：</td>
                                <td>
                                    <asp:TextBox ID="txb_Stu_ID" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">姓名：</td>
                                <td>
                                    <asp:TextBox ID="txb_Stu_Name" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">性别：</td>
                                <td>
                                    <asp:RadioButtonList ID="rbl_Stu_Sex" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">班级：</td>
                                <td>
                                    <asp:TextBox ID="txb_Stu_Class" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">密码：</td>
                                <td>
                                    <asp:TextBox ID="txb_Stu_Passwd" runat="server" style="height: 23px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Button ID="btn_Add" runat="server" Text="提交" OnClick="btn_Add_Click" />
                        <asp:Button ID="btnStuDel" runat="server" OnClick="btnStuDel_Click" Text="删除" />
                    </asp:Panel>
                    <br/>
                    <br />
                </div>
                
                <br />
                <br />
            </asp:Panel>


            <asp:Panel ID="Panel_Tea" runat="server" CssClass="panel">
                <br />
                <h1 style="text-align:center">教师信息管理</h1>
                <br />
                <div align="center">检索<asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>工号</asp:ListItem>
                        <asp:ListItem>姓名</asp:ListItem>
                        <asp:ListItem>性别</asp:ListItem>
                        <asp:ListItem>科目</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnFindT" runat="server" Text="检索" OnClick="btnFindT_Click" />
                    <asp:Button ID="btnShowAllT" runat="server" Text="显示全部" OnClick="btnShowAllT_Click" />
                    <asp:Button ID="btn_TeaInsert" runat="server" Text="录入" OnClick="btn_TeaInsert_Click" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"  ForeColor="#333333" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged1">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="工号" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                            <asp:BoundField DataField="Passwd" HeaderText="密码" SortExpression="Passwd" />
                            <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                            <asp:BoundField DataField="Course" HeaderText="科目" SortExpression="Course" />
                            <asp:CommandField  ShowSelectButton="True" />
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
                    <br />
                    <asp:Panel ID="Panel_TeaAdd" runat="server" Width="300px">
                        <h2>
                            <asp:Label ID="labTea" runat="server" Text="教师信息"></asp:Label>
                        </h2>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style3">工号：</td>
                                <td>
                                    <asp:TextBox ID="txbTeaID" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">姓名：</td>
                                <td>
                                    <asp:TextBox ID="txbTeaName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">性别：</td>
                                <td>
                                    <asp:RadioButtonList ID="rblTeaSex" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">科目：</td>
                                <td>
                                    <asp:TextBox ID="txbTeaCourse" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">密码：</td>
                                <td>
                                    <asp:TextBox ID="TxbTeaPas" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Button ID="btnTeaA" runat="server" Text="修改" OnClick="btnTeaA_Click"/>
                        <asp:Button ID="btnTeaDel" runat="server" Text="删除" OnClick="btnTeaDel_Click" />
                    </asp:Panel>
                    <br/>
                    <br />
                </div>
                
                <br />
                <br />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
