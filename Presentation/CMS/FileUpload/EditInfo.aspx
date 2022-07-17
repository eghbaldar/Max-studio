<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="EditInfo.aspx.vb" Inherits="Presentation_CMS_FileUpload_EditInfo" title="Untitled Page" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                        <br />
                        <br />
                        نکته&nbsp; 1 : فایل تصویر حتما باید دارای پسوندهای JPG, PNG, BMP, GIF باشد.<br />
                        نکته&nbsp; 2 : قبل از ذخیره اطلاعات، حتما فایل های خواسته شده را انتخاب نمایید.<br />
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
                            <asp:ListItem Value="true">قابل نمایش</asp:ListItem>
                            <asp:ListItem Selected="True" Value="false">غیر قابل نمایش</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>عکس :</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="210px" Width="230px"/>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td>
                        <asp:CheckBox ID="chkPicture" runat="server" Text="عکس جدید :" />
                    </td>
                    <td>
                        <asp:FileUpload ID="FU_Pic" runat="server" Width="320px"/>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td>فایل :</td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank"></asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td>
                        <asp:CheckBox ID="chkFile" runat="server" Text="فایل جدید :" />
                    </td>
                    <td>
                        <asp:FileUpload ID="FU_File" runat="server" Width="320px" />
                    </td>
                    <td></td>
                </tr>
                
                <tr style="height:50px;">
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="ذخیره" Width="50px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            
</div>
</asp:Content>

