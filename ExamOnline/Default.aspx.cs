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
        GridView1_DataBind();
        
    }

    string getConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ExamOnlineConnectionString"].ConnectionString;
    }

    private void GridView1_DataBind()
    {
        string queryStr = "select * from tb_Exam where Class= '1701' and (select count(*) from tb_Score where StudentID = '11001' and ExamID = tb_Exam.ID) = 0";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(queryStr, conn);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}