Imports System.Data
Imports Microsoft.VisualBasic

'#Region "Bird Category"

'<System.ComponentModel.DataObject()> _
'Public Class BirdCategory

'    Dim DAL_BirdCategory As New DS_BirdTableAdapters.Tbl_BirdCategoryTableAdapter

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
'    Public Function Insert(ByVal CategoryName As String) As Boolean

'        If CategoryName.Trim() = String.Empty Then Return False
'        Try
'            Return DAL_BirdCategory.Insert(CategoryName.Trim())
'        Catch ex As Exception
'            Return False
'        End Try

'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
'    Public Function Update(ByVal ID As Integer, ByVal CategoryName As String) As Boolean
'        Try
'            Return DAL_BirdCategory.Update(CategoryName, ID)
'        Catch ex As Exception
'            Return False
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
'    Public Function Delete(ByVal ID As Integer) As Boolean
'        Try
'            Return CBool(DAL_BirdCategory.Delete(ID))
'        Catch ex As Exception
'            Return False
'            'Throw New Exception("error")
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
'    Public Function SelectAll() As DataTable
'        Try
'            Return DAL_BirdCategory.GetData()
'        Catch ex As Exception
'            Return Nothing
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
'    Public Function SelectRow(ByVal CategoryID As Integer) As String
'        Try
'            Return DAL_BirdCategory.GetData.FindByID(CategoryID).Item("CategoryName").ToString()
'        Catch ex As Exception
'            Return String.Empty
'        End Try
'    End Function

'End Class

'#End Region

#Region "File Upload"

<System.ComponentModel.DataObject()> _
Public Class FileUpload

    Dim DAL_FP As New DS_FileUploadTableAdapters.Tbl_FileUploadTableAdapter

    '<System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    'Public Function Insert(ByVal Title As String, ByVal ShortDesc As String, ByVal FullDesc As String, ByVal PicName As String, ByVal FileName As String, ByVal Flag As Boolean, ByVal DownloadCounter As Integer) As Boolean

    '    Dim DateSend As String = String.Empty
    '    Dim TimeSend As String = String.Empty

    '    Try
    '        Return DAL_FP.Insert(Title, ShortDesc, FullDesc, PicName, FileName, Flag, DownloadCounter, DateSend, TimeSend)
    '    Catch ex As Exception
    '        Return False
    '    End Try

    'End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert(ByVal Title As String, ByVal ShortDesc As String, ByVal FullDesc As String, ByVal Flag As Boolean) As Boolean

        Dim DateSend As String = String.Empty
        Dim TimeSend As String = Now.TimeOfDay.ToString

        Try
            Return DAL_FP.InsertQuery(Title, ShortDesc, FullDesc, Flag, DateSend, TimeSend)
        Catch ex As Exception
            Return False
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update(ByVal ID As Integer, ByVal Title As String, ByVal ShortDesc As String, ByVal FullDesc As String, ByVal Flag As Boolean) As Boolean
        Try
            Return DAL_FP.UpdateQuery(Title, ShortDesc, FullDesc, Flag, ID)
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, False)> _
    Public Function AddFile(ByVal ID As Integer, ByVal FileName As String) As Boolean
        Try
            Return DAL_FP.AddFile(FileName, ID)
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, False)> _
    Public Function AddPicture(ByVal ID As Integer, ByVal PicName As String) As Boolean
        Try
            Return DAL_FP.AddPicture(PicName, ID)
        Catch ex As Exception
            Return False
        End Try
    End Function


    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, False)> _
    Public Function UpdateDownloadCounter(ByVal ID As Integer) As Boolean
        Try
            Return DAL_FP.UpdateDownloadCounter(ID)
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, False)> _
    Public Function UpdateFlag(ByVal ID As Integer, ByVal Flag As Boolean) As Boolean
        Try
            Return DAL_FP.UpdateFlag(Flag, ID)
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete(ByVal ID As Integer) As Boolean
        Try
            Return DAL_FP.Delete(ID)
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable
        Try
            Return DAL_FP.GetData()
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function SelectRow(ByVal ID As Integer) As DataRow
        Try
            Return DAL_FP.GetData.FindByID(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    Public Function GetLastID() As Integer
        Try
            Return DAL_FP.GetLastID()
        Catch ex As Exception
            Return 0
        End Try
    End Function

End Class

#End Region

'#Region "Bird Picture"

'<System.ComponentModel.DataObject()> _
'Public Class BirdPicture

'    Dim DAL_BirdPicture As New DS_BirdTableAdapters.Tbl_BirdPictureTableAdapter

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
'    Public Function Insert(ByVal BirdID As Integer, ByVal Title As String, ByVal PicName As String, ByVal ThumbnailName As String) As Boolean
'        Try
'            Return DAL_BirdPicture.Insert(BirdID, Title, PicName, ThumbnailName)
'        Catch ex As Exception
'            'Return False
'            Throw New Exception(ex.Message)
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
'    Public Function Update(ByVal PicID As Integer, ByVal BirdID As Integer, ByVal Title As String, ByVal PicName As String, ByVal ThumbnailName As String) As Boolean
'        Try
'            Return DAL_BirdPicture.Update(BirdID, Title, PicName, ThumbnailName, PicID)
'        Catch ex As Exception
'            Return False
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
'    Public Function Delete(ByVal PicID As Integer) As Boolean
'        Try
'            Return DAL_BirdPicture.Delete(PicID)
'        Catch ex As Exception
'            Return False
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
'    Public Function SelectAll() As DataTable
'        Try
'            Return DAL_BirdPicture.GetData()
'        Catch ex As Exception
'            Return Nothing
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
'    Public Function SelectRow(ByVal PicID As Integer) As DataRow
'        Try
'            Return DAL_BirdPicture.GetData.FindByID(PicID)
'        Catch ex As Exception
'            Return Nothing
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
'    Public Function SelectByBirdID(ByVal BirdID As Integer) As DataTable
'        Try
'            Return DAL_BirdPicture.GetPhotoByBirdID(BirdID)
'        Catch ex As Exception
'            Return Nothing
'        End Try
'    End Function

'End Class

'#End Region

'#Region "Bird Gallery"

'<System.ComponentModel.DataObject()> _
'Public Class BirdGallery

'    Dim DAL_BirdGallery As New DS_BirdTableAdapters.Tbl_BirdGalleryTableAdapter

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
'    Public Function Insert(ByVal Title As String, ByVal PicName As String, ByVal ThumbnailName As String) As Boolean
'        Try
'            Return DAL_BirdGallery.Insert(Title, PicName, ThumbnailName)
'        Catch ex As Exception
'            'Return False
'            Throw New Exception(ex.Message)
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
'    Public Function Update(ByVal picID As Integer, ByVal BirdID As Integer, ByVal Title As String, ByVal PicName As String, ByVal ThumbnailName As String) As Boolean
'        Try
'            Return DAL_BirdGallery.Update(Title, PicName, ThumbnailName, picID)
'        Catch ex As Exception
'            Return False
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
'    Public Function Delete(ByVal PicID As Integer) As Boolean
'        Try
'            Return DAL_BirdGallery.Delete(PicID)
'        Catch ex As Exception
'            Return False
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
'    Public Function SelectAll() As DataTable
'        Try
'            Return DAL_BirdGallery.GetData()
'        Catch ex As Exception
'            Return Nothing
'        End Try
'    End Function

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
'    Public Function SelectRow(ByVal PicID As Integer) As DataRow
'        Try
'            Return DAL_BirdGallery.GetData.FindByID(PicID)
'        Catch ex As Exception
'            Return Nothing
'        End Try
'    End Function

'End Class

'#End Region

'#Region "Gallery"

'<System.ComponentModel.DataObject()> _
'Public Class Gallery

'    Dim DAL As New DS_BirdTableAdapters.AllPictureTableAdapter

'    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
'    Public Function SelectAll() As DataTable
'        Try
'            Return DAL.GetAllPhoto()
'        Catch ex As Exception
'            Return Nothing
'        End Try
'    End Function

'End Class

'#End Region