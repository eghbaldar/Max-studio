﻿<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="OutOfLimit.aspx.vb" Inherits="Presentation_CMS_OutOfLimit_Add_OutOfLimit" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 39%;
        }
        .style6
        {
            width: 96%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style5">
        <tr>
            <td>
                <img alt="" src="../../images_Items/Header.jpg" 
                    style="width: 143px; height: 45px" /></td>
        </tr>
        <tr>
            <td style="text-align: center">
                <table class="style6">
                    <tr>
                        <td>
                            <img alt="" src="../../images_Items/On/edit.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                PostBackUrl="~/Presentation/CMS/OutOfLimit/Add_OutOfLimit.aspx">ویرایش صحفه</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF;">
                بازگشت<asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/prev.gif" />
            </td>
        </tr>
    </table>

</asp:Content>

