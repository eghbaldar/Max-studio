
Partial Class Presentation_CMS_FileUpload_ShowInfo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim InfoID As Integer = CInt(Request.QueryString("ID"))
        Dim fuAction As New FileUpload

        Dim dr As Data.DataRow = fuAction.SelectRow(InfoID)
        With dr
            lblTitle.Text = .Item("Title")
            litShortDesc.Text = .Item("ShortDesc")
            litFullDesc.Text = .Item("FullDesc")
            lblFlag.Text = IIf(CBool(.Item("Flag")) = True, "قابل نمایش", "غیر قابل نمایش")
            lblDownloadCounter.Text = .Item("DownloadCounter")
            lblSendDateTime.Text = .Item("DateSend") + " - " + .Item("TimeSend")
            Image1.ImageUrl = "~/Presentation/CMS/FileUpload/ImageUpload/" + .Item("PicName")
            HyperLink1.Text = .Item("FileName")
            HyperLink1.NavigateUrl = "~/Presentation/CMS/FileUpload/FileUpload/" + .Item("FileName")
        End With
    End Sub

End Class