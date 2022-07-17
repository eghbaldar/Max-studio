
Partial Class Presentation_CMS_Article_Opp_Article
    Inherits System.Web.UI.Page
    Dim BLL As New Article

    Protected Sub cmb_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmb.SelectedIndexChanged

        If DG.Rows.Count = 0 Then
            lbl.Text = "نظری برای نمایش وجود ندارد"
        Else
            lbl.Text = ""
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - نظرات مقالات"
        If Not IsPostBack Then cmb.Items.Insert(0, New ListItem("", "-1"))
    End Sub

    Protected Sub delete(ByVal sender As Object, ByVal e As CommandEventArgs)

        Try
            BLL.Delete_ArticleNazarat(e.CommandArgument)
            DG.DataBind()
        Catch ex As Exception
        End Try
        If DG.Rows.Count = 0 Then lbl.Text = "نظری برای نمایش وجود ندارد"

    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Article/Article.aspx")
    End Sub

    Protected Sub DG_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub
End Class
