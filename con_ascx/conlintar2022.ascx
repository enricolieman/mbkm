<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.Oledb" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Import Namespace="System.Net.Mail" %>

<script runat="server">

    Dim connstringlintar As String = "Provider=sqloledb;Data Source=10.200.120.82,1433;Network Library=DBMSSOCN;Initial Catalog=lintar_2022;User ID=lintar22;Password=Lint4r22;connect timeout=200;pooling=false;max pool size=200"

    Dim dr As oledb.OleDbDataReader
    Dim cn As New OleDb.OleDbConnection(connstringlintar)
    Dim cmd,jmdjumlah As oledb.oledbCommand
    Dim adp as oledb.oledbdataadapter
    Dim dslist as new dataset("list")
    Dim dtlist,dtlist2,dtlist3,dtlist4,dtlist5,dtlist6 as datatable
    dim i,j,k,jmlrec,z as integer
    dim qry,bgc,ket as string

    Dim myPort As String = HttpContext.Current.Request.Url.Port
    Dim myHost As String = HttpContext.Current.Request.Url.Host
    Dim MyUrl As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Host
    Dim dirPath As String = HttpContext.Current.Request.Url.AbsolutePath
    Dim lpath() as string

    sub buka(qry as string)
        cn.Open()
        cmd = New oledb.oledbCommand(qry,cn)
        dr=cmd.executereader()
    end sub

    sub tutup()
        cn.close()
    end sub

    sub bukajml(qry as string)
        cn.Open()
        cmd = New oledb.oledbCommand(qry,cn)
        jmlrec =cmd.executescalar()
    end sub

    sub bukadoang()
        cn.open
    end sub

    sub simpan(qry as string)
        cmd=new oledb.oledbcommand(qry,cn)
        cmd.executenonquery()
    end sub

    sub isidata(qry as string,nama as string)
        cn.open()
        adp=new oledb.oledbdataadapter(qry,cn)
        adp.fill(dslist,nama)
        dtlist = dslist.tables(nama)
    end sub

    sub isidata2(qry as string,nama as string)
        cn.open()
        adp=new oledb.oledbdataadapter(qry,cn)
        adp.fill(dslist,nama)
        dtlist2 = dslist.tables(nama)
    end sub

    sub isidata3(qry as string,nama as string)
        cn.open()
        adp=new oledb.oledbdataadapter(qry,cn)
        adp.fill(dslist,nama)
        dtlist3 = dslist.tables(nama)
    end sub

    sub isidata4(qry as string,nama as string)
        cn.open()
        adp=new oledb.oledbdataadapter(qry,cn)
        adp.fill(dslist,nama)
        dtlist4 = dslist.tables(nama)
    end sub

    sub isidata5(qry as string,nama as string)
        cn.open()
        adp=new oledb.oledbdataadapter(qry,cn)
        adp.fill(dslist,nama)
        dtlist5 = dslist.tables(nama)
    end sub

    sub isidata6(qry as string,nama as string)
        cn.open()
        adp=new oledb.oledbdataadapter(qry,cn)
        adp.fill(dslist,nama)
        dtlist6 = dslist.tables(nama)
    end sub

    Sub cekauthlintar()
        If Session("idlintar") = 0 Then
            Session.RemoveAll()
            Response.Redirect("index.aspx")
        End If
    End sub

    Sub setMenu()
        lpath = split(dirPath,"/")
        If myPort <> "80" Or myPort <> "443" Then
            MyUrl += ":" & myPort
        End If
        Response.Write("<li class=""nav-item"">")
        Response.Write("<a href=""" & MyUrl & "/utama.aspx" & """ class=""nav-link""><i class=""nav-icon fas fa-university""></i><p>LINTAR</p></a>")
        Response.Write("</li>")
        Response.Write("<li class=""nav-item"">")
        Response.Write("<a href=""" & MyUrl & "/" & lpath(1) & "/index.aspx" &  """ class=""nav-link")
        Select Case lpath(1)
            Case "kerjasama"
                Response.Write(" active")
            Case "monitorruangkuliah"
                Response.Write(" active")
            Case "mbkm"
                Response.Write(" active")
            Case "yudisium"
                Response.Write(" active")
        End Select
        Response.Write("""><i class=""nav-icon fas fa-home""></i><p>Beranda</p></a>")
        Response.Write("</li>")
    End Sub

    sub tanggal()
        dim hari,tgl,bln,thn,ket as string
        hari = format(now.date,"ddd")
        tgl  = format(now.date,"dd")
        bln  = format(now.date,"MM")
        thn  = format(now.date,"yyyy")
        select case hari
            case "Mon"
                ket ="Senin, " & tgl
            case "Tue"
                ket ="Selasa, " & tgl
            case "Wed"
                ket ="Rabu, " & tgl
            case "Thu"
                ket ="Kamis, " & tgl
            case "Fri"
                ket ="Jumat, " & tgl
            case "Sat"
                ket ="Sabtu, " & tgl
            case "Sun"
                ket ="Minggu, " & tgl
        end select

        Select case bln
            case "01"
                ket = ket & " Januari "
            case "02"
                ket = ket & " Februari "
            case "03"
                ket = ket & " Maret "
            case "04"
                ket = ket & " April "
            case "05"
                ket = ket & " Mei "
            case "06"
                ket = ket & " Juni "
            case "07"
                ket = ket & " Juli "
            case "08"
                ket = ket & " Agustus "
            case "09"
                ket = ket & " September "
            case "10"
                ket = ket & " Oktober "
            case "11"
                ket = ket & " November "
            case "12"
                ket = ket & " Desember "
        end select
        ket = ket & thn
        response.write(ket)
    end sub

    Function ftglindo(ltgl as date) as string
        Dim tgl, bln, thn, ket As String
        tgl = Format(ltgl.Date, "dd")
        bln = Format(ltgl.Date, "MM")
        thn = Format(ltgl.Date, "yyyy")

        Select Case bln
            Case "01"
                ket = "JANUARI"
            Case "02"
                ket = "FEBRUARI"
            Case "03"
                ket = "MARET"
            Case "04"
                ket = "APRIL"
            Case "05"
                ket = "MEI"
            Case "06"
                ket = "JUNI"
            Case "07"
                ket = "JULI"
            Case "08"
                ket = "AGUSTUS"
            Case "09"
                ket = "SEPTEMBER"
            Case "10"
                ket = "OKTOBER"
            Case "11"
                ket = "NOVEMBER"
            Case "12"
                ket = "DESEMBER"
        End Select
        ket = tgl & " " & ket & " " & thn

        return ket
    End Function

    Public Function md5(sPassword As String) As String
        Dim x As New System.Security.Cryptography.MD5CryptoServiceProvider()
        Dim bs As Byte() = System.Text.Encoding.UTF8.GetBytes(sPassword)
        bs = x.ComputeHash(bs)
        Dim s As New System.Text.StringBuilder()
        For Each b As Byte In bs
            s.Append(b.ToString("x2").ToLower())
        Next
        Return s.ToString()
    End Function

    Public Function GetRandom(seed as integer) as string
        '//use the following string to control your set of alphabetic characters to choose from
        '//for example, you could include uppercase too
        dim alphabet,lno,result as string
        Dim RandomClass As New Random((seed + DateTime.Now.Millisecond))

        alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

        '// Random is not truly random, 
        '// so we try to encourage better randomness by always changing the seed value


        lno = int(999 * Rnd()) + seed

        '// basic 5 digit random number
        lno = RandomClass.Next(10000,99999)



        '// single random character in ascii range a-z

        dim  a1,a2 as string

        a1 = mid(alphabet,RandomClass.Next(27,52),1)
        a2 = mid(alphabet,RandomClass.Next(27,52),1)

        ''// random position to put the alpha character
        dim  i1,i2 as integer

        i1 = RandomClass.Next(1,len(lno))
        i2 = RandomClass.Next(1,len(lno))

        result = lno
        result = result.Remove(i1,1).Insert(i1,a1)
        result = result.Remove(i2,1).Insert(i2,a2)
        return result
    End Function

    Function kutip(ltext As String) As String
        Dim ltext2 As String
        If ltext.ToString.Contains("'") Then
            ltext2 = ltext.ToString.Replace("'", "''")
        Else
            ltext2 = ltext
        End If
        Return ltext2
    End Function

    function ck_kutif(lket as string) as string
        dim c,a as integer
        dim llket as string

        llket = lket
        for z = 1 to len(lket)
            c = asc(mid(lket,z,1))
            if c = 39 then
                llket = left(lket,z) & "'" & right(lket,len(lket)-z)
            end if
        next z
        return llket
    end function

    sub ambiljudul(lnama as string)
        dim spath = lnama
        dim strarry as array = spath.split("/")
        dim le as integer = strarry.length
        dim sret = strarry(le-1)
        dim ket1 as string

        qry="SELECT modulwf.deskripsi,submodulwf.deskripsi " & _
            "FROM submodulwf INNER JOIN " & _
            "modulwf ON submodulwf.modul_id = modulwf.modulid " & _
            "WHERE (submodulwf.nama_file ='" & sret & "')"
        isidata5(qry,"rsambilrecjdl")
        tutup()
        ket1="-"
        if  dtlist5.rows.count <> 0 then
            ket1 = dtlist5.rows(0)(0) & " > " &  dtlist5.rows(0)(1)
        end if
        dtlist5.clear
        response.write(ucase(ket1))
    end sub


</script>

<script language="JavaScript">
  function psnsimpan()  
   {
      return confirm("Anda Yakin ?");
   }
</script>