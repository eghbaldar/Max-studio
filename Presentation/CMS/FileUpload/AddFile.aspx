<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="AddFile.aspx.vb" Inherits="Presentation_CMS_FileUpload_AddFile" title="Untitled Page" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style14
        {
            color: #FF0000;
        }
        .style15
        {
            color: #66FF33;
            font-weight: bold;
        }
        .style16
        {
            color: #99FF66;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
<div style="padding-right:20px;">
            <table cellspacing="4" cellpadding="4">
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblMsg" runat="server" Font-Bold="False" ForeColor="Red" 
                            Visible="False">خطا در ذخیره سازی داده !!! </asp:Label>
                        <b>
                        <br class="style14" />
                        <br class="style14" />
                        </b><span class="style15">نکته&nbsp; 1 : </span><span class="style13">فایل تصویر حتما 
                        باید دارای پسوندهای JPG, PNG, BMP, GIF باشد.</span><b><br class="style14" />
                        </b><span class="style16">نکته&nbsp; 2 : </span><span class="style13">قبل از ذخیره 
                        اطلاعات، حتما فایل های خواسته شده را انتخاب نمایید.</span><br />
                        <br />
                    </td>
                </tr>
                
                <tr>
                    <td>عنوان : </td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" Width=250px></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtTitle"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>توضیح کوتاه : </td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="ShortDesc" runat="server"  Width="500px"
                            BasePath="~/Content/fckeditor/" ToolbarSet="Short"></FCKeditorV2:FCKeditor>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td>توضیح کامل : </td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="FullDesc" runat="server" 
                            BasePath="~/Content/fckeditor/" Height="400px" Width="500px"></FCKeditorV2:FCKeditor>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>وضعیت نمایش :</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Value="true" Selected="True">قابل نمایش</asp:ListItem>
                            <asp:ListItem Value="false">غیر قابل نمایش</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>آدرش عکس :</td>
                    <td>
                        <asp:FileUpload ID="FU_Pic" runat="server" Width="320px"/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>آدرش فایل :</td>
                    <td>
                        <asp:FileUpload ID="FU_File" runat="server" Width="320px" />
                    </td>
                    <td></td>
                </tr>
                
                <tr style="height:50px;">
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="ذخیره" Width="50px" 
                            style="font-family: Tahoma; font-size: 11px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            
</div>

</asp:Content>

