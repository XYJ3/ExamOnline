using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel_Stu.Visible = false;
            Panel_Tea.Visible = false;
            Panel_Admin.Visible = false;
        }
        if(Session["SF"].ToString()=="学生")
        {
            Panel_Stu.Visible = true;
            txb_Stu_ID.Text = Session["ID"].ToString();
            txb_Stu_Name.Text = Session["Name"].ToString();
            txb_Stu_Class.Text = Session["Class"].ToString();
            rbl_Stu_Sex.SelectedValue = Session["Sex"].ToString();
            txb_Stu_ID.Enabled = false;
        }
        if (Session["SF"].ToString() == "教师")
        {
            

            Panel_Tea.Visible = true;
            TextBox1.Text = Session["ID"].ToString();
            TextBox2.Text = Session["Name"].ToString();
            TextBox3.Text = Session["Course"].ToString();
            RadioButtonList1.SelectedValue = Session["Sex"].ToString();
            TextBox1.Enabled = false;
        }
        if (Session["SF"].ToString() == "管理员")
        {
            
            Panel_Admin.Visible = true;
            TextBox5.Text = Session["ID"].ToString();
            TextBox6.Text = Session["Name"].ToString();
            RadioButtonList2.SelectedValue = Session["Sex"].ToString();
            TextBox5.Enabled = false;
        }

    }
    private int SqlComNon(string queryString)
    {
        using (SqlConnection conn = new SqlConnection(getConnectionString()))
        {
            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandTimeout = 15;
            command.CommandType = CommandType.Text;
            command.CommandText = queryString;
            conn.Open();
            int n = command.ExecuteNonQuery();
            command.Dispose();
            return n;

        }
    }

    string getConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ExamOnlineConnectionString"].ConnectionString;
    }

    

    protected void Button1_Click(object sender, EventArgs e)
    {
        string queryStr = "update tb_Student SET Name='" + txb_Stu_Name.Text.Trim() + "',Sex='" + rbl_Stu_Sex.SelectedValue + "',Class=" + Convert.ToInt32(txb_Stu_Class.Text.Trim()) + ",Passwd='" + txb_Stu_Passwd.Text.Trim() + "' where ID = '" + txb_Stu_ID.Text.Trim() + "'";
        if (SqlComNon(queryStr) == 1)
        {
            Response.Write("<script>alert('修改成功！')</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string queryStr = "update tb_Teacher SET Name='" + TextBox2.Text.Trim() + "',Sex='" + RadioButtonList1.SelectedValue + "',Course=" + TextBox3 + ",Passwd='" + TextBox4.Text.Trim() + "' where ID = '" + TextBox1.Text.Trim() + "'";
        if (SqlComNon(queryStr) == 1)
        {
            Response.Write("<script>alert('修改成功！')</script>");
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string queryStr = "update tb_Admin SET Name='" + TextBox6.Text.Trim() + "',Sex='" + RadioButtonList2.SelectedValue  + "',Passwd='" + TextBox8.Text.Trim() + "' where ID = '" + TextBox5.Text.Trim() + "'";
        if (SqlComNon(queryStr) == 1)
        {
            Response.Write("<script>alert('修改成功！')</script>");
        }
    }
}