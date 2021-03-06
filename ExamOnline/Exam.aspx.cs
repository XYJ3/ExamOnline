﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Exam : System.Web.UI.Page
{
    public string ExamID;
    protected void Page_Load(object sender, EventArgs e)
    {
        ExamID = Request["ID"];
        lblID.Text = Session["ID"].ToString();
        lblName.Text = Session["Name"].ToString();
        lblSex.Text = Session["Sex"].ToString();
        lblClass.Text = Session["CLass"].ToString();
        lblSF.Text = Session["SF"].ToString();
        
        if (!IsPostBack)
        {
            Session["flag"] = 0;
            string queryStr = "select * from tb_Exam where ID=" + ExamID;
            SqlConnection conn = new SqlConnection(getConnectionString());
            SqlCommand commed = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader reader = commed.ExecuteReader();
            int nom = 0;
            if (reader.Read())
            {

                lblExamName.Text = reader["Name"].ToString();
                Session["KM"] = reader["Course"].ToString();
                nom = Convert.ToInt32(reader["Nom"].ToString());
            }
            reader.Close();
            Session["tNom"] = nom;
            SqlCommand cmd = new SqlCommand("select top " + nom + " * from tb_Test where Course='" + Session["KM"].ToString() + "' order by newid()", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(dt);
            Session["dt"] = dt;    //获取考题，并存入session
            conn.Close();
        }
        
        StartExam();
    }

    protected void btnInfo_Click(object sender, EventArgs e)
    {

    }

    protected void btnLoginOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    string getConnectionString()
    {
        return WebConfigurationManager.ConnectionStrings["ExamOnlineConnectionString"].ConnectionString;
    }


    
    string[] RightAns = new string[100];//记录正确答案
    int xi = 0, ti = 0;     //下标
    int[] x = new int[100];  //记录选择题题号
    int[] t = new int[100];  //记录填空题题号
    //随机抽出试题
    private void StartExam()
    {
        int nom = Convert.ToInt32(Session["tNom"]);
        int i = 1;
                  
        int j = 0;
        DataTable dt = (DataTable)Session["dt"];
        while (j < dt.Rows.Count)
        {

            DataRow sdr = dt.Rows[j];
            if (sdr["Type"].ToString() == "选择")
            {
                Literal litXuan = new Literal();             //创建Literal控件
                Literal litti = new Literal();                  //创建Literal控件
                RadioButtonList cbk = new RadioButtonList();    //创建RadioButtonList控件
                cbk.ID = "cbk" + i.ToString();
                litXuan.Text = i.ToString() + "、" + Server.HtmlEncode(sdr["Problem"].ToString()) + "<br><Blockquote>";
                litti.Text = "</Blockquote>";
                cbk.Items.Add("A. " + Server.HtmlEncode(sdr["AnsA"].ToString()));   //添加选项A
                cbk.Items.Add("B. " + Server.HtmlEncode(sdr["AnsB"].ToString()));   //添加选项B
                cbk.Items.Add("C. " + Server.HtmlEncode(sdr["AnsC"].ToString()));   //添加选项C
                cbk.Items.Add("D. " + Server.HtmlEncode(sdr["AnsD"].ToString()));   //添加选项D
                cbk.Font.Size = 11;

                cbk.Items[0].Value = "A";
                cbk.Items[1].Value = "B";
                cbk.Items[2].Value = "C";
                cbk.Items[3].Value = "D";


                RightAns[i] = sdr["RightAns"].ToString();                       //获取试题的正确答案
                x[xi] = i;
                xi++;
                Panel1.Controls.Add(litXuan);                    //将控件添加到Panel中
                Panel1.Controls.Add(cbk);                       //将控件添加到Panel中
                Panel1.Controls.Add(litti);                 //将控件添加到Panel中
                i++;                                            //使i递增
            }
            else
            {
                Literal litTian = new Literal();             
                Literal litti = new Literal();
                TextBox textBox = new TextBox(); 
                textBox.ID = "txbti" + i.ToString();
                litTian.Text = i.ToString() + "、" + Server.HtmlEncode(sdr["Problem"].ToString()) + "<br><Blockquote>";
                litti.Text = "</Blockquote>";
                
                textBox.Font.Size = 11;
                
                RightAns[i] = sdr["RightAns"].ToString();
                t[ti] = i;
                ti++;
                Panel1.Controls.Add(litTian);                    //将控件添加到Panel中
                Panel1.Controls.Add(textBox);                       //将控件添加到Panel中
                Panel1.Controls.Add(litti);                 //将控件添加到Panel中
                i++;
            }
            j++;
        }
            
    }
    //交卷
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int nom = Convert.ToInt32(Session["tNom"]);
        string[] Ans = new string[100];
        for (int i=0;i<=xi;i++)
        {
            RadioButtonList list = (RadioButtonList)Panel1.FindControl("cbk" + x[i].ToString());
            if (list != null)
            {
                if (list.SelectedValue.ToString() != "")
                    Ans[x[i]] = list.SelectedValue.ToString();//存储考生答案
                else
                    Ans[x[i]]= "";
            }
        }
        for (int i = 0; i <= ti; i++)
        {
            TextBox txb = (TextBox)Panel1.FindControl("txbti" + t[i].ToString());
            if (txb != null)
            {
                if (txb.Text.ToString() != "")
                    Ans[t[i]] = txb.Text.ToString();//存储考生答案
                else
                    Ans[t[i]] = "";
            }
        }
        int score = 0;
        for (int a = 1; a <= nom; a++)
        {
            if (RightAns[a] == Ans[a])
            {
                score += 5;
            }
        }
        string sqlstring = "insert into tb_Score (StudentID,Course,Score,ExamID) values ('" + lblID.Text + "','" + Session["KM"].ToString() + "'," + score + ",'" + ExamID + "')";
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand com = new SqlCommand(sqlstring, conn);
        conn.Open();
        if(com.ExecuteNonQuery()==1)
        {
            Response.Write("<script>alert('总分：" + score + "')</script>");
            Response.Redirect("Student.aspx");
        }
    }
}