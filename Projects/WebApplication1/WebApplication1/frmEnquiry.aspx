<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEnquiry.aspx.cs" Inherits="FinalProject.frmEnquiry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Enquiry</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/animate.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/background.jpg)">
    <asp:Label ID="lblUsername" runat ="server" Visible="False"></asp:Label>
    <br />
    <form id="form1" runat="server" style="text-align:center">
        <h1><u style="color:red;background-color:yellow"><b>STUDENT ENQUIRY FORM</b></u></h1>
    <div class ="container-fluid">
        <div class ="row"> 
            <div class="col-lg-12" style ="text-align :center">
                <br /><br />
                <div class="row">
                    <div class="offset-1 col-lg-2">
                    <asp:TextBox ID="txtFullName" Class ="rounded"  runat="server" placeholder ="Enter Full Name" ControlToValidate="txtFullName" ValidationGroup="a"></asp:TextBox><br />         
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Full Name" ControlToValidate="txtFullName" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                        </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtMobile" Class ="rounded" CausesValidation ="True" runat="server" placeholder ="Enter Contact No." MaxLength="10" ControlToValidate="txtMobile" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Contact No" ControlToValidate="txtMobile" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>&nbsp&nbsp
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" style="color:red" ErrorMessage="Enter Number" Display="Static" ControlToValidate="txtMobile" ValidationExpression="\d+" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtEmail" Class ="rounded" runat="server" placeholder ="Enter Email Id" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtEmail" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>&nbsp&nbsp
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Email" Style ="color:red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="ddlstatus" runat="server" required="true" style="text-align:center" CausesValidation="True" ValidationGroup="a"></asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="ddlstatus" ErrorMessage="Select Subject"  style="color:red" InitialValue="-1" ValidationGroup="a" ></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtFeedback" Class ="rounded" runat="server" placeholder="Feedback(Max 50 Character)" MaxLength="50" ValidationGroup="a"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Feedback" ControlToValidate="txtFeedback" Style ="color:red" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <br /><br />
                <asp:Button ID="btnSubmit" class="btn btn-success" runat="server" Text="Submit" style="width:150px" OnClick="btnSubmit_Click" ValidationGroup="a" />&nbsp&nbsp
                <asp:Button ID="btnExport" class="btn btn-warning" runat="server" Text="Export to Pdf" style="width:150px"/>&nbsp&nbsp
                 <a class="btn btn-dark" href="adminDashboard.aspx" style="width:150px">Dashboard</a>&nbsp&nbsp
                <asp:Button ID="btnLogout" class="btn btn-danger" runat="server" Text="Logout" style="width:150px" OnClick="Button3_Click" OnClientClick="return confirm ('Are you sure?');"/>&nbsp&nbsp

                
            </div>
           
            <div class ="col-lg-12">
                 <br /><br />
                <asp:GridView ID="grvEnquiry" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="100%" style="text-align:center">
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
    </div>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        $("body").on("click", "#btnExport", function () {
            html2canvas($('[id*=grvEnquiry]')[0], {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("ENQUIRY.pdf");
                }
            });
        });
    </script>


    </form>
</body>
</html>
