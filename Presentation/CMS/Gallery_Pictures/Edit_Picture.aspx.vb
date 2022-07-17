Imports System.Data

Partial Class Presentation_CMS_Gallery_Pictures_Edit_Picture
    Inherits System.Web.UI.Page

    Dim BLL As New Gallery_Pictures

    Protected Sub Delete_gellry(ByVal sender As Object, ByVal e As CommandEventArgs)

        If BLL.Delete_Gallery(e.CommandArgument) Then
            DG_Edit.DataBind()
        End If

    End Sub

    Protected Sub Edit_Gallery(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim dr As DataRow = BLL.SelectRow(e.CommandArgument).Rows(0)
        txt_title_edit.Text = dr(1).ToString()
        txt_detail_edit.Text = dr(2).ToString()

        img_current.ImageUrl = "~\Presentation\CMS\Gallery_Pictures\Images_Gallery\" + dr(3)
        Session("PathPicture") = dr(3)
        Session("id_picture") = e.CommandArgument
        Dim E_ As Boolean = dr(4)
        If E_ = True Then
            rb_insert__edit.Checked = True
            rb_insert__edit2.Checked = False
        ElseIf E_ = False Then
            rb_insert__edit2.Checked = True
            rb_insert__edit.Checked = False
        End If

        cmb_album_edit.SelectedValue = dr(6)

    End Sub

    Public Function ValidationFilePath(ByVal Path As String) As Boolean

        If Path <> String.Empty Then
            Dim Postfix() As String = {"JPG", "PNG", "BMP", "GIF"}
            Dim Str As String = Mid(Path, Path.Length - 2, 3)
            Dim b As Boolean = False
            For i As Integer = 0 To Postfix.Length - 1
                If Postfix(i).ToUpper() = Str.ToUpper() Then
                    Return True
                    Exit Function
                Else : b = False
                End If
            Next
            Return b
        End If

    End Function

    Protected Sub btn_insertPicture_edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_insertPicture_edit.Click

        If cmb_album_edit.Text = "" Then
            lbl_gallery_update.Text = "تمام بخش ها باید تکمیل شود"
            Exit Sub
        End If

        Dim E_ As Integer = IIf(rb_insert__edit.Checked, 1, 0)
        Dim StrPath As String
        If FileUpload_Edit.FileName <> "" Then
            If ValidationFilePath(FileUpload_Edit.FileName) Then
                StrPath = FileUpload_Edit.FileName
                FileUpload_Edit.SaveAs(MapPath("~\Presentation\CMS\Gallery_Pictures\Images_Gallery\") + FileUpload_Edit.FileName)
                img_current.ImageUrl = "~\Presentation\CMS\Gallery_Pictures\Images_Gallery\" + StrPath
            Else
                lbl_gallery_update.Text = "فرمت تصویر را صحیح انتخاب کنید"
                Exit Sub
            End If
        Else
            StrPath = Session("PathPicture")
        End If
        '------
        Dim check As Integer = BLL.Update_Gallery(txt_title_edit.Text, txt_detail_edit.Text, StrPath, E_, Session("username"), cmb_album_edit.SelectedValue, Session("id_picture"))
        Select Case check
            Case 0
                lbl_gallery_update.Text = "تمام بخش ها باید تکمیل شود"
            Case -1
                lbl_gallery_update.Text = "خطا در ذخیره سازی  - لطفا دوباره اقدام کنید"
            Case 1
                lbl_gallery_update.Text = "اطلاعات عکس شما با موفقیت اصلاح شده است"
                DG_Edit.DataBind()
        End Select

    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Gallery_Pictures/Gallery_Pictures.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - ویرایش تصاویر "
        If Not IsPostBack Then cmb.Items.Insert(0, New ListItem("", "-1"))
    End Sub

    Protected Sub DG_Edit_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_Edit.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

End Class
