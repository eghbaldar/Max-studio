
Partial Class Presentation_CMS_FileUpload_InofList
    Inherits System.Web.UI.Page

    Public Function Bol2Str(ByVal bol As Boolean) As String
        Return IIf(bol = True, "قابل نمایش", "غیر قابل نمایش")
    End Function

    Public Function Bol2Color(ByVal bol As Boolean) As System.Drawing.Color
        Return IIf(bol = True, Drawing.Color.Green, Drawing.Color.Red)
    End Function

    Protected Sub gvFileList_RowCreated1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvFileList.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

End Class
