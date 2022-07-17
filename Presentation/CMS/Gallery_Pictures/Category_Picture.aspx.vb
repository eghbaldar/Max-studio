
Partial Class Presentation_CMS_Gallery_Pictures_Category_Picture
    Inherits System.Web.UI.Page

    Dim BLL As New Gallery_Pictures

    Protected Sub btn_insertCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_insertCategory.Click

        Dim ICheck As Integer = BLL.Insert_PictureCategory(txt_nameCategory.Text)
        Select Case ICheck
            Case 0 : lbl_statusCategory.Text = "تمام بخش ها باید تکمیل شود"
            Case 1
                lbl_statusCategory.Text = "آلبوم با موفقیت درج شد"
                txt_nameCategory.Text = ""
                lbl_rowDG.Text = ""
                DG_CategoryPicture.DataBind()
            Case -1 : lbl_statusCategory.Text = "در درج آلبوم مشکلی رخ داده است"
        End Select

    End Sub

    Protected Sub Delete_PictureCategory(ByVal sender As Object, ByVal e As CommandEventArgs)
        BLL.Delete_PictureCategory(e.CommandArgument)
        DG_CategoryPicture.DataBind()
        If DG_CategoryPicture.Rows.Count = 0 Then lbl_statusCategory.Text = "آلبومی برای نمایش وجود ندارد"
        lbl_statusCategory.Text = ""
    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Gallery_Pictures/Gallery_Pictures.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت -آلبوم بندی تصاویر"
    End Sub

    Protected Sub DG_CategoryPicture_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_CategoryPicture.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If

    End Sub
End Class
