<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="About.aspx.vb" Inherits="AboutUs" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="GalleryBar">
        <img src="Content/Images/Design/AboutUs.gif" />
    </div>
    <div id="conetntGallery" style="direction:ltr; margin-top: 20px; margin-right: 10px;float: right">
        <asp:Label ID="lblAbout" runat="server" Text="" 
            style="color: #EAEAEA; font-family: Tahoma; font-size: 11px"></asp:Label>
    </div>
</asp:Content>
