
Partial Class Presentation_CMS_FileUpload_EditInfo
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim InfoID As Integer = CInt(Request.QueryString("ID"))
            Dim fpAction As New FileUpload

            Dim dr As Data.DataRow = fpAction.SelectRow(InfoID)
            With dr
                txtTitle.Text = .Item("Title")
                ShortDesc.Value = .Item("ShortDesc")
                FullDesc.Value = .Item("FullDesc")
                Image1.ImageUrl = "~/Presentation/CMS/FileUpload/ImageUpload/" + .Item("PicName")
                HyperLink1.Text = .Item("FileName")
                HyperLink1.NavigateUrl = "~/Presentation/CMS/FileUpload/FileUpload/" + .Item("FileName")
                Select Case CBool(.Item("Flag"))
                    Case True
                        RadioButtonList1.SelectedIndex = 0
                    Case False
                        RadioButtonList1.SelectedIndex = 1
                End Select
            End With
        End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim fpAction As New FileUpload
        Dim InfoID As Integer = CInt(Request.QueryString("ID"))

        If ((chkFile.Checked = True) And (FU_File.HasFile = False)) Or _
           ((chkPicture.Checked = True) And (FU_Pic.HasFile = False)) Then

            lblMsg.Visible = True
            lblMsg.Text = "ابتدا فایل های خواسته شده را انتخاب نمایید."
            Exit Sub
        End If

        Dim bolResul As Boolean = fpAction.Update(InfoID, txtTitle.Text, ShortDesc.Value, FullDesc.Value, RadioButtonList1.SelectedValue)
        If Not bolResul Then
            lblMsg.Visible = True
            Exit Sub
        End If

        'Save Image on host
        If (chkPicture.Checked = True) And (FU_Pic.HasFile = True) And (ValidationFileExt(FU_Pic.FileName) = True) Then
            Dim PicName As String = GenerateFileName(FU_Pic.FileName)
            Dim StrPath1 As String = MapPath("ImageUpload\") + PicName
            FU_Pic.SaveAs(StrPath1)
            fpAction.AddPicture(InfoID, PicName)
        End If

        'Save file on host
        If (chkFile.Checked) And (FU_File.HasFile) Then
            Dim fileName As String = InfoID.ToString + "-" + FU_File.FileName
            Dim StrPath2 As String = MapPath("FileUpload\") + fileName
            FU_File.SaveAs(StrPath2)
            fpAction.AddFile(InfoID, fileName)
        End If

        Response.Redirect("Default.aspx")
    End Sub

End Class
