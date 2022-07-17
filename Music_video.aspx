<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Music_video.aspx.vb" Inherits="Muisc_video" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 107%;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style2
        {
            font-family: Tahoma;
            color: #F3F3F3;
            font-weight: bold;
            font-size: small;
            text-align: left;
            height: 21px;
        }

        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 131px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="GalleryBar">
        <img src="Content/Images/Design/music_Viedo.gif" />
    </div>

        <div id="conetntGallery" 
        style="direction: rtl; margin-top: 20px; margin-right: 10px;        float: right; width: 799px;">
        
        <table class="style1">
            <tr>
                <td class="style2">
                    Music & Video</td>
            </tr>
            <tr>
                <td style="background-color: #1C1C1C">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                        Width="850px">
                        <ItemTemplate>
                            <table class="style3">
                                <tr>
                                    <td class="style4">
                                        <asp:Image ID="Image1" runat="server" BorderColor="#3E3E3C" BorderStyle="Solid" 
                                            BorderWidth="3px" Height="117px" 
                                            ImageUrl='<%# Eval("PicName", "~\Presentation\CMS\FileUpload\ImageUpload\{0}") %>' 
                                            Width="137px" />
                                    </td>
                                    <td>
                                        <table class="style3">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" 
                                                        style="font-weight: 700; color: #D7D7D7; font-size: 14px" 
                                                        Text='<%# Eval("Title", "{0}") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" style="color: #FFFFFF" 
                                                        Text='<%# Eval("ShortDesc", "{0}") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                                        NavigateUrl='<%# Eval("FileName", "~\Presentation\CMS\FileUpload\FileUpload\{0}") %>' 
                                                        style="color: #CC3300;text-decoration:none;">دانلود...</asp:HyperLink>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                        SelectCommand="SELECT [Title], [ShortDesc], [PicName], [FileName] FROM [Tbl_FileUpload] WHERE ([Flag] = @Flag)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="Flag" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        
    </div>

</asp:Content>

