
Partial Class Presentation_CMS_FileUpload_AddFile
    Inherits System.Web.UI.Page

#Region "Misc"

    Public Function ValidationFileExt(ByVal filename As String) As Boolean

        If filename <> String.Empty Then
            Dim Postfix() As String = {"JPG", "PNG", "BMP", "GIF"}
            Dim Str As String = Mid(filename, filename.Length - 2, 3)
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

    Public Function GenerateFileName(ByVal fileName As String) As String
        Dim f As New System.IO.FileInfo(fileName)
        Dim ext As String = f.Extension
        Return (Guid.NewGuid.ToString.Replace("-", "") & ext).Trim()
    End Function

#End Region

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim fpAction As New FileUpload
        Dim CurrentID As Integer

        If (FU_File.HasFile = False) Or (FU_File.HasFile = False) Then
            lblMsg.Visible = True
            lblMsg.Text = "ابتدا فایل های خواسته شده را انتخاب نمایید."
            Exit Sub
        End If
        If Not ValidationFileExt(FU_Pic.FileName) Then Exit Sub


        Dim bolResul As Boolean = fpAction.Insert(txtTitle.Text, ShortDesc.Value, FullDesc.Value, RadioButtonList1.SelectedValue)
        If Not bolResul Then
            lblMsg.Visible = True
            Exit Sub
        End If

        CurrentID = fpAction.GetLastID()

        'Save Image on host
        Dim PicName As String = GenerateFileName(FU_Pic.FileName)
        Dim StrPath1 As String = MapPath("ImageUpload\") + PicName
        FU_Pic.SaveAs(StrPath1)

        'Save file on host
        Dim fileName As String = CurrentID.ToString + "-" + FU_File.FileName
        Dim StrPath2 As String = MapPath("FileUpload\") + fileName
        FU_File.SaveAs(StrPath2)

        fpAction.AddFile(CurrentID, fileName)
        fpAction.AddPicture(CurrentID, PicName)

        ClearForm()
    End Sub

    Private Sub ClearForm()
        txtTitle.Text = String.Empty
        ShortDesc.Value = String.Empty
        FullDesc.Value = String.Empty
    End Sub

End Class
