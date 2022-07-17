<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Gallery_Pictures.aspx.vb" Inherits="Presentation_CMS_Gallery_Pictures_Gallery_Pictures" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="../../../Content/CSS/Browse.css" type="text/css" />
    <link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/Other.css" type="text/css" media="screen" />
	
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
	
	<script language="javascript" type="text/javascript">
        function ShowInfo(str){
        window.open("Detail_Picture.aspx?PicID="+str ,'nwwin', 'toolbar=0,location=0,directories=0,status=0,menubar=no,scrollbars=yes,resizable=no,width=355,height=400');        
        return false;
        }
    </script>
    
    <script language="javascript" type="text/javascript">
        function ShowBig(str){
        window.open('\\images_gallery\\'+ str);        
        return false;
        }
    </script>
    <style type="text/css">
        .style15
        {
            width: 70%;
        }
        .style14
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style15">
        <tr>
            <td>
<table class="style9">
<tr>
<img alt="" src="../../images_Items/Header.jpg"  style="width: 560px; height: 45px" />
</tr>
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
                            <asp:LinkButton ID="btn_showNews" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Gallery_Pictures/Show_Picture.aspx">مشاهده 
                            عکس ها</asp:LinkButton>
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
                            <asp:LinkButton ID="btn_insertNews" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Gallery_Pictures/Add_picture.aspx">اضافه 
                            کردن عکس</asp:LinkButton>
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
                            <asp:LinkButton ID="LinkButton2" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Gallery_Pictures/Edit_Picture.aspx">ویرایش 
                            عکس ها</asp:LinkButton>
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
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Gallery_Pictures/Category_Picture.aspx">مدیریت 
                            آلبوم</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        
    </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                بازگشت<asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/prev.gif" />
            </td>
        </tr>
    </table>
</asp:Content>

