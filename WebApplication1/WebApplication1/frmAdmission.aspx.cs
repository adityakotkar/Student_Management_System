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
    public partial class frmAdmission : System.Web.UI.Page
    {
        public static int a;
        public static int b; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username1"] != null)
            {
                lblUsername.Text = Session["username1"].ToString();
            }
            else
            {
                Response.Redirect("frmAdmission.aspx");
            }

            if (!IsPostBack)
            {
                {

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                    SqlDataAdapter sda = new SqlDataAdapter("Select distinct subject from tbl_Subject", con);
                    con.Open();
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ddlSubject.DataSource = ds;
                    ddlSubject.DataTextField = "Subject";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Subject ----", "-1"));

                    con.Close();
                }
            }

            txtAddmissiondate.Text = System.DateTime.Now.ToShortDateString();
            
            if (!IsPostBack)
            {
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand("Select FirstName, MiddleName, LastName, Email_Id, Mobile_No, Subject, Total_Fees, Amt_Paid, Remaining_Amt, Admission_Date, Next_Installment_Date, Username, FullName from tbl_Admission", con1);
                con1.Open();
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                sda1.Fill(ds1);
                grvAdmission.DataSource = ds1;
                grvAdmission.DataBind();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("frmIndex.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Insert into tbl_Admission values(@FirstName, @MiddleName, @LastName, @Email_Id, @Mobile_No, @Subject, @Total_Fees, @Amt_Paid, @Remaining_Amt, @Admission_Date, @Next_Installment_Date, @Username, @Password, @FullName)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@FirstName", txtFirst.Text);
            cmd.Parameters.AddWithValue("@MiddleName", txtMiddle.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLast.Text);
            cmd.Parameters.AddWithValue("@Email_Id", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Mobile_No", txtMobile.Text);
            cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Total_Fees", txtTotalfee.Text);
            cmd.Parameters.AddWithValue("@Amt_Paid", txtAmountpaid.Text);
            cmd.Parameters.AddWithValue("@Remaining_Amt", txtRemaining.Text);
            cmd.Parameters.AddWithValue("@Admission_Date", txtAddmissiondate.Text);
            cmd.Parameters.AddWithValue("@Next_Installment_Date",DateTime.Now.AddMonths(1).ToShortDateString());
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@FullName", txtFirst.Text+' ' +txtMiddle.Text+ ' '+txtLast.Text );
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Data Sumitted Sucessfully');location.href = 'frmEnquiry.aspx';", true);

            if (!FileUpload1.HasFile)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Image To Change');", true);
                return;
            }
            if (FileUpload1.HasFile)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
                if (size > 500)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Image File Size Must Not Exceed 500 KB.');", true);
                    return;
                }
                //string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                string filename = txtEmail.Text.ToUpper() + ".jpg";//ToUpper() is use to save file name in upper case font
                FileUpload1.PostedFile.SaveAs(Server.MapPath("StudentPhoto/") + filename);// file name from text box
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data Sumitted Sucessfully');", true);

            }
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            txtUsername.Text = txtEmail.Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select Email_Id from tbl_Admission WHERE Email_Id=@Email_Id", con);
            Session["username1"] = txtUsername.Text; //Creating Session for user
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Email_Id", txtEmail.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows) //dr.HasRows means 'do we find what we need?'
            {
                Response.Write("<script>alert('Email ID is already exist')</script>");
            }
            con.Close();
        }

        protected void txtRemaining_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtTotalfee_TextChanged(object sender, EventArgs e)
        {
            a = Convert.ToInt32(txtTotalfee.Text);
            //b = Convert.ToInt32(txtAmountpaid.Text);
            txtRemaining.Text = (a - b).ToString();
            txtAmountpaid.Text = String.Empty;
            txtRemaining.Text = String.Empty;
           
        }
        protected void txtAmountpaid_TextChanged(object sender, EventArgs e)
        {
           
            a = Convert.ToInt32(txtTotalfee.Text);
            b = Convert.ToInt32(txtAmountpaid.Text);
            txtRemaining.Text = (a - b).ToString();
            if (b > a)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Please enter value less than total fees');location.href = 'frmAdmission.aspx';", true);

            }
        }

        protected void txtAddmissiondate_TextChanged(object sender, EventArgs e)
        {
            //txtInstallmentdate.Text = System.DateTime.Now.AddMonths(1).ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //for deleting row
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string Email_Id = grvAdmission.Rows[rowindex].Cells[4].Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from tbl_Admission where Email_Id=@Email_Id", con);
            cmd.Parameters.AddWithValue("@Email_Id", Email_Id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Record Deleted');location.href = 'frmAdmission.aspx';", true);
   
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * from tbl_Subject where Subject = @Subject", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedItem.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {//dr[1,2,3,4,.....] use to indexing the database table
                txtTotalfee.Text = dr[2].ToString();
            }
            con.Close();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {

        }

       
    }
}