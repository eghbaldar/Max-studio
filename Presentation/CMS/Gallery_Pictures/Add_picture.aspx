<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Add_picture.aspx.vb" Inherits="Presentation_CMS_Gallery_Pictures_Add_picture" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 98%;
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
                <img alt="" src="../../../Content/Images/M_Show.jpg" 
                    style="width: 763px; height: 45px" /></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" 
                    PageSize="4" Width="762px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="Title" HeaderText="عنوان عکس" 
                            SortExpression="Title" />
                        <asp:BoundField DataField="Detail" HeaderText="توضیح عکس" 
                            SortExpression="Detail" />
                        <asp:TemplateField SortExpression="Path">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Thumbnails") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="92px" 
                                    ImageUrl='<%# Eval("Thumbnails", "images_gallery\{0}") %>' Width="89px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" 
                            Visible="False" />
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username" Visible="False" />
                        <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" 
                            SortExpression="Code_Category" Visible="False" />
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
                    SelectCommand="SELECT * FROM [Tbl_Gallery] ORDER BY [ID] DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lbl" runat="server" style="color: #FF0000"></asp:Label>
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
                                                    :آلبوم</td>
                        <td>
                                                    <asp:DropDownList ID="cmb_album" runat="server" 
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
                                                    <asp:TextBox ID="txt_title" runat="server" 
                                                        style="text-align: right; font-family: Tahoma; font-size: 11px" Width="200px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ErrorMessage="*" ControlToValidate="txt_title" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                                    </td>
                    </tr>
                    <tr>
                        <td>
                                                    :جزییات عکس</td>
                        <td>
                                                    <asp:TextBox ID="txt_detail" runat="server" Height="80px" 
                                                        style="text-align: right; font-family: Tahoma; font-size: 11px" 
                                                        TextMode="MultiLine" Width="291px"></asp:TextBox>
                                                </td>
                    </tr>
                    <tr>
                        <td>
                                                    :انتخاب عکس</td>
                        <td>
                                 
                                                    <asp:FileUpload ID="FileUpload" runat="server" />
                                                    
                                                    </td>
                    </tr>
                    <tr>
                        <td>
                                                    :وضعیت عکس</td>
                        <td>
                            <table class="style5">
                                <tr>
                                    <td>
                                                                <asp:RadioButton ID="rb_insert_1" runat="server" 
                                                                    Text="قابل مشاهده برای کاربران باشد" Checked="True" 
                                                                    GroupName="r1" />
                                                            </td>
                                </tr>
                                <tr>
                                    <td>
                                                                <asp:RadioButton ID="rb_insert_2" runat="server" Text="از دید کاربران مخفی باشد" 
                                                                    GroupName="r1" />
                                                            </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                                                    <asp:Button ID="btn_insertPicture" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px" Text="ارسال" 
                                                        ValidationGroup="insert" />
                                                </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                                                    <asp:Label ID="lbl_gallery" runat="server" 
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

