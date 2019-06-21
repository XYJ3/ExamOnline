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
                Session["sf"] = "学生";
                break;
            case 1:
                tbName = "tb_Teacher";
                Session["sf"] = "教师";
                break;
            case 2:
                tbName = "tb_Admin";
                Session["sf"] = "管理员";
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
            {
                Response.Write("<script>alert('登录成功！')</script>");
                Session["ID"] = reader["ID"];
                Session["Name"] = reader["Name"];
                Session["Sex"] = reader["Sex"];
                if ("学生" == Session["sf"].ToString()) 
                {
                    Session["Class"] = reader["Class"];
                    Response.Redirect("Student.aspx");
                }

                if ("教师" == Session["sf"].ToString())
                {
                    Session["Course"] = reader["Course"];
                    Response.Redirect("Teacher.aspx");
                }
                else
                {
                    Response.Redirect("Admin.aspx");
                }
 
            }
            else
                Response.Write("<script>alert('失败')</script>");
        }

}
}