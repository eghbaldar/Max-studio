
Partial Class Presentation_CMS_Gallery_Pictures_Show_Picture
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Server.Transfer("~/Presentation/CMS/Gallery_Pictures/Gallery_Pictures.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - نمایش تصاویر "
        If Not IsPostBack Then cmb.Items.Insert(0, New ListItem("", "-1"))
    End Sub

End Class
