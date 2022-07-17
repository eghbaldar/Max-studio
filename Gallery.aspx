<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Gallery.aspx.vb" Inherits="Gallery" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 7px;
        }
    </style>
    

    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="GalleryBar">
        <img src="Content/Images/Design/Gallery.gif" />
    </div>
    <div id="conetntGallery" style="direction: rtl; margin-top: 20px; margin-right: 10px;
        float: right">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            Height="16px" Width="331px">
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style2">
                            <img alt="" src="Content/Images/photo.png" style="width: 28px; height: 29px" /></td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# Eval("Code_Category", "~\Photos.aspx?ID={0}") %>' 
                                Style="color: #E5E5E5; font-family: Tahoma; font-size: 11px; text-decoration: none;" 
                                Text='<%# Eval("Name_Category", "{0}") %>'></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>"
            SelectCommand="SELECT * FROM [Tbl_GalleryCategory]"></asp:SqlDataSource>
    </div>
</asp:Content>
