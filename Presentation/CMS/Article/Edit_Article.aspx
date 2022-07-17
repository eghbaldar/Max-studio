<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Edit_Article.aspx.vb" Inherits="Presentation_CMS_Article_Edit_Article" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 68px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <table class="style5">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Images/M_Show.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="style5">
                                <tr>
                                    <td class="style6">
                                        گروه:</td>
                                    <td>
                                        <asp:DropDownList ID="cmb" runat="server" AutoPostBack="True" 
                                            DataSourceID="SqlDataSource1" DataTextField="Name_Article" 
                                            DataValueField="Code_Category" style="font-family: Tahoma" Width="400px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
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
                                    <asp:GridView ID="DG_Edit" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                                        DataSourceID="SqlDataSource2" GridLines="Horizontal" 
                                        style="font-family: Tahoma; font-size: 11px; text-align: right" 
                                        Width="763px" AllowSorting="True" ForeColor="Black" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <Columns>
                                            <asp:BoundField DataField="title_Article" HeaderText="عنوان مقاله" 
                                                SortExpression="title_Article" >
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tarikh" HeaderText="تاریخ اسال مقاله" 
                                                SortExpression="tarikh" >
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="time" HeaderText="زمان ارسال مقاله" 
                                                SortExpression="time" >
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            
                                                <asp:TemplateField HeaderText="وضعیت نمایش" SortExpression="Flag">
                                                                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# IIF(Eval("flag")=0,"~/Presentation/images_Items/NoShow.gif","~/Presentation/images_Items/YesShow.gif") %>' />
                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="Image_Edit" runat="server" CausesValidation="False" 
                                                        CommandArgument='<% #Eval("ID","{0}") %>' imageUrl="~/Content/Images/edit.gif" 
                                                        OnCommand="Edit_News" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="Image_Delete" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" ImageUrl="~/Content/Images/delete.gif" 
                                                        OnClientClick="return confirm('آیا میخواهید این مقاله حذف شود؟');" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="ID" Visible="False" />
                                        </Columns>
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <EmptyDataTemplate>
                                            رکوردی برای نمایش وجود ندارد
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Tbl_Article] WHERE ([Code_Category] = @Code_Category) ORDER BY [ID] DESC">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cmb" Name="Code_Category" 
                                                PropertyName="SelectedValue" Type="Int64" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:ObjectDataSource ID="ODS_Article" runat="server" SelectMethod="SelectAll" 
                            TypeName="Article" DeleteMethod="Delete">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                        </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                                    <asp:Label ID="lbl_rowDGnews" runat="server" 
                                        style="color: #CC0000"></asp:Label>
                                </td>
                    </tr>
                    <tr>
                        <td>
                            <img alt="" src="../../../Content/Images/ediit.jpg" 
                                style="width: 763px; height: 45px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <table class="style5">
                                <tr>
                                    <td>
                                        گروه خبر</td>
                                    <td>
                                    <asp:DropDownList ID="cmb_category_edit" runat="server" 
                                        DataSourceID="ObjectDataSource1" DataTextField="Name_Article" 
                                        DataValueField="Code_Category" style="font-family: Tahoma; font-size: 11px" 
                                        Width="465px" Height="22px">
                                    </asp:DropDownList>
                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAllCategory" 
                                            TypeName="Article"></asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        عنوان خبر</td>
                                    <td>
                                    <span dir="rtl" onkeypress="FKeyPress()">
                                    <asp:TextBox ID="txt_title_news_edit" runat="server" 
                                        Width="465px" style="font-family: Tahoma; font-size: 11px"></asp:TextBox>
                                    </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    :متن کوتاه خبر</td>
                                    <td>
                                    <FCKeditorV2:FCKeditor ID="txt_matnkotah_news_edit" runat="server" 
                                        BasePath="~/Content/fckeditor/" ToolbarSet="Short" Width="700px"></FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    :متن کامل خبر</td>
                                    <td>
                                    <FCKeditorV2:FCKeditor ID="FCK_News_edit" runat="server" 
                                        BasePath="~/Content/fckeditor/" Height="400px" Width="700px"></FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        وضعیت خبر</td>
                                    <td>
                                        <table class="style5">
                                            <tr>
                                                <td>
                                    <asp:RadioButton ID="rb_enable_edit" runat="server" GroupName="E1" Text="فعال" 
                                        ValidationGroup="insert_news_edit" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                    <asp:RadioButton ID="rb_disable_edit" runat="server" GroupName="E1" 
                                        Text="غیر فعال" ValidationGroup="insert_news_edit" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                    <asp:Button ID="btn_news_edit" runat="server" 
                                        style="height: 26px; font-family: Tahoma; font-size: 11px;" Text="اصلاح" 
                                        ValidationGroup="insert_news_edit" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                    <asp:Label ID="lbl_news_edit_" runat="server" style="color: #FF0000"></asp:Label>
                                    </td>
                                </tr>
                            </table>
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

