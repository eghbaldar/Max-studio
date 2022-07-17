<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Show_Picture.aspx.vb" Inherits="Presentation_CMS_Gallery_Pictures_Show_Picture" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 97%;
        }
        .style6
        {
            text-align: center;
        }
        .style7
        {
            width: 100%;
        }
        .style8
        {
            width: 87px;
        }
    </style>
    
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
        function ShowBig(path){
            window.open(path);        
        return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style5">
        <tr>
            <td>
                <img alt="" src="../../../Content/Images/M_Show.jpg" 
                    style="width: 763px; height: 45px" /></td>
        </tr>
        <tr>
            <td>
                <table class="style7">
                    <tr>
                        <td class="style8">
                            آلبوم:</td>
                        <td>
                            <asp:DropDownList ID="cmb" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource2" DataTextField="Name_Category" 
                                DataValueField="Code_Category" style="font-family: Tahoma" Width="400px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                                SelectCommand="SELECT * FROM [Tbl_GalleryCategory] ORDER BY [Code_Category] DESC">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
             <asp:DataList ID="DataList" runat="server" DataSourceID="SqlDataSource1" 
                                RepeatColumns="6" RepeatDirection="Horizontal" 
                                Width="324px">
                                <ItemTemplate>
                                    
                                    <table class="style2" style="width: 132px">
                                        <tr>
                                            <td class="style6">
                                            
                                                <a href='<%# Eval("Path", "Images_Gallery\{0}") %>' rel="lightbox">
                                                <asp:Image ID="Image1" runat="server" Height="116px"
                                                ToolTip='<%# Eval("Detail", "{0}") %>'
                                                ImageUrl='<%# Eval("Thumbnails", "~\Presentation\CMS\Gallery_Pictures\Images_Gallery\{0}") %>' 
                                                Width="120px" />
                                                </a>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <div class="Footer_Footer">
                                                
                                                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' 
                                                        style="font-family: Tahoma; font-size: 11px" />
                                                
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <asp:LinkButton ID="btn_showBig" runat="server" 
                                        OnClientClick='<%# Eval("path","return ShowBig(""\Images_Gallery\\{0}"")") %>'
                                                 class="S"
                                                    style="font-family: Tahoma; font-size: 11px">نمایش عکس اصلی</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <asp:Label ID="Label2" runat="server" 
                                                    style="font-family: Tahoma; font-weight: 700; color: #CC0000; font-size: 11px" 
                                                    Text='<%# IIF(Eval("Flag")=true,"برای کاربر قابل مشاهده","از دید کاربر مخفی") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                                OnClientClick='<%# Eval("ID","return ShowInfo(""{0}"")") %>'
                                                   class="S"
                                                    style="font-family: Tahoma; font-size: 11px; color: #333333">... جزییات</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />

                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                                
                    SelectCommand="SELECT * FROM [Tbl_Gallery] WHERE ([Code_Category] = @Code_Category) ORDER BY [ID] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmb" Name="Code_Category" 
                                        PropertyName="SelectedValue" Type="Int64" />
                                </SelectParameters>
                </asp:SqlDataSource>
                            <br />
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" />
            </td>
        </tr>
    </table>

</asp:Content>

