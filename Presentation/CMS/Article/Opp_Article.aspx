<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Opp_Article.aspx.vb" Inherits="Presentation_CMS_Article_Opp_Article" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">
        function ShowInfo(str){
        window.open("ShowOOP.aspx?ID="+str ,'nwwin', 'toolbar=0,location=0,directories=0,status=0,menubar=no,scrollbars=yes,resizable=no,width=650,height=495');        
        return false;
        }
    </script>
    
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 84px;
        }
        .style7
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
                <table class="style5">
                    <tr>
                        <td class="style6">
                            مقاله:</td>
                        <td>
                            <asp:DropDownList ID="cmb" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="title_Article" DataValueField="ID" 
                                Width="300px" style="font-family: Tahoma">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                                
                                SelectCommand="SELECT [ID], [title_Article] FROM [Tbl_Article] ORDER BY [ID] DESC">
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
                    CellPadding="4" ForeColor="Black" 
                    GridLines="Horizontal" Width="765px" DataSourceID="SqlDataSource2">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="ID_Article" HeaderText="ID_Article" 
                            SortExpression="ID_Article" Visible="False" />
                        <asp:BoundField DataField="FnLn" HeaderText="نام و نام خانوادگی" 
                            SortExpression="FnLn" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="آدرس الکترونیکی" 
                            SortExpression="email" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="website" HeaderText="آدرس وبسایت" 
                            SortExpression="website" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="message" HeaderText="پیام" 
                            SortExpression="message" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DateTime" HeaderText="تاریخ و زمان ارسال" 
                            SortExpression="DateTime" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IP" HeaderText=" اراسال کننده پیام IP " 
                            SortExpression="IP" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" 
                            Visible="False" />
                        
                         <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                    OnClientClick='<%# Eval("ID","return ShowInfo(""{0}"")") %>' Text="...مشاهده"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
<asp:TemplateField ShowHeader="False">                        
 <ItemTemplate>
    <asp:ImageButton ID="Image_Delete" runat="server" CausesValidation="False" 
    OnCommand="delete"
    CommandArgument='<%# Eval("id","{0}") %>'
        ImageUrl="~/Content/Images/delete.gif" 
        OnClientClick="return confirm('آیا میخواهید این نظر حذف شود؟');" />
</ItemTemplate>
</asp:TemplateField>      

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
                    
                    SelectCommand="SELECT * FROM [Tbl_Nazarat_Article] WHERE ([ID_Article] = @ID_Article) ORDER BY [ID] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmb" Name="ID_Article" 
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
            <td style="text-align: left; background-color: #FFFFFF;">
                <asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" />
            </td>
        </tr>
    </table>

</asp:Content>

