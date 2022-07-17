<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Category_Picture.aspx.vb" Inherits="Presentation_CMS_Gallery_Pictures_Category_Picture" title="Untitled Page" %>

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
                            
    <p>
        <table class="style5">
            <tr>
                <td>
                    <img alt="" src="../../../Content/Images/M_Show.jpg" 
                        style="width: 763px; height: 45px" /></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="DG_CategoryPicture" runat="server" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        DataKeyNames="Code_Category" DataSourceID="SqlDataSource2" ForeColor="Black" 
                        GridLines="Horizontal" style="font-family: Tahoma; font-size: 11px" 
                        Width="762px">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="Name_Category" HeaderText="نام آلبوم" 
                                SortExpression="Name_Category" >
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" 
                                InsertVisible="False" ReadOnly="True" SortExpression="Code_Category" 
                                Visible="False" />
                            <asp:CommandField CancelText="لغو" EditText="ویرایش آلبوم" 
                                ShowEditButton="True" UpdateText="بروز رسانی" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                        CommandArgument='<%# Eval("Code_Category","{0}") %>' 
                                        ImageUrl="~/Content/Images/delete.gif" 
                                        OnClientClick="return confirm('با حذف این آلبوم تمام عکس های زیر مجموعه آن نیز حذف می گردند');" 
                                        OnCommand="Delete_PictureCategory" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <EmptyDataTemplate>
                            رکوردی برای نمایش وجود ندارد
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="lbl_rowDG" runat="server" 
                        style="color: #CC0000; text-align: center; font-size: 11px;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                        SelectCommand="SELECT * FROM [Tbl_GalleryCategory] ORDER BY [Code_Category] DESC" 
                        UpdateCommand="UPDATE Tbl_GalleryCategory SET Name_Category = @Name_Category WHERE (Code_Category = @Code_category)">
                        <UpdateParameters>
                            <asp:Parameter Name="Name_Category" />
                            <asp:Parameter Name="Code_category" />
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
                                آلبوم</td>
                            <td>
                                <asp:TextBox ID="txt_nameCategory" runat="server" 
                                    style="font-family: Tahoma; text-align: right;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txt_nameCategory" ErrorMessage="*" 
                                    ValidationGroup="Category"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btn_insertCategory" runat="server" 
                                    style="font-family: Tahoma; font-size: 11px" Text="ارسال" 
                                    ValidationGroup="Category" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="lbl_statusCategory" runat="server" style="color: #FF0000"></asp:Label>
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
    </p>
                            
</asp:Content>

