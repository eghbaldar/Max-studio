<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="InofList.aspx.vb" Inherits="Presentation_CMS_FileUpload_InofList" title="Untitled Page" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">
        function ShowInfo(id){
        window.open("ShowInfo.aspx?ID="+id ,'nwwin', 'toolbar=0,location=0,directories=0,status=0,menubar=no,scrollbars=yes,resizable=no,width=650,height=495');        
        return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />
    <br />
    <div style="padding-right:20px;padding-bottom:20px; padding-left:20px;">
        <asp:GridView ID="gvFileList" runat="server" CellPadding="4" 
            DataSourceID="ObjectDataSource1" ForeColor="#333333" 
            AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Presentation/CMS/FileUpload/Image/Arrow.gif" />
                    </ItemTemplate>
                </asp:TemplateField>            
            
                <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="عنوان" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="وضعیت نمایش">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bol2Str(Eval("Flag")) %>' ForeColor='<%# Bol2Color(Eval("Flag")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ و زمان ارسال">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("DateSend") %>'></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text='  -  '></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("TimeSend") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="مشاهده مشخصات">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                            OnClientClick='<%# Eval("ID","return ShowInfo(""{0}"")") %>' Text="مشاهده..."></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>

                <asp:HyperLinkField DataNavigateUrlFields="ID" 
                    DataNavigateUrlFormatString="EditInfo.aspx?id={0}" HeaderText="ویرایش مشخصات" 
                    Text="ویرایش...">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:HyperLinkField>
            
                <asp:TemplateField HeaderText="حذف اطلاعات">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('آیا میخواهید این مقاله حذف شود؟');"
                            CommandName="Delete" ImageUrl="~/Presentation/CMS/FileUpload/Image/Delete.gif" Text="Delete" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DeleteMethod="Delete"
            SelectMethod="SelectAll" TypeName="FileUpload">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
        </asp:ObjectDataSource>
    </div>

</asp:Content>

