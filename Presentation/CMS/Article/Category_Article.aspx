<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Category_Article.aspx.vb" Inherits="Presentation_CMS_Article_Category_Article" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            color: red;
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
                <asp:GridView ID="DG_ArticleCategory" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="Code_Category" DataSourceID="SDS_Category" ForeColor="Black" 
                    GridLines="Horizontal" PageSize="7" Width="762px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="Name_Article" HeaderText="نام گروه" 
                            SortExpression="Name_Article" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Code_Category" 
                            Visible="False" />
                        <asp:CommandField CancelText="لغو" EditText="ویرایش گروه" ShowEditButton="True" 
                            UpdateText="بروز رسانی" >
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:CommandField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                            
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    CommandArgument='<%# Eval("Code_Category","{0}") %>' 
                                    ImageUrl="~/Content/Images/delete.gif" 
                                    OnClientClick="return confirm('با حذف این گروه تمام خبر های زیر مجموعه آن نیز حذف می گردند');" 
                                    OnCommand="Delete_ArticleCategory" />
                                    
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکودی برای نمایش وجود ندارد
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lbl_rowDG" runat="server" style="color: #CC0000;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                        <asp:SqlDataSource ID="SDS_Category" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                            
                            
                    SelectCommand="SELECT * FROM [Tbl_ArticleCategory] ORDER BY [Code_Category] DESC" UpdateCommand="update Tbl_ArticleCategory set Name_Article=@Name_Article
where Code_Category=@Code_Category">
                            <UpdateParameters>
                                <asp:Parameter Name="Name_Article" />
                                <asp:Parameter Name="Code_Category" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <img alt="" src="../../../Content/Images/ADD_God.jpg" 
                    style="width: 763px; height: 45px" /></td>
        </tr>
        <tr>
            <td>
                <table class="style5">
                    <tr>
                        <td>
                            نام گروه:</td>
                        <td>
                            <asp:TextBox ID="txt_ArticleCategory" runat="server" 
                                style="text-align: right; font-family: Tahoma; font-size: 11px" 
                                Width="233px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txt_ArticleCategory" ErrorMessage="*" 
                                ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btn_insertCategory" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ارسال" ValidationGroup="C" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lbl_statuseCategory" runat="server" style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

