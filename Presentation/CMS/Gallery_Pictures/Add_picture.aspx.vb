
Partial Class Presentation_CMS_Gallery_Pictures_Add_picture
    Inherits System.Web.UI.Page

    Dim BLL As New Gallery_Pictures

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

    Protected Sub btn_insertPicture_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_insertPicture.Click

        If cmb_album.Text = "" Then
            lbl_gallery.Text = "تمام بخش ها باید تکمیل شود"
            Exit Sub
        End If
        Dim E_ As Integer = IIf(rb_insert_1.Checked, 1, 0)
        '------
        Dim StrPath As String = ""
        Dim NewFileName As String
        Dim thumbnails As String
        If FileUpload.FileName <> String.Empty Then
            If ValidationFilePath(FileUpload.FileName) Then
                NewFileName = BLL.GenerateFileName(FileUpload.FileName)
                StrPath = MapPath("~\Presentation\CMS\Gallery_Pictures\Images_Gallery\") + NewFileName
                If Not IO.File.Exists(StrPath) Then
                    FileUpload.SaveAs(StrPath)
                    '=======================
                    'Dim f As New System.IO.FileInfo(StrPath)
                    'Dim strTemp As String = f.DirectoryName & "\" & f.FullName
                    'Response.Write(strTemp)
                    '=======================
                    thumbnails = BLL.MakeThumnails(StrPath)
                End If
            Else
                lbl_gallery.ForeColor = Drawing.Color.Red
                lbl_gallery.Text = "فرمت تصویر را صحیح انتخاب کنید"
                Exit Sub
            End If
        Else
            lbl_gallery.Text = "عکس مورد نظر را انتخاب کنید"
            Exit Sub
        End If
        '------
        Dim check As Integer = BLL.Insert_Gallery(txt_title.Text, txt_detail.Text, NewFileName, thumbnails, E_, Session("username"), cmb_album.SelectedValue)
        '------
        Select Case check
            Case 0
                lbl_gallery.Text = "تمام بخش ها باید تکمیل شود"
            Case -1
                lbl_gallery.Text = "خطا در ذخیره سازی  - لطفا دوباره اقدام کنید"
            Case 1
                lbl_gallery.Text = "عکس  شما با موفقیت ذخیره شده است"
                txt_title.Text = ""
                txt_detail.Text = ""
                DG.DataBind()
        End Select


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - اضافه کردن عکس"
    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Gallery_Pictures/Gallery_Pictures.aspx")
    End Sub

    Protected Sub DG_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub
End Class
