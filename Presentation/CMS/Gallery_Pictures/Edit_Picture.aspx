<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Edit_Picture.aspx.vb" Inherits="Presentation_CMS_Gallery_Pictures_Edit_Picture" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 98%;
        }
        .style7
        {
            width: 100%;
        }
        .style8
        {
            width: 69px;
        }
    </style>
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
                                        DataValueField="Code_Category" Width="400px">
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
                                        <asp:GridView ID="DG_Edit" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
                                            GridLines="Horizontal" style="font-family: Tahoma; font-size: 11px" 
                                            Width="760px" AllowPaging="True" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                                    ReadOnly="True" SortExpression="ID" Visible="False" />
                                                <asp:BoundField DataField="Title" HeaderText="عنوان عکس" 
                                                    SortExpression="Title" >
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Detail" HeaderText="توضیحات" 
                                                    SortExpression="Detail" >
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" 
                                                    Visible="False" />
                                                    
                                                <asp:TemplateField HeaderText="وضعیت نمایش" SortExpression="Flag">
                                                                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# IIF(Eval("flag")=0,"~/Presentation/images_Items/NoShow.gif","~/Presentation/images_Items/YesShow.gif") %>' />
                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                            
                                                <asp:BoundField DataField="Username" HeaderText="توسط کاربر" 
                                                    SortExpression="Username" >
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" 
                                                    SortExpression="Code_Category" Visible="False" />
                                                <asp:TemplateField><ItemTemplate><asp:ImageButton ID="Image_Edit" runat="server" CausesValidation="False" 
                                                        CommandArgument='<% #Eval("ID","{0}") %>' imageUrl="~/Content/Images/edit.gif" 
                                                        OnCommand="Edit_Gallery" /></ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField><ItemTemplate><asp:ImageButton ID="Image_Delete" runat="server" CausesValidation="False"
                                                     CommandArgument='<% #Eval("ID","{0}") %>' 
                                                        OnCommand="Delete_gellry" ImageUrl="~/Content/Images/delete.gif" 
                                                        OnClientClick="return confirm('آیا میخواهید این عکس حذف شود؟');" /></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></EditItemTemplate>
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
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    
                    SelectCommand="SELECT * FROM [Tbl_Gallery] WHERE ([Code_Category] = @Code_Category) ORDER BY [ID] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmb" Name="Code_Category" 
                            PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
                                                                :آلبوم</td>
                        <td>
                                                                <asp:DropDownList ID="cmb_album_edit" runat="server" 
                                                                    DataSourceID="ObjectDataSource1" DataTextField="Name_Category" 
                                                                    DataValueField="Code_Category" style="font-family: Tahoma; font-size: 11px" 
                                                                    Width="200px">
                                                                </asp:DropDownList>
                                                            </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAllCategory" 
                                TypeName="Gallery_Pictures"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                                                :عنوان عکس</td>
                        <td>
                                                                <asp:TextBox ID="txt_title_edit" runat="server" 
                                                                    style="text-align: right; font-family: Tahoma; font-size: 11px" Width="200px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                    ControlToValidate="txt_title_edit" ErrorMessage="*" ValidationGroup="_edit"></asp:RequiredFieldValidator>
                                                                </td>
                    </tr>
                    <tr>
                        <td>
                                                                :جزییات عکس</td>
                        <td>
                                                                <asp:TextBox ID="txt_detail_edit" runat="server" Height="80px" 
                                                                    style="text-align: right; font-family: Tahoma; font-size: 11px" 
                                                                    TextMode="MultiLine" Width="291px"></asp:TextBox>
                                                            </td>
                    </tr>
                    <tr>
                        <td>
                                                                :عکس جاری</td>
                        <td>
                                                                <asp:Image ID="img_current" runat="server" Height="221px" Width="274px" />
                                                            </td>
                    </tr>
                    <tr>
                        <td>
                                                                :انتخاب عکس جدید</td>
                        <td>
                                                                <asp:FileUpload ID="FileUpload_Edit" runat="server" />
                                                            </td>
                    </tr>
                    <tr>
                        <td>
                            :وضعیت عکس</td>
                        <td>
                            <table class="style5">
                                <tr>
                                    <td>
                                                                            <asp:RadioButton ID="rb_insert__edit" runat="server" GroupName="54" 
                                                                                Text="قابل مشاهده برای کاربران باشد" />
                                                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                                                            <asp:RadioButton ID="rb_insert__edit2" runat="server" GroupName="54" 
                                                                                Text="از دید کاربران مخفی باشد" />
                                                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                                                                <asp:Button ID="btn_insertPicture_edit" runat="server" 
                                                                    style="font-family: Tahoma; font-size: 11px" Text="اصلاح" 
                                                                    ValidationGroup="_edit" />
                                                            </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                                                                <asp:Label ID="lbl_gallery_update" runat="server" 
                                                                    style="color: #FF0000"></asp:Label>
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

