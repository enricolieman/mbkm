
<script runat="server">
    'sql2012
    Dim connstringakd As String = "Provider=SQLNCLI11;Data Source=DIREKTORAT-SIDB;Initial Catalog=namadb;User ID=sa;Password=password;"
   
	Dim drakd As oledb.oledbDataReader
    Dim cnakd As new oledb.oledbConnection(connstringakd)
    Dim cmdakd As oledb.oledbCommand
    Dim adpakd as oledb.oledbdataadapter
    Dim dslistakd as new dataset("list")
    Dim dtlistakd,dtlistakd2,dtlistakd3,dtlistakd4,dtlistakd5,dtlistakd6 as datatable
	
    sub bukaakd(qry as string)
        cnakd.Open()
        cmdakd = New oledb.oledbCommand(qry,cnakd)
        drakd=cmdakd.executereader()
    end sub
    
    sub tutupakd()
        cnakd.close()
    end sub
    
    
    sub bukadoangakd()
        cnakd.open
    end sub
    
    sub simpanakd(qry as string)
        cmdakd=new oledb.oledbcommand(qry,cnakd)
        cmdakd.executenonquery()
    end sub
    
    sub isidataakd(qry as string,nama as string)
      cnakd.open()
      adpakd=new oledb.oledbdataadapter(qry,cnakd)
      adpakd.fill(dslistakd,nama)
      dtlistakd = dslistakd.tables(nama)
    end sub
    
    sub isidataakd2(qry as string,nama as string)
      cnakd.open()
      adpakd=new oledb.oledbdataadapter(qry,cnakd)
      adpakd.fill(dslistakd,nama)
      dtlistakd2 = dslistakd.tables(nama)
    end sub

    sub isidataakd3(qry as string,nama as string)
      cnakd.open()
      adpakd=new oledb.oledbdataadapter(qry,cnakd)
      adpakd.fill(dslistakd,nama)
      dtlistakd3 = dslistakd.tables(nama)
    end sub
    
    sub isidataakd4(qry as string,nama as string)
      cnakd.open()
      adpakd=new oledb.oledbdataadapter(qry,cnakd)
      adpakd.fill(dslistakd,nama)
      dtlistakd4 = dslistakd.tables(nama)
    end sub
    
    sub isidataakd5(qry as string,nama as string)
      cnakd.open()
      adpakd=new oledb.oledbdataadapter(qry,cnakd)
      adpakd.fill(dslistakd,nama)
      dtlistakd5 = dslistakd.tables(nama)
    end sub
    
     sub isidataakd6(qry as string,nama as string)
      cnakd.open()
      adpakd=new oledb.oledbdataadapter(qry,cnakd)
      adpakd.fill(dslistakd,nama)
      dtlistakd6 = dslistakd.tables(nama)
    end sub


   
</script>

