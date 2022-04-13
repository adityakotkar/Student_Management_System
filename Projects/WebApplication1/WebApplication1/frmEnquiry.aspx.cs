using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Security.Permissions;
using System.IO;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Web.UI.WebControls.WebParts;

namespace FinalProject
{
    public partial class frmEnquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username1"] != null)
            {
                lblUsername.Text = Session["username1"].ToString();
            }
            else
            {
                Response.Redirect("frmEnquiry.aspx");
            }

            if (!IsPostBack)
            {
                {
                   
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                    SqlDataAdapter sda = new SqlDataAdapter("Select distinct subject from tbl_Subject", con);
                    con.Open();
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ddlstatus.DataSource = ds;
                    ddlstatus.DataTextField = "Subject";
                    ddlstatus.DataBind();
                    ddlstatus.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Subject ----", "-1"));
                    
                    con.Close();
                    //DropDownList1.Items.Clear();
                    //DropDownList1.Items.Add("Asp.Net");
                    //DropDownList1.Items.Add("Java");
                    //DropDownList1.Items.Add("PHP");
                }
            }
            if (!IsPostBack)
            {
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand("Select FullName as 'Full Name', Mobile, Email, Subject, Feedback from tbl_Enquiry", con1);
                con1.Open();
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                sda1.Fill(ds1);
                grvEnquiry.DataSource = ds1;
                grvEnquiry.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("frmIndex.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Insert into tbl_Enquiry values(@FullName, @Mobile, @Email, @Subject, @Feedback)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Subject", ddlstatus.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Feedback", txtFeedback.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Data Sumitted Sucessfully');location.href = 'frmEnquiry.aspx';", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //for deleting row
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string Email = grvEnquiry.Rows[rowindex].Cells[3].Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from tbl_Enquiry where Email=@Email", con);
            cmd.Parameters.AddWithValue("@Email", Email);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Record Deleted');location.href = 'frmEnquiry.aspx';", true);
   
        }
    }
}