
Partial Class AboutUs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim c As New AboutUS_
            lblAbout.Text = c.SelectAll().Rows(0)(1).ToString()
        Catch ex As Exception

        End Try
    End Sub
End Class
