<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Photos.aspx.vb" Inherits="Photos" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .hovergallery img
        {
            -webkit-transform: scale(0.8); /*Webkit: Scale down image to 0.8x original size*/
            -moz-transform: scale(0.8); /*Mozilla scale version*/
            -o-transform: scale(0.8); /*Opera scale version*/
            -webkit-transition-duration: 0.5s; /*Webkit: Animation duration*/
            -moz-transition-duration: 0.5s; /*Mozilla duration version*/
            -o-transition-duration: 0.5s; /*Opera duration version*/
            opacity: 0.7; /*initial opacity of images*/
            margin: 0 10px 5px 0; /*margin between images*/
        }
        .hovergallery img:hover
        {
            -webkit-transform: scale(1.1); /*Webkit: Scale up image to 1.2x original size*/
            -moz-transform: scale(1.1); /*Mozilla scale version*/
            -o-transform: scale(1.1); /*Opera scale version*/
            box-shadow: 0px 0px 30px gray; /*CSS3 shadow: 30px blurred shadow all around image*/
            -webkit-box-shadow: 0px 0px 30px gray; /*Safari shadow version*/
            -moz-box-shadow: 0px 0px 30px gray; /*Mozilla shadow version*/
            opacity: 1;
        }
        .style1
        {
            width: 115%;
        }
        .style2
        {
            font-family: Tahoma;
            color: #F3F3F3;
            font-weight: bold;
            font-size: small;
            text-align: left;
        }
    </style>
    
    <link rel="Stylesheet" href="Content/CSS/Browse.css" type="text/css" />
    <link rel="stylesheet" href="Presentation/CMS/Gallery_Pictures/css/lightbox.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="Presentation/CMS/Gallery_Pictures/css/Other.css" type="text/css" media="screen" />
	
	<script src="Presentation/CMS/Gallery_Pictures/js/prototype.js" type="text/javascript"></script>
	<script src="Presentation/CMS/Gallery_Pictures/js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="Presentation/CMS/Gallery_Pictures/js/lightbox.js" type="text/javascript"></script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="GalleryBar">
        <img src="Content/Images/Design/Gallery.gif" />
    </div>
    
    <div id="conetntGallery" 
        style="direction: rtl; margin-top: 20px; margin-right: 10px;        float: right; width: 799px;">
        
        <table class="style1">
            <tr>
                <td class="style2">
                    Photos</td>
            </tr>
            <tr>
                <td style="background-color: #1C1C1C">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            RepeatColumns="7" RepeatDirection="Horizontal">
            <ItemTemplate>
            
                &nbsp;
            
            <a href='<%# Eval("path","Presentation\CMS\Gallery_Pictures\Images_Gallery\{0}") %>' target="_blank" rel="lightbox">
                <asp:Image ID="Image1" runat="server" Height="79px" 
                    ImageUrl='<%# Eval("thumbnails", "~\Presentation\CMS\Gallery_Pictures\Images_Gallery\{0}") %>' 
                    Width="105px" BorderColor="#333333" BorderStyle="Solid" 
                    BorderWidth="3px" />
            </a>
                    
            </ItemTemplate>
        </asp:DataList>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
            SelectCommand="SELECT * FROM [Tbl_Gallery] WHERE (([Code_Category] = @Code_Category) AND ([Flag] = @Flag))">
            <SelectParameters>
                <asp:QueryStringParameter Name="Code_Category" QueryStringField="ID" 
                    Type="Int64" />
                <asp:Parameter DefaultValue="True" Name="Flag" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
</asp:Content>
