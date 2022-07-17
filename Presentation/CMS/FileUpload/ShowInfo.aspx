<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShowInfo.aspx.vb" Inherits="Presentation_CMS_FileUpload_ShowInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>مشاهده اطلاعات</title>
</head>
<body style="background-color:#a9a9a9">
    <form id="form1" runat="server">
<div style="padding-right:20px;padding-left:20px;" dir="rtl">
            <table cellspacing="4" cellpadding="4">
                <tr>
                    <td>عنوان : </td>
                    <td>
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>توضیح کوتاه : </td>
                    <td>
                        <asp:Literal ID="litShortDesc" runat="server"></asp:Literal>
                    </td>
                </tr>
                
                <tr>
                    <td>توضیح کامل : </td>
                    <td>
                        <asp:Literal ID="litFullDesc" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td>وضعیت نمایش :</td>
                    <td>
                        <asp:Label ID="lblFlag" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>تعداد دانلود :</td>
                    <td>
                        <asp:Label ID="lblDownloadCounter" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>تاریخ ارسال :</td>
                    <td>
                        <asp:Label ID="lblSendDateTime" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>عکس :</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="210px" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td>فایل :</td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank"></asp:HyperLink>
                    </td>
                </tr>
                
                </table>
            
</div>    
    
    </form>
</body>
</html>
