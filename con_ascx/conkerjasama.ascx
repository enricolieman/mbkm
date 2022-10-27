<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Oledb" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    Dim connstringkr As String = "Provider=sqloledb;Data Source=10.200.120.82;Initial Catalog=kerjasama;Persist Security Info=True;User ID=asma;Password=ipeUnt4r"

    Dim dnkr As OleDb.OleDbDataReader
    Dim cnkr As New OleDb.OleDbConnection(connstringkr)
    Dim cmdkr, jmdjumlahkr As OleDb.OleDbCommand
    Dim adpkr As OleDb.OleDbDataAdapter
    Dim adkr As oledb.OleDbDataAdapter
    Dim dslistkr As New DataSet("listkr")
    Dim dtlistkr, dtlistkr2, dtlistkr3, dtlistkr4, dtlistkr5, dtlistkr6, dtlistkrskpi As datatable

    Sub bukakr(qry As String)
        cnkr.Open()
        cmdkr = New oledb.oledbCommand(qry, cnkr)
        dnkr = cmdkr.executereader()
    End Sub


    Sub tutupkr()
        cnkr.close()
    End Sub

    Sub bukajmlkr(qry As String)
        cnkr.Open()
        cmdkr = New oledb.oledbCommand(qry, cnkr)
        'jmlreckr = cmdkr.ExecuteScalar()
    End Sub

    Sub bukadoangkr()
        cnkr.open
    End Sub

    Sub simpankr(qry As String)
        cmdkr = New oledb.oledbcommand(qry, cnkr)
        cmdkr.ExecuteNonQuery()
    End Sub

    Sub isidatakr(qry As String, nama As String)
        cnkr.Open()
        adpkr = New OleDb.OleDbDataAdapter(qry, cnkr)
        adpkr.Fill(dslistkr, nama)
        dtlistkr = dslistkr.Tables(nama)
    End Sub

    Sub isidatakr2(qry As String, nama As String)
        cnkr.Open()
        adpkr = New OleDb.OleDbDataAdapter(qry, cnkr)
        adpkr.Fill(dslistkr, nama)
        dtlistkr2 = dslistkr.Tables(nama)
    End Sub

    Sub isidatakr3(qry As String, nama As String)
        cnkr.Open()
        adpkr = New OleDb.OleDbDataAdapter(qry, cnkr)
        adpkr.Fill(dslistkr, nama)
        dtlistkr3 = dslistkr.Tables(nama)
    End Sub

    Sub isidatakr4(qry As String, nama As String)
        cnkr.open()
        'adpkr = New oledb.oledbdataadapter(qry, cnkr)
        'adpkr.fill(dslistkr, nama)
        dtlistkr4 = dslistkr.tables(nama)
    End Sub

    Sub isidatakr5(qry As String, nama As String)
        cnkr.open()
        'adpkr = New oledb.oledbdataadapter(qry, cnkr)
        'adpkr.fill(dslistkr, nama)
        dtlistkr5 = dslistkr.tables(nama)
    End Sub

    Sub isidatakr6(qry As String, nama As String)
        cnkr.open()
        'adpkr = New oledb.oledbdataadapter(qry, cnkr)
        'adpkr.fill(dslistkr, nama)
        dtlistkr6 = dslistkr.tables(nama)
    End Sub

    Sub isidatakrskpi(qry As String, nama As String)
        cnkr.open()
        adpkr = New OleDb.OleDbDataAdapter(qry, cnkr)
        adpkr.fill(dslistkr, nama)
        dtlistkrskpi = dslistkr.tables(nama)
    End Sub

</script>
