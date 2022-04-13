﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmNews.aspx.cs" Inherits="FinalProject.frmNews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Latest News</title>
 <link href="CSS/animate.css" rel="stylesheet" />
    <link href="CSS/bootstrap.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/background.jpg)">
    <asp:Label ID="lblUsername" runat ="server" Visible="False"></asp:Label>

    <form id="form1" runat="server" style="text-align:center">
       <br /> <h1 style="color:black"><b>ENTER LATEST NEWS</b></h1>
   <div class ="container-fluid">
        <div class ="row">
            <div class="col-lg-12">


                <br /><asp:TextBox ID="txtNews" runat="server" Width="1200px" Class ="rounded" placeholder ="Please Enter News here (Max Length: 100) :" Height="170px" Style ="background-color:brown; color:white; text-align:start" MaxLength="100"></asp:TextBox>&nbsp&nbsp
                
                <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter News" ControlToValidate="txtNews" Style ="color:red"></asp:RequiredFieldValidator>&nbsp&nbsp
                <br />
                <asp:Button ID="btnSubmit" class="btn btn-success" runat="server" Text="Submit" style="width:150px" OnClick="btnSubmit_Click" />&nbsp&nbsp
                <asp:Button ID="btnLogout" class="btn btn-danger" runat="server" Text="Logout" style="width:150px" OnClientClick="return confirm ('Are you sure?');" OnClick="btnLogout_Click"/>&nbsp&nbsp
                <a class="btn btn-dark" href="adminDashboard.aspx" style="width:150px">Dashboard</a>&nbsp&nbsp
                

            </div>
    </div>
    </div>
    </form>
</body>
</html>
