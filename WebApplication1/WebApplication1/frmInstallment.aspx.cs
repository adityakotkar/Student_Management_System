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
    public partial class frmInstallment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username1"] != null)
            {
                lblUsername.Text = Session["username1"].ToString();
               
            }
            else
            {
                Response.Redirect("frmInstallment.aspx");
            }

            if (!IsPostBack)
            {
                {

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                    SqlDataAdapter sda = new SqlDataAdapter("Select distinct FullName from tbl_Admission", con);
                    con.Open();
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ddl_Name.DataSource = ds;
                    ddl_Name.DataTextField = "FullName";
                    ddl_Name.DataBind();
                    ddl_Name.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Student Name ----", "-1"));

                    con.Close();
                }

            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("frmIndex.aspx");
        }

        protected void ddl_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * from tbl_Admission where FullName = @FullName", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@FullName", ddl_Name.SelectedItem.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {//dr[1,2,3,4,.....] use to indexing the database table
                txtContactno.Text = dr[5].ToString();
                txtEmailid.Text = dr[4].ToString();
                txtSubject.Text = dr[6].ToString();
                txtTotalfees.Text = dr[7].ToString();
                txtRemainingfees.Text = dr[9].ToString();
                txtAdmissiondate.Text = dr[10].ToString();
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Update tbl_Admission set Amt_Paid = @Amt_Paid, Remaining_Amt = @Remaining_Amt, Next_Installment_Date = @Next_Installment_Date where FullName = @FullName", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            cmd.Parameters.AddWithValue("@FullName", ddl_Name.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Amt_Paid", txtAmtpaying.Text);
            cmd.Parameters.AddWithValue("@Remaining_Amt", txtRemainingfees.Text);
            cmd.Parameters.AddWithValue("@Next_Installment_Date", txtNextinstdate.Text);
            cmd.ExecuteNonQuery();
            con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Data Submitted Sucessfully');location.href = 'frmInstallment.aspx';", true);
            
        }

        protected void txtRemainingfees_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAmtpaying_TextChanged(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtRemainingfees.Text);
            int b = Convert.ToInt32(txtAmtpaying.Text);
            txtRemainingfees.Text = (a - b).ToString();
            int c = Convert.ToInt32(txtRemainingfees.Text);
            if (b > a)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Please enter value less than remaining fees');location.href = 'frmInstallment.aspx';", true);

            }
            if (c == 0)
            {
                txtNextinstdate.Visible = false;
            }
            else
            {
                txtNextinstdate.Text = DateTime.Now.AddMonths(1).ToShortDateString();

            }
        }
    }
}