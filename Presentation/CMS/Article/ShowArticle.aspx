<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="ShowArticle.aspx.vb" Inherits="Presentation_CMS_Article_ShowArticle" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style5">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/Images/M_Show.jpg" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="style5">
                    <tr>
                        <td class="style6">
                            گروه مقاله:</td>
                        <td>
                            <asp:DropDownList ID="cmb" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource2" DataTextField="Name_Article" 
                                DataValueField="Code_Category" style="font-family: Tahoma" Width="400px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                                SelectCommand="SELECT * FROM [Tbl_ArticleCategory] ORDER BY [Code_Category] DESC">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
                    ForeColor="Black" GridLines="Horizontal" Width="762px" AllowPaging="True">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="title_Article" HeaderText="عنوان مقاله" 
                            SortExpression="title_Article" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lid_Article" HeaderText="توضیح کوتاه" 
                            SortExpression="lid_Article" HtmlEncode="False" 
                            HtmlEncodeFormatString="False" >
                                                <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                                                <asp:TemplateField HeaderText="وضیعت نمایش" SortExpression="Flag">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# IIF(Eval("flag")=0,"~/Presentation/images_Items/NoShow.gif","~/Presentation/images_Items/YesShow.gif") %>' />
                            </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Right" />
                       </asp:TemplateField>
                        <asp:BoundField DataField="Article" HeaderText="مقاله" 
                            SortExpression="Article" HtmlEncode="False" 
                            HtmlEncodeFormatString="False" >
                                                     
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                                                     
                        <asp:CommandField SelectText="نمایش" ShowSelectButton="True" />
                                                     
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    
                    
                    SelectCommand="SELECT [ID], [title_Article], [lid_Article], [Flag], [Article] FROM [Tbl_Article] WHERE ([Code_Category] = @Code_Category) ORDER BY [ID] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmb" Name="Code_Category" 
                            PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lbl" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCCCCC">
                <asp:Label ID="lbl_article" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" />
            </td>
        </tr>
    </table>

</asp:Content>

