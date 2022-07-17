<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="History.aspx.vb" Inherits="History" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="GalleryBar">
        <img src="Content/Images/Design/History.gif" />
    </div>
    <div id="conetntGallery" style="direction:rtl; margin-top: 20px; margin-right: 10px;float: right">
        <asp:Label ID="lblHistory" runat="server" Text="" 
            style="color: #EAEAEA; font-family: Tahoma; font-size: 11px"></asp:Label>
    </div>
</asp:Content>

