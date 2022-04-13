<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdmission.aspx.cs" Inherits="FinalProject.frmAdmission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Admission</title>
    <link href="CSS/animate.css" rel="stylesheet" />
    <link href="CSS/bootstrap.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/background.jpg)">
    <asp:Label ID="lblUsername" runat ="server" Visible="False"></asp:Label>
    <br />
    <form id="form1" runat="server" style="text-align:center">
        
   <div class ="container-fluid">
       <h1><u style="color:red;background-color:yellow"><b>STUDENT ADDMISSION FORM</b></u></h1><br /><br />
                <div class="row">
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtFirst" runat="server" Class ="rounded" placeholder ="FirstName" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter First Name" ControlToValidate="txtFirst" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtMiddle" runat="server" Class ="rounded" placeholder ="MiddleName" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Middle Name" ControlToValidate="txtMiddle" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtLast" runat="server"  Class ="rounded" placeholder ="LastName" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="txtLast" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtEmail" runat="server" Class ="rounded" placeholder ="Email Id" AutoPostBack="True" OnTextChanged="txtEmail_TextChanged" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtEmail" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>&nbsp&nbsp
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style ="color:red" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtMobile" runat="server" Class ="rounded" placeholder ="Mobile Number" CausesValidation="True" MaxLength="10" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Mobile Number" ControlToValidate="txtMobile" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>&nbsp&nbsp
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Number"  style="color:red" Display="Static" ValidationExpression="\d+" ControlToValidate="txtMobile" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="ddlSubject" runat="server" Class ="rounded" CausesValidation="True" style ="text-align:center" AutoPostBack="True" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged"></asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Subject" ControlToValidate="ddlSubject" Style ="color:red" InitialValue="-1" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
                    </div>

       <div class="row">
           <div class="offset-1 col-lg-2">
               <asp:TextBox ID="txtTotalfee" runat="server" Class ="rounded" placeholder ="Total Fees" AutoPostBack="True" OnTextChanged="txtTotalfee_TextChanged" ValidationGroup="a"></asp:TextBox><br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Total Fees" ControlToValidate="txtTotalfee" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                
           </div>
           <div class="col-lg-2">
               <asp:TextBox ID="txtAmountpaid" runat="server" Class ="rounded" placeholder ="Amount Paid" AutoPostBack="True" OnTextChanged="txtAmountpaid_TextChanged" ValidationGroup="a"></asp:TextBox><br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Amount Paid" ControlToValidate="txtAmountpaid" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                
           </div>
           <div class="col-lg-2">
               <asp:TextBox ID="txtRemaining" runat="server" Class ="rounded" placeholder ="Remaining Amount" AutoPostBack="True" OnTextChanged="txtRemaining_TextChanged" BackColor="#CCCCCC" ReadOnly="True" ValidationGroup="a"></asp:TextBox><br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Remaining Fees" ControlToValidate="txtRemaining" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                
           </div>
           <div class="col-lg-2">
                <asp:TextBox ID="txtAddmissiondate" runat="server" Class ="rounded" placeholder ="Admission Date(eg.10-Jan-2021)" AutoPostBack="True" OnTextChanged="txtAddmissiondate_TextChanged" ValidationGroup="a" ></asp:TextBox><br />
                <%--<asp:TextBox ID="txtInstallmentdate" runat="server" Width="200px" required="true" Class ="rounded" placeholder ="Installment Date(eg.10-Jan-2021)" ></asp:TextBox>&nbsp&nbsp--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Admission Date" ControlToValidate="txtAddmissiondate" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                
           </div>
           <div class="col-lg-2">
               <asp:TextBox ID="txtUsername" runat="server" Class ="rounded" placeholder ="Student Username" BackColor="#CCCCCC" ReadOnly="True" ValidationGroup="a"></asp:TextBox><br />
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Vaild Username" ControlToValidate="txtUsername" Style ="color:red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a"></asp:RegularExpressionValidator>

           </div>
       </div>

       <<div class="row">
           <div class="offset-3 col-lg-2">
               <asp:TextBox ID="txtPassword" runat="server" Class ="rounded" placeholder ="Student Password" TextMode="Password" ValidationGroup="a" ></asp:TextBox><br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                
           </div>
           <div class="col-lg-2">
               <asp:TextBox ID="txtRepassword" runat="server" Class ="rounded" placeholder ="Re-Enter Password" TextMode="Password" ValidationGroup="a"></asp:TextBox><br />
               <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Matched" ControlToCompare="txtPassword" ControlToValidate="txtRepassword" Style ="color:red" ValidationGroup="a"></asp:CompareValidator>

           </div>
           <div class="col-lg-2">
               <asp:FileUpload ID="FileUpload1" runat="server" style ="color:red"/>
                
           </div>
        </div>

       <div class="row">
           <div class="col-lg-3">
               <asp:Button ID="btnSubmit" class="btn btn-success" runat="server" Text="Submit" style="width:100%" OnClick="btnSubmit_Click" ValidationGroup="a" />

           </div>
           <div class="col-lg-3">
               <asp:Button ID="btnExport" class="btn btn-warning" runat="server" Text="Export to Pdf" style="width:100%" OnClick="btnExport_Click"/>

           </div>
           <div class="col-lg-3">
               <a class="btn btn-dark" href="adminDashboard.aspx" style="width:100%">Dashboard</a>

           </div>
           <div class="col-lg-3">
               <asp:Button ID="btnLogout" class="btn btn-danger" runat="server" Text="Logout" style="width:100%" OnClientClick="return confirm ('Are you sure?');" OnClick="btnLogout_Click"/>

           </div>
       </div>
            </div>

        <div class ="col-lg-12">
                 <br /><br />
            <div style ="overflow-x:scroll">
                <asp:GridView ID="grvAdmission" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="100%" style="text-align:center ; font-size:10px">
                     <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" Text="Delete" OnClick="Button1_Click" OnClientClick="return confirm('are you sure?')" ValidationGroup="b" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                </div>
            </div>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        $("body").on("click", "#btnExport", function () {
            html2canvas($('[id*=grvAdmission]')[0], {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Admission.pdf");
                }
            });
        });
    </script>
    </form>
</body>
</html>
