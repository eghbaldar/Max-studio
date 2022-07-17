
Partial Class Presentation_CMS_Article_ShowOOP
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim BLL As New Article
            lbl.Text = BLL.SelectNazarRow(Integer.Parse(Request.QueryString("ID"))).Rows(0)(5).ToString()
            Title = " پنل مدیریت سایت - پنجره نظرات"
        Catch ex As Exception

        End Try
    End Sub
End Class
