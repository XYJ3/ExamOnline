<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher.aspx.cs" Inherits="Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>教师</title>
    <link href="CSS/student.css" rel="stylesheet" />
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
                        <td>科目：<asp:Label ID="lblCourse" runat="server"></asp:Label>
                        </td>
                        <td>身份：<asp:Label ID="lblSF" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnInfo" runat="server"  Text="个人中心" OnClick="btnInfo_Click" />
                            <asp:Button ID="btnLoginOut" runat="server" Text="登出" OnClick="btnLoginOut_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <hr />

            <div id="menu" >
                    <asp:Button ID="btnTest" runat="server" Text="试题管理" OnClick="btnTest_Click"   />
                <asp:Button ID="btnExamSco" runat="server" Text="考试成绩" OnClick="btnExamSco_Click"   />
                <asp:Button ID="btnPutExam" runat="server" Text="发布考试" OnClick="btnPutExam_Click"   />
                </div>


            <asp:Panel ID="Panel_Test" runat="server" CssClass="panel" HorizontalAlign="center">
                
                <h1>试题管理</h1>
                <div align="center"><asp:DropDownList ID="dpl_Find_Course" runat="server">
                        <asp:ListItem Selected="True">科目</asp:ListItem>
                        <asp:ListItem>计算机网络</asp:ListItem>
                        <asp:ListItem>操作系统</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="dpl_Find_Type" runat="server">
                        <asp:ListItem Selected="True">类型</asp:ListItem>
                        <asp:ListItem>选择</asp:ListItem>
                        
                        <asp:ListItem>填空</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnTestFind" runat="server" Text="检索" OnClick="btnTestFind_Click" />
                    <asp:Button ID="btnShowAll" runat="server" Text="显示全部" OnClick="btnShowAll_Click" />
                    <asp:Button ID="btnTestAdd" runat="server" Text="录入" OnClick="btnTestAdd_Click"  />

                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"  ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Problem" HeaderText="题目" ReadOnly="True"/>
                            <asp:BoundField DataField="Course" HeaderText="科目"/>
                            <asp:BoundField DataField="Type" HeaderText="类型"/>
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
                    <asp:Panel ID="Panel_TextAdd" runat="server" Width="600px">
                        <h2>
                            <asp:Label ID="labTea" runat="server" Text="试题信息"></asp:Label>
                        </h2>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style5">科目：</td>
                                <td>
                                    <asp:DropDownList ID="dplCourse" runat="server">
                                        <asp:ListItem>计算机网络</asp:ListItem>
                                        <asp:ListItem>操作系统</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">类型：</td>
                                <td>
                                    <asp:DropDownList ID="dplType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dplType_SelectedIndexChanged">
                                        <asp:ListItem>选择</asp:ListItem>
                                        
                                        <asp:ListItem>填空</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">题目：</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="txbProblem" runat="server" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">选项A:</td>
                                <td>
                                    <asp:TextBox ID="txbAnsA" runat="server" Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">选项B:</td>
                                <td>
                                    <asp:TextBox ID="txbAnsB" runat="server" Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">选项C:</td>
                                <td>
                                    <asp:TextBox ID="txbAnsC" runat="server" Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">选项D:</td>
                                <td>
                                    <asp:TextBox ID="txbAnsD" runat="server" Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">正确答案：</td>
                                <td>
                                    <asp:TextBox ID="txbRightAns" runat="server" Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:Button ID="btnTextIns" runat="server" Text="修改" OnClick="btnTextIns_Click"  />
                        <asp:Button ID="btnTestDel" runat="server" Text="删除" OnClick="btnTestDel_Click" />
                    </asp:Panel>

            </asp:Panel>

            <asp:Panel ID="Panel_Score" runat="server"  HorizontalAlign="center" CssClass="panel" align="center">
                <h1>考试成绩</h1>
                <div align="center">
                    <br/>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="考试" SortExpression="Name" />
                        <asp:BoundField DataField="Course" HeaderText="科目" SortExpression="Course" />
                        <asp:BoundField DataField="StudentID" HeaderText="学号" SortExpression="StudentID" />
                        <asp:BoundField DataField="StudentName" HeaderText="姓名" SortExpression="StudentName" />
                        <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                        <asp:BoundField DataField="Class" HeaderText="班级" SortExpression="Class" />
                        <asp:BoundField DataField="DateTime" HeaderText="考试时间" SortExpression="DateTime" />
                        <asp:BoundField DataField="Score" HeaderText="分数" SortExpression="Score" />
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
                    </div>
            </asp:Panel>

            <asp:Panel ID="Panel_Put" runat="server" HorizontalAlign="center" CssClass="panel">
                <h1>考试发布</h1>
                
                <p>
                    &nbsp;</p>
                
                <div  align="center">
                    <table style="width:30%;text-align:center">
                        <tr>
                            <td>名称</td>
                            <td>
                                <asp:TextBox ID="txbEName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>科目</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>计算机网络</asp:ListItem>
                                    <asp:ListItem>操作系统</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>班级</td>
                            <td>
                                <asp:TextBox ID="txbEClass" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>题目数量</td>
                            <td>
                                <asp:TextBox ID="txbDan" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnPE" runat="server" OnClick="btnPE_Click" Text="发布" />
                            </td>
                        </tr>
                    </table>
                
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
