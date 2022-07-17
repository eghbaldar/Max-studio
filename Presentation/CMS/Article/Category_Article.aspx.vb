
Partial Class Presentation_CMS_Article_Category_Article
    Inherits System.Web.UI.Page

    Dim BLL As New Article

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = " پنل مدیریت سایت - گروهبندی مقالات"
    End Sub

    Protected Sub btn_insertCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_insertCategory.Click

        Dim ICheck As Integer = BLL.Insert_ArticleCategory(txt_ArticleCategory.Text)
        Select Case ICheck
            Case 0 : lbl_statuseCategory.Text = "تمام بخش ها باید تکمیل شود"
            Case 1
                lbl_statuseCategory.Text = "گروه با موفقیت درج شد"
                txt_ArticleCategory.Text = ""
                lbl_rowDG.Text = ""
                DG_ArticleCategory.DataBind()
            Case -1 : lbl_statuseCategory.Text = "در درج گروه مشکلی رخ داده است"
        End Select

    End Sub

    Protected Sub Delete_ArticleCategory(ByVal sender As Object, ByVal e As CommandEventArgs)

        BLL.Delete_ArticleCategory(e.CommandArgument)
        DG_ArticleCategory.DataBind()
        If DG_ArticleCategory.Rows.Count = 0 Then lbl_rowDG.Text = "گروهی برای نمایش وجود ندارد"
        lbl_statuseCategory.Text = ""

    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Article/Article.aspx")
    End Sub

    Protected Sub DG_ArticleCategory_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_ArticleCategory.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub
End Class
