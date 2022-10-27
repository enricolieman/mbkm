<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Oledb" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    Dim connstringsr As String = "Provider=sqloledb;Data Source=10.200.120.82;Initial Catalog=sentra_ruang;Persist Security Info=True;User ID=pkl22;Password=B3lajar22"

    Dim dnsr As OleDb.OleDbDataReader
    Dim cnsr As New OleDb.OleDbConnection(connstringsr)
    Dim cmdsr, jmdjumlahsr As OleDb.OleDbCommand
    Dim adpsr As OleDb.OleDbDataAdapter
    Dim adsr As oledb.OleDbDataAdapter
    Dim dslistsr As New DataSet("listsr")
    Dim dtlistsr, dtlistsr2, dtlistsr3, dtlistsr4, dtlistsr5, dtlistsr6 As datatable
    dim jmlrecsr as integer

    Sub bukasr(qry As String)
        cnsr.Open()
        cmdsr = New oledb.oledbCommand(qry, cnsr)
        dnsr = cmdsr.executereader()
    End Sub


    Sub tutupsr()
        cnsr.close()
    End Sub

    Sub bukajmlsr(qry As String)
        cnsr.Open()
        cmdsr = New oledb.oledbCommand(qry, cnsr)
        jmlrecsr = cmdsr.ExecuteScalar()
    End Sub

    Sub bukadoangsr()
        cnsr.open
    End Sub

    Sub simpansr(qry As String)
        cmdsr = New oledb.oledbcommand(qry, cnsr)
        cmdsr.ExecuteNonQuery()
    End Sub

    Sub isidatasr(qry As String, nama As String)
        cnsr.Open()
        adpsr = New OleDb.OleDbDataAdapter(qry, cnsr)
        adpsr.Fill(dslistsr, nama)
        dtlistsr = dslistsr.Tables(nama)
    End Sub

    Sub isidatasr2(qry As String, nama As String)
        cnsr.Open()
        adpsr = New OleDb.OleDbDataAdapter(qry, cnsr)
        adpsr.Fill(dslistsr, nama)
        dtlistsr2 = dslistsr.Tables(nama)
    End Sub

    Sub isidatasr3(qry As String, nama As String)
        cnsr.Open()
        adpsr = New OleDb.OleDbDataAdapter(qry, cnsr)
        adpsr.Fill(dslistsr, nama)
        dtlistsr3 = dslistsr.Tables(nama)
    End Sub

    Sub isidatasr4(qry As String, nama As String)
        cnsr.open()
        adpsr = New oledb.oledbdataadapter(qry, cnsr)
        adpsr.fill(dslistsr, nama)
        dtlistsr4 = dslistsr.tables(nama)
    End Sub

    Sub isidatasr5(qry As String, nama As String)
        cnsr.open()
        adpsr = New oledb.oledbdataadapter(qry, cnsr)
        adpsr.fill(dslistsr, nama)
        dtlistsr5 = dslistsr.tables(nama)
    End Sub

    Sub isidatasr6(qry As String, nama As String)
        cnsr.open()
        adpsr = New oledb.oledbdataadapter(qry, cnsr)
        adpsr.fill(dslistsr, nama)
        dtlistsr6 = dslistsr.tables(nama)
    End Sub

</script>
