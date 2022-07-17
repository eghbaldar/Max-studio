<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Offer.aspx.vb" Inherits="Offer" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <style type="text/css">
        .style1
        {
            width: 100%;
            color: #DDDDDD;
            font-family:Tahoma;
            font-size:11px;
        }
        .style2
        {
         width: 197px;
         text-align: right;
     }
        .style3
        {
            color: #D1D1D1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="GalleryBar">
        <img src="Content/Images/Design/offer.gif" />
    </div>
    <div id="conetntGallery" style="direction: ltr; margin-top: 20px; margin-left:100px; position:absolute;
        float:none;">
        <pre>




</pre>
        <table class="style1" style="background-image: url('Content/Images/BG_2.jpg')">
        <tr>
            <td class="style2">
                Name:</td>
            <td class="style3">
                <asp:TextBox ID="txtName" runat="server" BackColor="#DE9007" BorderStyle="None" 
                    style="text-align: left; color: #FFFFFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
        </tr>
        <tr>
            <td class="style2">
                Email:</td>
            <td class="style3">
                <asp:TextBox ID="txtEmail" runat="server" BackColor="#333333" 
                    BorderStyle="None" style="text-align: left; color: #FFFFFF"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="*" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="1"></asp:RegularExpressionValidator>
                                    </td>
        </tr>
        <tr>
            <td class="style2">
                Subject:</td>
            <td class="style3">
                <asp:TextBox ID="txtTitle" runat="server" BackColor="#333333" 
                    BorderStyle="None" style="text-align: left; color: #FFFFFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtTitle" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
        </tr>
        <tr>
            <td class="style2">
                Your Text:</td>
            <td class="style3">
                <asp:TextBox ID="txtMessage" runat="server" Height="263px" TextMode="MultiLine" 
                    Width="523px" BackColor="#333333" BorderStyle="None" 
                    style="text-align: left; color: #FFFFFF"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtMessage" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text="Send" BorderStyle="None" 
                    style="font-family: Tahoma; font-size: 11px" ValidationGroup="1" 
                    Height="16px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Label ID="lblSuc" runat="server" style="color: #FFCC00"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
