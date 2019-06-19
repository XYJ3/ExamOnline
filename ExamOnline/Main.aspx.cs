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

        lblID.Text = Session["ID"].ToString();
        lblName.Text = Session["Name"].ToString();
        lblSex.Text = Session["Sex"].ToString();
        lblSF.Text = Session["sf"].ToString();
        lblClass.Text = Session["Class"].ToString();
        GridView1_DataBind();
        if (GridView1.Rows[0] != null)
            Label1.Text = "当前没有考试";
        else
            Label1.Text = "您当前有待参加的考试！";
    }

    string getConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ExamOnlineConnectionString"].ConnectionString;
    }

    private void GridView1_DataBind()
    {
        string queryStr = "select ID,Name 考试名称,Course 考试科目,Class 班级,DataTime 考试时间 from tb_Exam where Class="+Convert.ToInt32(Session["Class"].ToString()) + " and (select count(*) from tb_Score where StudentID = " + Convert.ToInt32(Session["ID"].ToString()) + " and ExamID = tb_Exam.ID) = 0";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    

    protected void lblState_DataBinding(object sender, EventArgs e)
    {
        
    }

    

    protected void btnLoginOut_Click(object sender, EventArgs e)
    {

    }

    protected void btnInfo_Click(object sender, EventArgs e)
    {

    }
}