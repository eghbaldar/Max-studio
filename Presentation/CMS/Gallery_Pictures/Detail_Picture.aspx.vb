Imports System.Data

Partial Class Presentation_Modules_Gallery_Pictures_Detail_Picture
    Inherits System.Web.UI.Page

    Dim BLL As New Gallery_Pictures
    Dim dr As DataRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        dr = BLL.SelectRow(Request.QueryString("PicID")).Rows(0)
        Title = dr(1).ToString()
        Im.ImageUrl = "~\Presentation\CMS\Gallery_Pictures\Images_Gallery\" + dr("Thumbnails").ToString()
        If dr(1).ToString() <> "" Then
            lbl_title.Text = dr(1).ToString()
        Else : lbl_title.Text = "عنوان ندارد"
        End If
        If dr(2).ToString() <> "" Then
            lbl_detail.Text = dr(2).ToString()
        Else : lbl_detail.Text = "عنوان ندارد"
        End If
        '--------------
        Title = "پنل مدیریت سایت -جزییات تصاویر"

    End Sub

End Class
