﻿
Partial Class Presentation_CMS_Gallery_Pictures_Gallery_Pictures
    Inherits System.Web.UI.Page

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Response.Redirect("~/Presentation/ManagerWebsite.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - ماژول گالری تصاویر"
    End Sub

End Class
