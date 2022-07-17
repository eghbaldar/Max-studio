<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Article.aspx.vb" Inherits="Presentation_CMS_Article_Article" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style15
        {
            width: 60%;
        }
        .style9
        {
            width: 68%;
        }
        .style14
        {
            text-align: center;
        }
        .style16
        {
            width: 85%;
            height: 55px;
        }
        .style17
        {
            width: 654px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<%----%>
    <img alt="" src="../../images_Items/Header.jpg" 
        style="width: 687px; height: 45px" /></div>
<table class="style15">
        <tr>
            <td class="style17">
    
    <table class="style9">
        <tr>
            <td>
                <table class="style9">
                    <tr>
                        <td style="text-align: center">
                            <img alt="" src="../../images_Items/On/show.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:LinkButton ID="btn_show" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Article/ShowArticle.aspx">مشاهده مقالات</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style9">
                    <tr>
                        <td style="text-align: center">
                            <img alt="" src="../../images_Items/On/add.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:LinkButton ID="btn_insert" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Article/Add_Article.aspx">اضافه کردن مقاله</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style9">
                    <tr>
                        <td class="style14">
                            <img alt="" src="../../images_Items/On/edit.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:LinkButton ID="btn_edit" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Article/Edit_Article.aspx">ویرایش مقاله</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style9">
                    <tr>
                        <td class="style14">
                            <img alt="" src="../../images_Items/On/group.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:LinkButton ID="btn_group" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Article/Category_Article.aspx">گروهبندی 
                            مقاله ها</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
            
                <table class="style16">
                    <tr>
                        <td style="text-align: center">
                            <img alt="" src="../../images_Items/On/nazarat.png" 
                                style="width: 123px; height: 127px" /></td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Article/Opp_Article.aspx">نظرات</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            
            </td>
        </tr>

        
    </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF" class="style17">
                بازگشت<asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/prev.gif" />
            </td>
        </tr>
    </table>
</asp:Content>

