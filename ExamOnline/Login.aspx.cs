using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Login1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //验证码模块
    private void YanZhengMa()
    {

    }

    string getConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ExamOnlineConnectionString"].ConnectionString;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string tbName = "";
        switch (rbtlLogin.SelectedIndex)
        {
            case 0:
                tbName = "tb_Student";
                break;
            case 1:
                tbName = "tb_Student";
                break;
            case 2:
                tbName = "tb_Admin";
                break;
        }
            

        using (SqlConnection conn = new SqlConnection(getConnectionString()))
        {
            string sqlStr = "SELECT * FROM " + tbName + " WHERE ID=" + Convert.ToInt32(Request["user"].ToString().Trim()) + " and Passwd='" + Request["password"].ToString().Trim() + "'";
            SqlCommand command= new SqlCommand();
            command.Connection = conn;
            command.CommandTimeout = 15;
            command.CommandType = CommandType.Text;
            command.CommandText = sqlStr;
            conn.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
                Response.Write("<script>alert('fdge')</script>");
            else
                Response.Write("<script>alert('失败')</script>");
        }

}
}