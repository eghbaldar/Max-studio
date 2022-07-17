Imports System.Data
Imports System.Drawing
Imports Microsoft.VisualBasic

<System.ComponentModel.DataObject()> _
Public Class Gallery_Pictures

    Dim DLL As New DS_Gallery_PicturesTableAdapters.GalleryTableAdapter
    Dim DLL_Category As New DS_Gallery_PicturesTableAdapters.GalleryCategoryTableAdapter

#Region "Gallery"

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable

        Try
            Return DLL.GetData
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow(ByVal ID As Long) As DataTable

        Try
            Return DLL.GetData_SelectRow(ID)
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_Gallery(ByVal Title As String, ByVal detail As String, ByVal Path As String, ByVal Thumbnails As String, ByVal flag As Byte, ByVal username As String _
                                   , ByVal code_category As Long) As Integer

        If Title = "" Then Return 0
        If detail = "" Then Return 0
        If Path = "" Then Return 0
        If username = "" Then Return 0
        If code_category = Nothing Then Return 0

        Try
            DLL.InsertQuery(Title, detail, Path, Thumbnails, flag, username, code_category)
            Return 1
        Catch ex As Exception : Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Gallery(ByVal title As String, ByVal detail As String, ByVal path As String, ByVal flag As Byte, ByVal username As String, _
                                   ByVal code_category As Long, ByVal ID As Long) As Integer

        If title = "" Then Return 0
        If detail = "" Then Return 0
        If path = "" Then Return 0
        If username = "" Then Return 0
        If code_category = Nothing Then Return 0

        Try
            DLL.Update_Gallery(title, detail, path, flag, username, code_category, ID)
            Return 1
        Catch ex As Exception : Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Gallery(ByVal ID As Long) As Boolean

        Try
            DLL.Delete_Gallery(ID)
            Return True
        Catch ex As Exception : Return False
        End Try

    End Function

#End Region

#Region "Category"

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_PictureCategory(ByVal Name As String) As Integer

        Try
            If Name = String.Empty Then Return 0

            DLL_Category.Insert_Category(Name)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_PictureCategory(ByVal Code As Long) As Boolean
        Try
            DLL_Category.Delete(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAllCategory() As DataTable

        Try
            Return DLL_Category.GetData
        Catch ex As Exception : Return Nothing
        End Try

    End Function

#End Region

#Region "Misc"

    Public Function GenerateFileName(ByVal fileName As String) As String
        Dim f As New System.IO.FileInfo(fileName)
        Dim ext As String = f.Extension
        Return (Guid.NewGuid.ToString.Replace("-", "") & ext).Trim()
        'Dim ext As String() = fileName.Split(".")
        'Return (Guid.NewGuid.ToString.Replace("-", "") & "." & ext(1)).Trim()
        'Return fileName
    End Function

    'Public Function ThumbnailCallback() As Boolean
    '    Return False
    'End Function

    'Public Function MakeThumnails(ByVal fileName As String) As String
    '    Dim f As New IO.FileInfo(fileName)
    '    Dim thumbnailsFileName As String = GenerateFileName(fileName)
    '    '=============================
    '    'ایجاد فایل کوچک
    '    Dim myCallback As Image.GetThumbnailImageAbort = New Image.GetThumbnailImageAbort(AddressOf ThumbnailCallback)
    '    Dim myBitmap As Bitmap = New Bitmap(fileName)
    '    Dim myThumbnail As Image = myBitmap.GetThumbnailImage(120, 116, myCallback, IntPtr.Zero)
    '    Dim strTemp As String = f.DirectoryName & "\" & thumbnailsFileName
    '    myThumbnail.Save(strTemp)
    '    '=============================
    '    Return thumbnailsFileName
    'End Function

    Public Function MakeThumnails(ByVal fileName As String) As String
        Dim f As New IO.FileInfo(fileName)
        Dim thumbnailsFileName As String = GenerateFileName(fileName)
        '=============================
        'ایجاد فایل کوچک
        Dim myBitmap As Bitmap = New Bitmap(fileName)
        Dim myThumbnail As Image = ResizeImage(myBitmap, 120, 116)
        Dim strTemp As String = f.DirectoryName & "\" & thumbnailsFileName
        'Dim strTemp As String = f.DirectoryName & "\1.jpg" 'thumbnailsFileName
        myThumbnail.Save(strTemp)
        '=============================
        Return thumbnailsFileName
    End Function

    Public Function ResizeImage(ByVal imgToResize As Image, ByVal Width As Integer, ByVal Height As Integer) As Image
        Dim sourceWidth As Integer = imgToResize.Width
        Dim sourceHeight As Integer = imgToResize.Height
        Dim nPercent As Single = 0
        Dim nPercentW As Single = 0
        Dim nPercentH As Single = 0
        nPercentW = Width / sourceWidth
        nPercentH = Height / sourceHeight
        If nPercentH < nPercentW Then
            nPercent = nPercentH
        Else
            nPercent = nPercentW
        End If
        Dim destWidth As Integer = CType((sourceWidth * nPercent), Integer)
        Dim destHeight As Integer = CType((sourceHeight * nPercent), Integer)
        Dim b As Bitmap = New Bitmap(destWidth, destHeight)
        Dim g As Graphics = Graphics.FromImage(CType(b, Image))
        g.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic
        g.DrawImage(imgToResize, 0, 0, destWidth, destHeight)
        g.Dispose()
        Return CType(b, Image)
    End Function

#End Region

End Class
