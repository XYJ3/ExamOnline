using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblName.Text = Session["Name"].ToString();
            lblSex.Text = Session["Sex"].ToString();
            lblSF.Text = Session["SF"].ToString();
            Panel_Stu.Visible = true;
            Panel_StuInsert.Visible = false;
            //GridView1.Visible = false;
            Panel_Tea.Visible = false;
            Panel_TeaAdd.Visible = false;
        }
    }

    string getConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ExamOnlineConnectionString"].ConnectionString;
    }
    //学生信息管理按钮
    protected void btnStu_Click(object sender, EventArgs e)
    {
        Panel_Stu.Visible = true;
        //GridView1.Visible = false;
        Panel_Tea.Visible = false;
        Panel_TeaAdd.Visible = false;
    }
    //教师信息管理按钮
    protected void btnTea_Click(object sender, EventArgs e)
    {
        Panel_Stu.Visible = false;
        Panel_Tea.Visible = true;
        Panel_TeaAdd.Visible = false;
    }
    //个人信息
    protected void btnInfo_Click(object sender, EventArgs e)
    {

    }

    protected void btnLoginOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    //录入学生信息按钮
    protected void btnStuIns_Click(object sender, EventArgs e)
    {
        Panel_StuInsert.Visible = true;
        //GridView1.Visible = false;
        
        txb_Stu_ID.Text = "";
        txb_Stu_Name.Text = "";
        txb_Stu_Class.Text = "";
        txb_Stu_Passwd.Text = "";
        btn_Add.Text = "提交";
    }

    protected void btnShowAllStu_Click(object sender, EventArgs e)
    {
        //GridView1.Visible = true;
        Panel_StuInsert.Visible = false;
        string queryStr = "select * from tb_Student";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();

    }

    //检索
    protected void btnFind_Click(object sender, EventArgs e)
    {
        string queryStr = "select * from tb_Student ";
        if (TextBox1.Text != "")
        {
            switch (DropDownList1.SelectedValue.Trim().ToString())
            {
                case "学号":
                    queryStr += "where ID='" + TextBox1.Text.Trim().ToString() + "'";
                    break;
                case "姓名":
                    queryStr += "where Name='" + TextBox1.Text.Trim().ToString() + "'";
                    break;
                case "性别":
                    queryStr += "where Sex='" + TextBox1.Text.Trim().ToString() + "'";
                    break;
                case "班级":
                    queryStr += "where Class=" + Convert.ToInt32(TextBox1.Text.Trim().ToString());
                    break;

            }
            SqlConnection conn = new SqlConnection(getConnectionString());
            SqlCommand com = new SqlCommand(queryStr, conn);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView3.DataSource = ds;
            GridView3.DataBind();
        }
    }
    //学生信息录入/修改
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (btn_Add.Text == "确定")
        {
            string queryStr = "update tb_Student SET Name='" + txb_Stu_Name.Text.Trim() + "',Sex='" + rbl_Stu_Sex.SelectedValue + "',Class=" + Convert.ToInt32(txb_Stu_Class.Text.Trim()) + ",Passwd='" + txb_Stu_Passwd.Text.Trim() + "' where ID = '" + txb_Stu_ID.Text.Trim() + "'";
            if (SqlComNon(queryStr) == 1)
            {
                Response.Write("<script>alert('修改成功！')</script>");
            }
        }
        if (btn_Add.Text == "修改")
        {
            btn_Add.Text = "确定";
            btnStuDel.Visible = false;

            txb_Stu_Name.Enabled = true;
            rbl_Stu_Sex.Enabled = true;
            txb_Stu_Class.Enabled = true;
            txb_Stu_Passwd.Enabled = true;
        }
        
        else
        {
            if (txb_Stu_ID.Text != "" && txb_Stu_Name.Text != "" && txb_Stu_Class.Text != "" && txb_Stu_Passwd.Text != "")
            {
                string queryStr = "insert into tb_Student (ID,Name,Sex,Class,Passwd) values ('" + txb_Stu_ID.Text.Trim().ToString() + "','" + txb_Stu_Name.Text.Trim().ToString() + "','" + rbl_Stu_Sex.SelectedValue.ToString() + "'," + Convert.ToInt32(txb_Stu_Class.Text.Trim().ToString()) + ",'" + txb_Stu_Passwd.Text.ToString().ToString() + "')";

                if (SqlComNon(queryStr) == 1)
                {
                    Response.Write("<script>alert('添加成功！')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('输入信息不能为空！')</script>");
            }
        }
        
    }

    //检索（教师）
    protected void btnFindT_Click(object sender, EventArgs e)
    {
        string queryStr = "select * from tb_Teacher ";
        if (TextBox1.Text != "")
        {
            switch (DropDownList1.SelectedValue.Trim().ToString())
            {
                case "工号":
                    queryStr += "where ID='" + TextBox1.Text.Trim().ToString() + "'";
                    break;
                case "姓名":
                    queryStr += "where Name='" + TextBox1.Text.Trim().ToString() + "'";
                    break;
                case "科目":
                    queryStr += "where Course='" + TextBox1.Text.Trim().ToString() + "'";
                    break;
                case "性别":
                    queryStr += "where Sex='" + TextBox1.Text.Trim().ToString() + "'";
                    break;

            }
            SqlConnection conn = new SqlConnection(getConnectionString());
            SqlCommand com = new SqlCommand(queryStr, conn);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
    }
    //显示全部教师信息
    protected void btnShowAllT_Click(object sender, EventArgs e)
    {
        string queryStr = "select * from tb_Teacher";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds.Tables[0];
        GridView2.DataBind();

    }
    //录入教师信息
    protected void btn_TeaInsert_Click(object sender, EventArgs e)
    {
        Panel_TeaAdd.Visible = true;
        txbTeaID.Enabled = true;
        txbTeaName.Enabled = true;
        rblTeaSex.Enabled = true;
        txbTeaCourse.Enabled = true;
        TxbTeaPas.Enabled = true;
        txbTeaID.Text = "";
        txbTeaName.Text = "";
        txbTeaCourse.Text = "";
        rblTeaSex.SelectedIndex = 0;
        TxbTeaPas.Text = "";
        btnTeaA.Text = "提交";
        btnTeaDel.Visible = false;
    }

    
    //选择教师信息
    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Panel_TeaAdd.Visible = true;
        string queryStr = "select * from tb_Teacher where ID='" + GridView2.SelectedDataKey.Value.ToString() + "'";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read()) 
        {
            txbTeaID.Text = reader["ID"].ToString();
            txbTeaName.Text = reader["Name"].ToString();
            rblTeaSex.SelectedValue = reader["Sex"].ToString();
            txbTeaCourse.Text = reader["Course"].ToString();
            TxbTeaPas.Text = reader["Passwd"].ToString();
            txbTeaID.Enabled = false;
            txbTeaName.Enabled = false;
            rblTeaSex.Enabled = false;
            txbTeaCourse.Enabled = false;
            TxbTeaPas.Enabled = false;
        }

        btnTeaA.Text = "修改";
        btnTeaDel.Text = "删除";
        btnTeaDel.Visible = true;
    }
    //教师提交按钮
    protected void btnTeaA_Click(object sender, EventArgs e)
    {
        //修改
        if (btnTeaA.Text == "修改")
        {
            btnTeaA.Text = "确定";
            btnTeaDel.Visible = false;

            txbTeaName.Enabled = true;
            rblTeaSex.Enabled = true;
            txbTeaCourse.Enabled = true;
            TxbTeaPas.Enabled = true;
        }
        if (btnTeaA.Text == "确定")
        {
            string queryStr = "update tb_Teacher SET Name='" + txbTeaName.Text.Trim() + "',Sex='" + rblTeaSex.SelectedValue + "',Course='" + txbTeaCourse.Text.Trim() + "',Passwd='" + TxbTeaPas.Text.Trim() + "' where ID = '" + txbTeaID.Text.Trim() + "'";
            if (SqlComNon(queryStr) == 1)
            {
                Response.Write("<script>alert('修改成功！')</script>");
            }
        }
        //添加
        else
        {
            string queryStr = "insert into tb_Teacher (ID,Name,Sex,Course,Passwd) values ('" + txbTeaID.Text.Trim().ToString() + "','" + txbTeaName.Text.Trim().ToString() + "','" + rblTeaSex.SelectedValue.ToString() + "','" + txbTeaCourse.Text.Trim().ToString() + "','" + TxbTeaPas.Text.ToString().ToString() + "')";

            if (SqlComNon(queryStr) == 1)
            {
                Response.Write("<script>alert('添加成功！')</script>");
            }
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

    //教师删除按钮
    protected void btnTeaDel_Click(object sender, EventArgs e)
    {
        if (btnTeaDel.Text == "取消")
        {

        }
        else
        {
            string queryStr = "delete from tb_Teacher where ID='" + txbTeaID.Text + "'";
            if(SqlComNon(queryStr)==1)
            {
                Response.Write("<script>alert('删除成功！')</script>");
            }
        }
    }
    //学生索引选择
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel_StuInsert.Visible = true;
        string queryStr = "select * from tb_Student where ID='" + GridView3.SelectedDataKey.Value.ToString() + "'";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read())
        {
            txb_Stu_ID.Text = reader["ID"].ToString();
            txb_Stu_Name.Text = reader["Name"].ToString();
            rbl_Stu_Sex.SelectedValue = reader["Sex"].ToString();
            txb_Stu_Class.Text = reader["Class"].ToString();
            txb_Stu_Passwd.Text = reader["Passwd"].ToString();
            txb_Stu_ID.Enabled = false;
            txb_Stu_Name.Enabled = false;
            rbl_Stu_Sex.Enabled = false;
            txb_Stu_Class.Enabled = false;
            txb_Stu_Passwd.Enabled = false;
        }

        btn_Add.Text = "修改";
        btnStuDel.Visible = true;
    }
    //学生信息删除
    protected void btnStuDel_Click(object sender, EventArgs e)
    {
        string queryStr = "delete from tb_Student where ID='" + txb_Stu_ID.Text + "'";
        if (SqlComNon(queryStr) == 1)
        {
            Response.Write("<script>alert('删除成功！')</script>");
        }
    }
}

