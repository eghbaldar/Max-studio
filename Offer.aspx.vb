
Partial Class Offer
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            Dim BLL As New Offers_
            BLL.InsertConatct(Server.HtmlDecode(txtName.Text), Server.HtmlDecode(txtEmail.Text), Server.HtmlDecode(txtTitle.Text), Server.HtmlDecode(txtMessage.Text), Request.UserHostAddress)
            txtEmail.Text = ""
            txtMessage.Text = ""
            txtName.Text = ""
            txtTitle.Text = ""
            lblSuc.Text = "Message sent successfully !"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblSuc.Text = ""
    End Sub
End Class
