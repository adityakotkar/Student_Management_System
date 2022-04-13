﻿using System;
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
    public partial class frmBlogofadmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username1"] != null)
            {
                lblUsername.Text = Session["username1"].ToString();
            }
            else
            {
                Response.Redirect("frmBlogofadmin.aspx");
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            string str = "Select * from tbl_Blog";//we can use sql cmd class also
            SqlDataAdapter adpt = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            txtBlog.Text += ds.Tables[0].Rows[0]["Blog"].ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("frmIndex.aspx");
        }
    }
}