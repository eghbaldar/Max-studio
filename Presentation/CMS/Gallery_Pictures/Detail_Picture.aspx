<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Detail_Picture.aspx.vb" Inherits="Presentation_Modules_Gallery_Pictures_Detail_Picture" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 31%;
        }
        .style2
        {
            text-align: right;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style3
        {
            text-align: right;
            font-family: Tahoma;
            font-size: 11px;
            color: #0000FF;
        }
        .S
        {
        	text-decoration:none;
        }
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 300px;
        }
        .style6
        {
            width: 298px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="Im" runat="server" Height="273px" Width="333px" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <table class="style4">
                        <tr>
                            <td class="style6">
                    <asp:Label ID="lbl_title" runat="server" style="color: #000000"></asp:Label>
                            </td>
                            <td>
                    :عنوان</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <table class="style4">
                        <tr>
                            <td class="style5">
                    <asp:Label ID="lbl_detail" runat="server" style="color: #000000"></asp:Label>
                            </td>
                            <td>
                    :توضیحات</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
