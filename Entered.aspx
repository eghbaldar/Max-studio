<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Entered.aspx.vb" Inherits="Entered" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
		function GetImage(str){document.getElementById('img1').src=str;}		
    </script>
    
        <script language="javascript" type="text/javascript">
        var IM =new Array(9);
        IM[0]=new Image;
        IM[0].src="Content/Images/Design/Slideshow/1.jpg";
        IM[1]=new Image;
        IM[1].src="Content/Images/Design/Slideshow/2.jpg";
        IM[2]=new Image;
        IM[2].src="Content/Images/Design/Slideshow/3.jpg";
        IM[3]=new Image;
        IM[3].src="Content/Images/Design/Slideshow/4.jpg";
        IM[4]=new Image;
        IM[4].src="Content/Images/Design/Slideshow/5.jpg";
        IM[5]=new Image;
        IM[5].src="Content/Images/Design/Slideshow/6.jpg";
        IM[6]=new Image;
        IM[6].src="Content/Images/Design/Slideshow/7.jpg";
        IM[7]=new Image;
        IM[7].src="Content/Images/Design/Slideshow/8.jpg";
        IM[8]=new Image;
        IM[8].src="Content/Images/Design/Slideshow/9.jpg";
        
        var i=0;
        function SHOW(){
        i=Math.floor(Math.random()*9);
        document.getElementById('img1').src = IM[i].src;
                
        setTimeout("SHOW()",3000);      
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="GalleryBar">
            <img src="Content/Images/Design/Gallery.gif" />
            <pre></pre>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" BorderColor="#333333" 
                    BorderStyle="Solid" BorderWidth="4px" 
                    ImageUrl='<%# Eval("thumbnails", "~\Presentation\CMS\Gallery_Pictures\Images_Gallery\{0}") %>' />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
            SelectCommand="SELECT top 6 [thumbnails] FROM [Tbl_Gallery] ORDER BY [ID] DESC">
        </asp:SqlDataSource>
    </div>
    <div id="Top10Bar">
        <img src="Content/Images/Design/Top10.gif" onload="SHOW();"/>
        <div id="SlideShow">
            <div id="IMAGES" >
                <img src="Content/Images/Design/Slideshow/1.jpg" id="img1" />
            </div>
            <div id="count">
                <a id="a1" href="javascript:GetImage('Content/Images/Design/Slideshow/1.jpg');" style="color: #eeeeee;text-decoration: none;" >1</a> .
                 <a id="a2" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/2.JPG');" >2</a>
                . <a id="a3" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/3.JPG');">
                    3</a> . <a  id="a4" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/4.JPG');">
                        4</a> . <a  id="a5" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/5.JPG');">
                            5</a> . <a  id="a6" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/6.JPG');">
                                6</a> . <a id="a7"  style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/7.JPG');">
                                    7</a> . <a  id="a8" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/8.JPG');">
                                        8</a> . <a  id="a9" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/9.JPG');">
                                            9</a> . <a id="a10" style="color: #eeeeee; text-decoration: none;" href="javascript:GetImage('Content/Images/Design/Slideshow/10.JPG');">
                                                10</a>
            </div>
        </div>
    </div>
    <div id="Music_VideoBar">
        <img src="Content/Images/Design/music_Viedo.gif" />
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" 
            Width="195px">
            <ItemTemplate>
                <br style="font-size: small" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="Image2" runat="server" BorderColor="#333333" BorderStyle="Solid" 
                    BorderWidth="4px" Height="98px" 
                    ImageUrl='<%# Eval("PicName", "~\Presentation\CMS\FileUpload\ImageUpload\{0}") %>' 
                    Width="104px" />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
            SelectCommand="SELECT top 6 [PicName] FROM [Tbl_FileUpload] WHERE ([Flag] = @Flag)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="Flag" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
