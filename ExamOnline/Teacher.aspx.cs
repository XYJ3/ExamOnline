using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            lblName.Text = Session["Name"].ToString();
            lblSex.Text = Session["Sex"].ToString();
            lblSF.Text = Session["SF"].ToString();
            lblCourse.Text = Session["Course"].ToString();
            Panel_TextAdd.Visible = false;
            Panel_Score.Visible = false;
            Panel_Put.Visible = false;
        }
    }

    string getConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ExamOnlineConnectionString"].ConnectionString;
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

    
    protected void btnTextIns_Click(object sender, EventArgs e)
    {
        //修改
        if (btnTextIns.Text == "确定")
        {
            string queryStr = "update tb_Test SET Problem='" + txbProblem.Text + "',AnsA='" + txbAnsA.Text + "',AnsB='" + txbAnsB.Text + "',AnsC='" + txbAnsC.Text + "',AnsD='" + txbAnsD.Text + "',RightAns='" + txbRightAns.Text + "',Course='" + dpl_Find_Course.SelectedValue + "',Type='" + dpl_Find_Type.SelectedValue + "' where ID = '" + Session["selectID"].ToString() + "'";
            if (SqlComNon(queryStr) == 1)
            {
                Response.Write("<script>alert('修改成功！')</script>");
            }
        }
        if (btnTextIns.Text == "修改")
        {
            btnTextIns.Text = "确定";
            btnTestDel.Visible = false;

            txbProblem.Enabled = true;
            txbAnsA.Enabled = true;
            txbAnsB.Enabled = true;
            txbAnsC.Enabled = true;
            txbAnsD.Enabled = true;
            txbRightAns.Enabled = true;
            dplCourse.Enabled = true;
            dpl_Find_Type.Enabled = true;
        }
        
        //添加
        else
        {
            string SqlStr = "select max(ID) from tb_Test";
            SqlConnection conn = new SqlConnection(getConnectionString());
            SqlCommand com = new SqlCommand(SqlStr, conn);
            conn.Open();
            int proID = Convert.ToInt32(com.ExecuteScalar()) + 1;
            
            string queryStr = "insert into tb_Test (ID,Problem,AnsA,AnsB,AnsC,AnsD,RightAns,Course,Type) values (" +proID+",'"+ txbProblem.Text + "','" + txbAnsA.Text + "','" + txbAnsB.Text + "','" + txbAnsC.Text + "','" + txbAnsD.Text + "','" + txbRightAns.Text + "','" + dplCourse.SelectedValue + "','" + dplType.SelectedValue + "')";
            if (SqlComNon(queryStr) == 1)
            {
                Response.Write("<script>alert('添加成功！')</script>");
                txbProblem.Text = "";
                txbAnsA.Text = "";
                txbAnsB.Text = "";
                txbAnsC.Text = "";
                txbAnsD.Text = "";
                txbRightAns.Text = "";
            }
        }
    }
    //录入按钮
    protected void btnTestAdd_Click(object sender, EventArgs e)
    {
        Panel_TextAdd.Visible = true;
        btnTextIns.Text = "提交";
        btnTestDel.Visible = false;
        GridView1.Visible = false;
        txbProblem.Text = "";
        txbAnsA.Text = "";
        txbAnsB.Text = "";
        txbAnsC.Text = "";
        txbAnsD.Text = "";
        txbRightAns.Text = "";
        txbProblem.Enabled = true;
        txbAnsA.Enabled = true;
        txbAnsB.Enabled = true;
        txbAnsC.Enabled = true;
        txbAnsD.Enabled = true;
        txbRightAns.Enabled = true;
        dplCourse.Enabled = true;
        dpl_Find_Type.Enabled = true;
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        string queryStr = "select * from tb_Test";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        Panel_TextAdd.Visible = false;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnTextIns.Text = "修改";
        Panel_TextAdd.Visible = true;
        btnTestDel.Visible = true;
        string queryStr = "select * from tb_Test where ID='" + GridView1.SelectedValue + "'";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader reader = com.ExecuteReader();
        if(reader.Read())
        {
            Session["selectID"] = reader["ID"].ToString();
            txbProblem.Text = reader["Problem"].ToString();
            txbAnsA.Text = reader["AnsA"].ToString();
            txbAnsB.Text = reader["AnsB"].ToString();
            txbAnsC.Text = reader["AnsC"].ToString();
            txbAnsD.Text = reader["AnsD"].ToString();
            txbRightAns.Text = reader["RightAns"].ToString();
            dplCourse.SelectedValue = reader["Course"].ToString();
            dplType.SelectedValue = reader["Type"].ToString();
        }
        txbProblem.Enabled = false;
        txbAnsA.Enabled = false;
        txbAnsB.Enabled = false;
        txbAnsC.Enabled = false;
        txbAnsD.Enabled = false;
        txbRightAns.Enabled = false;
        dplCourse.Enabled = false;
        dplType.Enabled = false;
    }
    //试题检索
    protected void btnTestFind_Click(object sender, EventArgs e)
    {
        string queryStr = "select * from tb_Test ";
        if (dpl_Find_Course.SelectedIndex != 0 && dpl_Find_Type.SelectedIndex != 0)
        {
            queryStr += " where Course='" + dpl_Find_Course.SelectedValue + "' and Type='" + dpl_Find_Type.SelectedValue + "'";
        }
        else
        {
            if (dpl_Find_Course.SelectedIndex != 0)
                queryStr += " where Course='" + dpl_Find_Course.SelectedValue + "'";
            if(dpl_Find_Type.SelectedIndex != 0)
                queryStr += " where Course='" + dpl_Find_Type.SelectedValue + "'";
        }


        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        Panel_TextAdd.Visible = false;
        GridView1.Visible = true;
    }
    //删除试题
    protected void btnTestDel_Click(object sender, EventArgs e)
    {
        string queryStr = "delete from tb_test where ID='" + Session["selectID"] + "'";
        if (SqlComNon(queryStr) == 1)
        {
            Response.Write("<script>alert('删除成功！')</script>");
        }
    }

    protected void btnLoginOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    //试题管理按钮
    protected void btnTest_Click(object sender, EventArgs e)
    {
        Panel_Test.Visible = true;
        Panel_Score.Visible = false;
        Panel_Put.Visible = false;
    }

    //考试成绩按钮
    protected void btnExamSco_Click(object sender, EventArgs e)
    {
        Panel_Score.Visible = true;
        Panel_Test.Visible = false;
        Panel_TextAdd.Visible = false;
        Panel_Put.Visible = false;
    }
    //发布考试按钮
    protected void btnPutExam_Click(object sender, EventArgs e)
    {
        Panel_Put.Visible = true;
        Panel_Score.Visible = false;
        Panel_Test.Visible = false;

    }
    //发布试题
    protected void btnPE_Click(object sender, EventArgs e)
    {
        int proID = 0;
        string SqlStr = "select max(ID) from tb_Exam";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(SqlStr, conn);
        conn.Open();
        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read())
        {
            proID = Convert.ToInt32(reader[0]) + 1;
        }


        string queryStr = "insert into tb_Exam (ID,Name,DateTime,Class,Course,Nom) values (" + proID + ",'" + txbEName.Text.Trim() + "','" + DateTime.Now + "','" + Convert.ToInt32(txbEClass.Text) + "','" + DropDownList1.SelectedValue + "'," + Convert.ToInt32(txbDan.Text) + ")";
        if (SqlComNon(queryStr) == 1)
        {
            Response.Write("<script>alert('发布成功！')</script>");
        }
    }
}