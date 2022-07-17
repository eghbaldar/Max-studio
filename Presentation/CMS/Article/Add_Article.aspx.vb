
Partial Class Presentation_CMS_Article_Add_Article
    Inherits System.Web.UI.Page

    Dim BLL As New Article

    Protected Sub btn_news_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_article.Click

        Dim E_ As Integer = IIf(rb_enable.Checked, 1, 0)
        Dim check As Integer = BLL.Insert_Article(txt_title_article.Text, txt_matnkotah_article.Value, FCK_article.Value, E_, Session("username"), cmb_category.SelectedValue)
        Select Case check
            Case 0
                lbl_article.Text = "تمام بخش ها باید تکمیل شود"
            Case -1
                lbl_article.Text = "خطا در ذخیره سازی  - لطفا دوباره اقدام کنید"
            Case 1
                lbl_article.Text = "مقاله شما با موفقیت ذخیره شده است"
                txt_title_article.Text = ""
                txt_matnkotah_article.Value = ""
                FCK_article.Value = ""
                lbl_DG.Text = ""
                DG.DataBind()
        End Select

    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Article/Article.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - اضافه کردن مقاله"
    End Sub

    Protected Sub DG_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub
End Class
