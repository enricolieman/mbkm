<script runat="server">


    Dim connstringfti As String = "Provider=sqloledb;Data Source=10.200.120.82,1433;Network Library=DBMSSOCN;Initial Catalog=hrd_260616a;User ID=sa;Password=Lint4r2022;connect timeout=200;pooling=false;max pool size=200"

    Dim drsdr As oledb.oledbDataReader
    Dim cnsdr As new oledb.oledbConnection(connstringfti)
    Dim cmdsdr As oledb.oledbCommand
    Dim adpsdr as oledb.oledbdataadapter
    Dim dslistsdr as new dataset("list")
    Dim dtlistsdr, dtlistsdr2, dtlistsdr3, dtlistsdr4, dtlistsdr5, dtlistsdr6, dtlistsdr7 As datatable
    Dim ljammsk,ljamklr,labsmsk,labsklr,lket as string
    dim ltlt,lplg,lbih,ljml as integer
    dim jpla,jipla,jpta,jlembur,tot_pla,tot_lembur,tot_lebih as integer
    dim jcuti,jalpa,jmlrecsdr as integer
    dim tot_ljmljker,ljmljker,jhdr as integer
    dim jtlt,jidt,jdta,tot_telat as integer

    'dim connstringabsen as string="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files\Att2008\att2000.mdb;User Id=admin"    
    dim connstringabsen as string="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=d:\ATT2000.mdb;User Id=Admin;"
    Dim drabs As oledb.oledbDataReader
    Dim cnabs As new oledb.oledbConnection(connstringabsen)
    Dim cmdabs,jmdjumlahabs As oledb.oledbCommand
    Dim adpabs as oledb.oledbdataadapter
    Dim dslistabs as new dataset("list")
    Dim dtlistabs as datatable
    ''Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\\serverName\shareName\folder\myDatabase.mdb;User Id=admin;Password=;

    sub bukaabs(qry as string)
        cnabs.Open()
        cmdabs = New oledb.oledbCommand(qry,cnabs)
        dr=cmd.executereader()
    end sub

    sub tutupabs()
        cnabs.close()
    end sub

    sub isidataabs(qry as string,nama as string)
        cnabs.open()
        adpabs=new oledb.oledbdataadapter(qry,cnabs)
        adpabs.fill(dslistabs,nama)
        dtlistabs = dslistabs.tables(nama)
    end sub

    sub bukasdr(qry as string)
        cnsdr.Open()
        cmdsdr = New oledb.oledbCommand(qry,cnsdr)
        drsdr=cmdsdr.executereader()
    end sub

    sub tutupsdr()
        cnsdr.close()
    end sub

    sub bukajmlsdr(qry as string)
        cnsdr.Open()
        cmdsdr = New oledb.oledbCommand(qry,cnsdr)
        jmlrecsdr =cmdsdr.executescalar()
    end sub

    sub bukadoangsdr()
        cnsdr.open
    end sub

    sub simpansdr(qry as string)
        cmdsdr=new oledb.oledbcommand(qry,cnsdr)
        cmdsdr.executenonquery()
    end sub

    sub isidatasdr(qry as string,nama as string)
        cnsdr.open()
        adpsdr=new oledb.oledbdataadapter(qry,cnsdr)
        adpsdr.fill(dslistsdr,nama)
        dtlistsdr = dslistsdr.tables(nama)
    end sub

    sub isidatasdr2(qry as string,nama as string)
        cnsdr.open()
        adpsdr=new oledb.oledbdataadapter(qry,cnsdr)
        adpsdr.fill(dslistsdr,nama)
        dtlistsdr2 = dslistsdr.tables(nama)
    end sub

    sub isidatasdr3(qry as string,nama as string)
        cnsdr.open()
        adpsdr=new oledb.oledbdataadapter(qry,cnsdr)
        adpsdr.fill(dslistsdr,nama)
        dtlistsdr3 = dslistsdr.tables(nama)
    end sub

    sub isidatasdr4(qry as string,nama as string)
        cnsdr.open()
        adpsdr=new oledb.oledbdataadapter(qry,cnsdr)
        adpsdr.fill(dslistsdr,nama)
        dtlistsdr4 = dslistsdr.tables(nama)
    end sub

    sub isidatasdr5(qry as string,nama as string)
        cnsdr.open()
        adpsdr=new oledb.oledbdataadapter(qry,cnsdr)
        adpsdr.fill(dslistsdr,nama)
        dtlistsdr5 = dslistsdr.tables(nama)
    end Sub

    Sub isidatasdr6(qry As String, nama As String)
        cnsdr.open()
        adpsdr = New oledb.oledbdataadapter(qry, cnsdr)
        adpsdr.fill(dslistsdr, nama)
        dtlistsdr6 = dslistsdr.tables(nama)
    End Sub

    Sub isidatasdr7(qry As String, nama As String)
        cnsdr.open()
        adpsdr = New oledb.oledbdataadapter(qry, cnsdr)
        adpsdr.fill(dslistsdr, nama)
        dtlistsdr7 = dslistsdr.tables(nama)
    End Sub

    Sub ceksadar()
        dim lb,lh as integer

        isiharilibur(year(now()),month(now()))
        accauto(year(now()),month(now()),day(now()))

        if month(now()) = 1 then
            ceksisacutiauto()
        end if

        'ambl_absen(year(now()),month(now()),day(now()))

        'lh = day(now())
        'if lh <= 5 then
        '   lb = month(now())
        '   lb = lb - 1
        '   'ambl_absen(year(now()),lb,day(now()))
        'end if
    end sub

    sub ceksisacutiauto()
        dim thnlalu as integer

        '      qry="SELECT nik " & _
        '          "FROM t_pegawai " & _
        '          "WHERE " & _
        '          "(tglakhir IS NULL) AND (pinabsen <> 999999) AND (pinabsen is NOT NULL)  " & _
        '		  " ORDER BY t_pegawai.nik "

        qry="SELECT nik FROM t_pegawai_tdkhadir " & _
            "WHERE (YEAR(tglth) = 2015) AND (MONTH(tglth) = 12) " & _
            "GROUP BY nik " & _
            "ORDER BY nik"
        isidatasdr(qry,"rspegsiscut")
        tutupsdr()
        'response.Write(dtlistsdr.rows.count & "<br>")
        for i = 0 to dtlistsdr.rows.count - 1
            qry ="SELECT nik FROM t_pegawai_sisacuti	WHERE nik='"& dtlistsdr.rows(i)(0) &"' "
            isidatasdr2(qry,"rscekctpegz")
            tutupsdr()
            if dtlistsdr2.rows.count = 0 then
                qry="INSERT INTO t_pegawai_sisacuti(nik,thlalu,thini) " & _
                     "VALUES('" & dtlistsdr.rows(i)(0) & "',0,12)"
                bukadoangsdr()
                simpansdr(qry)
                tutupsdr()
                'response.Write(qry & "<br>")
            else
                thnlalu = fn_sisa(dtlistsdr.rows(i)(0),"2015")
                qry="UPDATE t_pegawai_sisacuti SET thlalu=" & thnlalu & "," & _
                     "thini=12 " & _
                     "WHERE nik='" & dtlistsdr.rows(i)(0) & "'"
                bukadoangsdr()
                simpansdr(qry)
                tutupsdr()
                'response.Write(qry & "<br>")
            end if
            dtlistsdr2.clear
        next i
        dtlistsdr.clear
    end sub

    Function fn_sisa(lnik as string,lthn as string) as integer
        Dim qryor, lthlalu, lthini, qryuk As String
        Dim qry_janmar, qry_apdes,qry_dispen As String
        Dim total_cuti, sisa_cuti_thl, sisa_cuti_thi As integer
        Dim sisthn1,sisthn2 as integer
        Dim sisa1, sisa2 As integer
        Dim sisa3, sisa4 As integer
        Dim jdispen as integer

        lthlalu = 0
        lthini = 0
        jdispen = 0
        sisa_cuti_thi = 0

        qry ="SELECT nik,thlalu,thini FROM t_pegawai_sisacuti_2015 " & _
             "WHERE(nik ='" & lnik & "')"
        isidatasdr5(qry,"rsthn2015")
        tutupsdr()
        If dtlistsdr5.Rows.Count = 0 Then
            sisthn1 = 0
            sisthn2 = 0
        else
            if dtlistsdr5.rows(0)(1) is dbnull.Value = true then
                sisthn1 = 0
            else
                sisthn1 = dtlistsdr5.rows(0)(1)
            end if
            if dtlistsdr5.rows(0)(2) is dbnull.Value = true then
                sisthn2 = 0
            else
                sisthn2 = dtlistsdr5.rows(0)(2)
            end if
        end if
        dtlistsdr5.clear

        qry_dispen ="SELECT COUNT(*) AS jml FROM t_pegawai_dispencuti " & _
                    "WHERE (YEAR(tglth) =" & lthn & ")  " & _
                    "AND (MONTH(tglth) <= 12 AND MONTH(tglth) >= 4) " & _
                    "AND (nik ='" & lnik & "')"
        bukajmlsdr(qry_dispen)
        tutupsdr()
        jdispen = jmlrecsdr
        jmlrecsdr = 0
        qry_janmar ="SELECT COUNT(*) AS jml " & _
                    "FROM t_pegawai_tdkhadir " & _
                    "WHERE (YEAR(tglth) = " & lthn & ") " & _
                    "AND (MONTH(tglth)>=1 AND MONTH(tglth)<=3) " & _
                    "AND (sts_acc ='ACC') " & _
                    "AND (kdth ='CT') " & _
                    "AND (nik ='" & lnik & "')"
        bukajmlsdr(qry_janmar)
        tutupsdr()

        sisa1 = sisthn1 - (jmlrecsdr)
        jmlrecsdr = 0
        qry_apdes ="SELECT COUNT(*) AS jml " & _
                   "FROM t_pegawai_tdkhadir " & _
                   "WHERE (YEAR(tglth) = " & lthn & ") " & _
                   "AND (MONTH(tglth)>=4 AND MONTH(tglth)<=12) " & _
                   "AND (sts_acc ='ACC') " & _
                   "AND (kdth ='CT') " & _
                   "AND (nik ='" & lnik & "')"
        bukajmlsdr(qry_apdes)
        tutupsdr()

        sisa2 = sisthn2 - (jmlrecsdr-jdispen)

        if sisa1 > 0  then
            sisa1 = 0
        end if

        sisa_cuti_thi = sisa1 + sisa2

        return sisa_cuti_thi
    End Function

    sub accauto(lth as integer,lbl as integer,lhr as integer)
        dim tg as string
        dim sisact as integer

        if lhr = 14 or lhr = 15 or lhr = 16 or lhr = 17 or lhr = 18 then
            ' if lhr = 7 then 'lebaran th 2015
            '====== ACC CUTI =======
            tg = lbl & "/15/" & lth
            qry="SELECT tglth,nik,kdth " & _
                "FROM t_pegawai_tdkhadir " & _
                "WHERE (sts_acc ='BELUM') " & _
                "AND (tglth <= CONVERT(DATETIME,'" & tg & "',102)) " & _
                "ORDER BY tglth DESC"
            isidatasdr4(qry,"rscutiaccauto")
            tutupsdr()
            if dtlistsdr4.rows.count <> 0 then
                for i = 0 to dtlistsdr4.rows.count - 1
                    if dtlistsdr4.rows(i)(2) = "CT" then
                        sisact= 0
                        sisact =  f_sisacuti(dtlistsdr4.rows(i)(1),lth)
                        if sisact > 0 then
                            qry="UPDATE t_pegawai_tdkhadir " & _
                                "SET sts_acc ='ACC',tgl_acc ={fn NOW()},nik_acc ='SYS' " & _
                                "WHERE (sts_acc ='BELUM') AND (tglth = CONVERT(DATETIME,'" & format(dtlistsdr4.rows(i)(0),"MM/dd/yyyy") & "',102)) " & _
                                "AND (nik='" & dtlistsdr4.rows(i)(1) & "')"
                        else
                            qry="UPDATE t_pegawai_tdkhadir " & _
                                "SET sts_acc ='TOLAK',tgl_acc ={fn NOW()},nik_acc ='SYS' " & _
                                "WHERE (sts_acc ='BELUM') AND (tglth = CONVERT(DATETIME,'" & format(dtlistsdr4.rows(i)(0),"MM/dd/yyyy") & "',102)) " & _
                                "AND (nik='" & dtlistsdr4.rows(i)(1) & "')"
                        end if
                    else
                        qry="UPDATE t_pegawai_tdkhadir " & _
                            "SET sts_acc ='ACC',tgl_acc ={fn NOW()},nik_acc ='SYS' " & _
                            "WHERE (sts_acc ='BELUM') AND (tglth = CONVERT(DATETIME,'" & format(dtlistsdr4.rows(i)(0),"MM/dd/yyyy") & "',102)) " & _
                            "AND (nik='" & dtlistsdr4.rows(i)(1) & "')"
                    end if
                    'if dtlistsdr4.rows(i)(1) ="10412002" then 
                    '   response.Write(qry & "<br>") 
                    'end if
                    bukadoangsdr()
                    simpansdr(qry)
                    tutupsdr()
                next
            end if
            dtlistsdr4.clear

            '====== ACC IJIN =======
            qry="SELECT tglijin,nik,kdijin FROM t_pegawai_ijin " & _
                "WHERE (sts_acc ='BELUM') AND (tglijin <= CONVERT(DATETIME,'" & tg & "', 102)) " & _
                "ORDER BY tglijin DESC"
            isidatasdr4(qry,"rsijinaccauto")
            tutupsdr()
            if dtlistsdr4.rows.count <> 0 then
                qry="UPDATE t_pegawai_ijin " & _
                    "SET sts_acc = 'ACC',tgl_acc ={fn NOW()},nik_acc = 'SYS' " & _
                    "WHERE (sts_acc ='BELUM') AND (tglijin <= CONVERT(DATETIME,'" & tg & "',102))"
                bukadoangsdr()
                simpansdr(qry)
                tutupsdr()
            end if
            dtlistsdr4.clear

            '====== ACC BATAL IJIN,CUTI,DAN LEMBUR =======
            qry="SELECT recid,nik_user,tgl_user,tgl_input_user,acc_sekretariat,jenis_request FROM t_batal_icl " & _
                "WHERE (acc_sekretariat ='BELUM') AND (tgl_user <= CONVERT(DATETIME,'" & tg & "',102)) " & _
                "ORDER BY tgl_user DESC"
            isidatasdr6(qry,"rsbtlaccauto")
            tutupsdr()

            if dtlistsdr6.rows.count <> 0 then
                bukadoangsdr()
                for i = 0 to dtlistsdr6.rows.count - 1
                    qry ="update t_batal_icl set acc_sekretariat='ACC'" & _
                               ",nik_sekretariat='SYS', " & _
                               "tgl_acc_sekretariat=CONVERT(DATETIME,'" & Format(Now(), "MM/dd/yyyy") & "',102) " & _
                               "where recid='" & dtlistsdr6.Rows(i)(0) & "'"
                    simpansdr(qry)
                    Select Case dtlistsdr6.Rows(i)(5)
                        Case "I"
                            qry ="delete from t_pegawai_ijin where nik='" & dtlistsdr6.Rows(i)(1) & "' and tglijin='" & format(dtlistsdr6.Rows(i)(2),"MM/dd/yyyy") & "'"
                            simpansdr(qry)
                        Case "C"
                            qry="delete from t_pegawai_tdkhadir where nik='" & dtlistsdr6.Rows(i)(1) & "' and tglth='" & format(dtlistsdr6.Rows(i)(2),"MM/dd/yyyy") & "'"
                            simpansdr(qry)
                        Case "L"
                            qry="delete from t_pegawai_lembur where nik='" & dtlistsdr6.Rows(i)(1) & "' and tgllembur='" & format(dtlistsdr6.Rows(i)(2),"MM/dd/yyyy") & "'"
                            simpansdr(qry)
                    End Select
                next i
                tutupsdr()
            end if
            dtlistsdr6.clear
        end if
    end sub


    '==== sadar =====
    sub ambl_absen(lth as integer,lbln as integer,ltg as integer)
        dim ljamkrjm,ljamkrjk as string
        dim ljml,ljbih,ljdul,ltlt,jm1,jm2 as integer

        '=== absen dateng maks 11.59
        qry="SELECT t_absenio.userId,t_absenio.Tgl_jam,t_absenio.verifikasi,t_absenio.status," & _
            "t_absenio.ip,t_peg.nik,t_peg.kd_jnspeg,t_status.kdjam,t_mstjamkerja.jammsk," & _
            "t_mstjamkerja.jamklr FROM t_status LEFT OUTER JOIN " & _
            "t_mstjamkerja ON t_status.kdjam = t_mstjamkerja.kdjam RIGHT OUTER JOIN " & _
            "t_peg ON t_status.kdstatus = t_peg.kd_jnspeg RIGHT OUTER JOIN " & _
            "t_absenio ON t_peg.pinabsen = t_absenio.userId " & _
            "WHERE (YEAR(t_absenio.Tgl_jam) =" & lth & ") " & _
            "AND (MONTH(t_absenio.Tgl_jam) =" & lbln & ") " & _
            "AND (DAY(t_absenio.Tgl_jam) =" & ltg & ") " & _
            "AND ({ fn HOUR(t_absenio.Tgl_jam) } <= 11) " & _
            "AND ({ fn MINUTE(t_absenio.Tgl_jam) } <= 59) " & _
            "ORDER BY t_absenio.userId, t_absenio.Tgl_jam"
        isidatasdr2(qry,"rstglhdrdat")
        tutupsdr()
        '=== untuk tiap record kedatangan
        '=== periksa apakah sudah ada di tpegawai hadir
        '==== jika belum insert
        '==== jika sudah ada update
        for i = 0 to dtlistsdr2.rows.count - 1
            if dtlistsdr2.rows(i)(5) is dbnull.value = true or dtlistsdr2.rows(i)(8) is dbnull.value = true or dtlistsdr2.rows(i)(9) is dbnull.value = true then
                continue for
            end if
            qry="SELECT nik,tglhdr,jammsk " & _
                "FROM t_pegawai_hadir " & _
                "WHERE (nik ='" & trim(dtlistsdr2.rows(i)(5)) & "') " & _
                "AND (tglhdr = CONVERT(DATETIME,'" & lbln & "/" & ltg & "/" & lth & "',102))"
            isidatasdr(qry,"rsckrs")
            tutupsdr()
            if dtlistsdr.rows.count = 0 then
                ljamkrjm = konversijam(format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy"),dtlistsdr2.rows(i)(8))
                ljamkrjk = konversijam(format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy"),dtlistsdr2.rows(i)(9))
                ltlt = Datediff(dateinterval.minute,cDate(ljamkrjm),dtlistsdr2.rows(i)(1))
                if ltlt < 5 then
                    ltlt = 0
                end if

                qry="INSERT INTO t_pegawai_hadir " & _
                    "(nik,tglhdr,jammsk,kdjam,jamkrj_msk,jamkrj_plg,telatmsk,pulangdln,jamlebih,jmljamkrj) " & _
                    "VALUES('" & dtlistsdr2.rows(i)(5) & "',CONVERT(DATETIME,'" & format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy") & "',102)," & _
                    "CONVERT(DATETIME,'" & format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "',102)," & _
                    "'" & dtlistsdr2.rows(i)(7) & "',CONVERT(DATETIME,'" & ljamkrjm & "',102)," & _
                    "CONVERT(DATETIME,'" & ljamkrjk & "',102)," & _
                    ltlt & ",0,0,0)"
                bukadoangsdr()
                simpansdr(qry)
                tutupsdr()
            else
                '==== update jam masuk=======
                if dtlistsdr.rows(0)(2) is dbnull.value = false then
                    jm1 = hour(dtlistsdr.rows(0)(2))
                    jm2 = hour(dtlistsdr2.rows(i)(1))
                end if
                if dtlistsdr.rows(0)(2) is dbnull.value = true or jm2 < jm1 then
                    ljamkrjm = konversijam(format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy"),dtlistsdr2.rows(i)(8))
                    ltlt = Datediff(dateinterval.minute,cDate(ljamkrjm),dtlistsdr2.rows(i)(1))
                    if ltlt < 5 then
                        ltlt = 0
                    end if
                    qry="UPDATE t_pegawai_hadir " & _
                        "SET jammsk = CONVERT(DATETIME,'" & format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "',102), " & _
                        "telatmsk =" & ltlt & " " & _
                        "WHERE (nik ='" & trim(dtlistsdr2.rows(i)(5)) & "') " & _
                        "AND (tglhdr = CONVERT(DATETIME,'" & lbln & "/" & ltg & "/" & lth & "',102))"
                    bukadoangsdr()
                    simpansdr(qry)
                    tutupsdr()
                end if
            end if
            dtlistsdr.clear
        next i
        dtlistsdr2.clear

        '========PULANG ================
        '== absen pulang min 12.00 WIB
        qry="SELECT t_absenio.userId,t_absenio.Tgl_jam,t_absenio.verifikasi,t_absenio.status," & _
            "t_absenio.ip,t_peg.nik,t_peg.kd_jnspeg,t_status.kdjam,t_mstjamkerja.jammsk," & _
            "t_mstjamkerja.jamklr FROM t_status LEFT OUTER JOIN " & _
            "t_mstjamkerja ON t_status.kdjam = t_mstjamkerja.kdjam RIGHT OUTER JOIN " & _
            "t_peg ON t_status.kdstatus = t_peg.kd_jnspeg RIGHT OUTER JOIN " & _
            "t_absenio ON t_peg.pinabsen = t_absenio.userId " & _
            "WHERE (YEAR(t_absenio.Tgl_jam) =" & lth & ") " & _
            "AND (MONTH(t_absenio.Tgl_jam) =" & lbln & ") " & _
            "AND (DAY(t_absenio.Tgl_jam) =" & ltg & ") " & _
            "AND ({ fn HOUR(t_absenio.Tgl_jam) } >= 12) " & _
            "AND ({ fn MINUTE(t_absenio.Tgl_jam) } >= 0) " & _
            "ORDER BY t_absenio.userId, t_absenio.Tgl_jam desc"
        isidatasdr2(qry,"rstglhdrpul")
        tutupsdr()
        'response.Write(qry & " " & dtlistsdr2.rows.count)
        '=== untuk tiap record kepulangan
        '=== periksa apakah sudah ada di tpegawai hadir
        '==== jika belum insert
        '==== jika sudah ada update
        for i = 0 to dtlistsdr2.rows.count - 1
            if dtlistsdr2.rows(i)(5) is dbnull.value = true or dtlistsdr2.rows(i)(8) is dbnull.value = true or dtlistsdr2.rows(i)(9) is dbnull.value = true then
                continue for
            end if
            qry="SELECT nik,tglhdr,jammsk,jamklr,kdjam,jamkrj_msk,jamkrj_plg " & _
                "FROM t_pegawai_hadir " & _
                "WHERE (nik ='" & trim(dtlistsdr2.rows(i)(5)) & "') " & _
                "AND (tglhdr = CONVERT(DATETIME,'" & lbln & "/" & ltg & "/" & lth & "',102))"
            isidatasdr(qry,"rsckrspul")
            tutupsdr()
            if dtlistsdr.rows.count <> 0 then
                if dtlistsdr.rows(0)(3) is dbnull.Value = true then
                    ljml  = 0
                    ljbih = 0
                    ljdul = 0
                    if dtlistsdr.rows(0)(2) Is dbnull.value = false then
                        ljml = Datediff(dateinterval.minute,dtlistsdr.rows(0)(2),dtlistsdr2.rows(i)(1))
                    end if

                    'response.write(dtlistsdr2.rows(i)(5) & " dan " & dtlistsdr.rows(0)(2) & " dan " & dtlistsdr2.rows(i)(1) & " => " & ljml/60 & "<br>")		

                    ljbih = Datediff(dateinterval.minute,dtlistsdr.rows(0)(6),dtlistsdr2.rows(i)(1))
                    if ljbih < 5 then
                        ljbih = 0
                    end if

                    ljdul = Datediff(dateinterval.minute,dtlistsdr.rows(0)(6),dtlistsdr2.rows(i)(1))
                    if ljdul > 0 then
                        ljdul = 0
                    else
                        ljdul = ljdul * -1
                    end if

                    qry="UPDATE t_pegawai_hadir " & _
                        "SET jamklr = CONVERT(DATETIME,'" & format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "', 102) " & _
                        ",jamlebih=" & ljbih & ",pulangdln=" & ljdul & ",jmljamkrj=" & ljml & _
                        " WHERE (tglhdr = CONVERT(DATETIME,'" & format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy") & "', 102)) " & _
                        "AND (nik ='" & dtlistsdr2.rows(i)(5) & "')"
                    bukadoangsdr()
                    simpansdr(qry)
                    tutupsdr()
                end if
            else
                '==== Berarti ada absen pulang ga ada absen masuk=====
                'response.Write("tdk ada<br>") 
                ljamkrjm = konversijam(format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy"),dtlistsdr2.rows(i)(8))
                ljamkrjk = konversijam(format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy"),dtlistsdr2.rows(i)(9))

                ljbih = Datediff(dateinterval.minute,cdate(ljamkrjk),dtlistsdr2.rows(i)(1))
                if ljbih < 5 then
                    ljbih = 0
                end if

                ljdul = Datediff(dateinterval.minute,cdate(ljamkrjk),dtlistsdr2.rows(i)(1))
                if ljdul > 0 then
                    ljdul = 0
                else
                    ljdul = ljdul * -1
                end if

                qry="INSERT INTO t_pegawai_hadir " & _
                    "(nik,tglhdr,jamklr,kdjam,jamkrj_msk,jamkrj_plg,pulangdln,jamlebih,jmljamkrj) " & _
                    "VALUES('" & dtlistsdr2.rows(i)(5) & "',CONVERT(DATETIME,'" & format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy") & "',102)," & _
                    "CONVERT(DATETIME,'" & format(dtlistsdr2.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "',102)," & _
                    "'" & dtlistsdr2.rows(i)(7) & "',CONVERT(DATETIME,'" & ljamkrjm & "',102)," & _
                    "CONVERT(DATETIME,'" & ljamkrjk & "',102)" & _
                    "," & ljdul & "," & ljbih & ",0)"
                bukadoangsdr()
                simpansdr(qry)
                tutupsdr()
            end if
            dtlistsdr.clear
        next i
        dtlistsdr2.clear
    end Sub

    Sub presensi(lnik As String, lthn As Integer, lbln As Integer) ',lhkis as integer)
        Dim ltlt, jtlt, jidt, jdta, tot_telat As Integer
        Dim lplg, jpla, jipla, jpta, jlembur, tot_pla, tot_lembur, tot_lebih As Integer
        Dim jcuti, jalpa As Integer
        Dim tot_ljmljker, ljmljker, jhdr As Integer

        ltlt = 0
        jtlt = 0
        jidt = 0
        jdta = 0
        tot_telat = 0
        lplg = 0
        jpla = 0
        jipla = 0
        jpta = 0
        jlembur = 0
        tot_pla = 0
        jcuti = 0
        jalpa = 0
        jhdr = 0
        tot_ljmljker = 0
        For j = 1 To 31
            If IsDate(lbln & "/" & j & "/" & lthn) = False Then
                Exit For
            End If

            If CDate(lbln & "/" & j & "/" & lthn) > Now.Date Then
                Exit For
            End If

            ltlt = 0
            lplg = 0
            ljmljker = 0
            qry = "SELECT tgl,ketlbr,kettrans FROM t_hrilibur " & _
                "WHERE (tgl =CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "',102))"
            isidatasdr4(qry, "rshrilbr")
            tutupsdr()
            If dtlistsdr4.rows.count <> 0 Then
                ''=== ini berarti hari libur, cek itung absen ga====
                If Trim(dtlistsdr4.rows(0)(2)) = "Ya" Then
                    jhdr = jhdr + 1
                End If
                dtlistsdr4.clear
                qry = "SELECT tglhdr,jamkrj_msk,jamkrj_plg,jammsk,jamklr,telatmsk,pulangdln,jamlebih " & _
                    "FROM t_pegawai_hadir " & _
                    "WHERE (nik ='" & lnik & "') AND (tglhdr ='" & lbln & "/" & j & "/" & lthn & "')"
                isidatasdr6(qry, "rspeghdr")
                tutupsdr()
                If dtlistsdr6.rows.count <> 0 Then
                    qry = "SELECT t_pegawai_lembur.nik,t_pegawai_lembur.tgllembur,t_pegawai_lembur.kdlembur,t_lembur.ketlembur " & _
                        "FROM t_pegawai_lembur LEFT OUTER JOIN t_lembur ON t_pegawai_lembur.kdlembur = t_lembur.kdlembur " & _
                        "WHERE (t_pegawai_lembur.nik ='" & lnik & "') AND " & _
                        "(t_pegawai_lembur.tgllembur = CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "', 102))"
                    isidatasdr4(qry, "rslembur")
                    tutupsdr()
                    If dtlistsdr4.rows.count <> 0 Then
                        jhdr = jhdr + 1
                    End If
                    dtlistsdr4.clear
                End If
                dtlistsdr6.clear
                ''===End hari libur ====
            Else
                ''===== Masuk, bagian ini hari masuk kerja/tidak libur ======
                qry = "SELECT tglhdr,jamkrj_msk,jamkrj_plg,jammsk,jamklr,telatmsk,pulangdln,jamlebih " & _
                    "FROM t_pegawai_hadir " & _
                    "WHERE (nik ='" & lnik & "') AND (tglhdr ='" & lbln & "/" & j & "/" & lthn & "')"
                isidatasdr6(qry, "rspeghdr")
                tutupsdr()
                If dtlistsdr6.rows.count <> 0 Then
                    ''========== Absen nya Ada    ==================================
                    ''===== Cek absen kedatangan (telat dateng,DTA,IDT dll ) =============
                    If dtlistsdr6.rows(0)(3) Is DBNull.Value = False Then
                        ltlt = DateDiff(DateInterval.Minute, dtlistsdr6.rows(0)(1), dtlistsdr6.rows(0)(3))
                        'response.write("<font color='#FFFFFF'>" & ltlt & "-" & dtlistsdr6.rows(0)(1) & "-" & dtlistsdr6.rows(0)(3) & "</font><br>")
                        If ltlt >= 5 Then
                            ''====cek IDT ada ga =====
                            qry = "SELECT kdijin,nik,tglijin FROM t_pegawai_ijin " & _
                               "WHERE (nik ='" & lnik & "') AND (tglijin = CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "', 102)) " & _
                               "AND (jnsijin='IDT') " & _
                               "ORDER BY kdijin"
                            isidatasdr4(qry, "rsijinxc")
                            tutupsdr()
                            If dtlistsdr4.rows.count <> 0 Then
                                ''===== tdk di itung telat =====
                                jidt = jidt + 1
                            Else
                                ''===== di itung telat
                                jtlt = jtlt + 1
                                tot_telat = tot_telat + ltlt
                            End If
                            dtlistsdr4.clear
                        End If
                    Else
                        ''==== Datang tanpa absen ======
                        ''==== Ada juga kondisi nulis ijin datang tapi ga absen (action : diitung IDT dan DTA nya )====
                        qry = "SELECT kdijin,nik,tglijin FROM t_pegawai_ijin " & _
                            "WHERE (nik ='" & lnik & "') AND (tglijin = CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "', 102)) " & _
                            "AND (jnsijin='IDT') " & _
                            "ORDER BY kdijin"
                        isidatasdr4(qry, "rsijinr2")
                        tutupsdr()
                        If dtlistsdr4.rows.count <> 0 Then
                            jidt = jidt + 1
                        End If
                        dtlistsdr4.clear
                        jdta = jdta + 1
                    End If
                    ''===== End Cek absen kedatangan (telat dateng,DTA,IDT dll ) =============

                    ''========== cek absen Kepulangan ==========================
                    ''=========== (PTA,PLA,IPLA,LEMBUR) ===============================
                    If dtlistsdr6.rows(0)(4) Is DBNull.Value = False Then
                        lplg = DateDiff(DateInterval.Minute, dtlistsdr6.rows(0)(2), dtlistsdr6.rows(0)(4))
                        'response.write("<font color='#FFFFFF'>" & lplg & "-" & dtlistsdr6.rows(0)(2) & "-" & dtlistsdr6.rows(0)(4) & "</font><br>")
                        If lplg <= -5 Then
                            ''====cek PLA, IPLA =====
                            qry = "SELECT kdijin,nik,tglijin FROM t_pegawai_ijin " & _
                                "WHERE (nik ='" & lnik & "') AND (tglijin = CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "', 102)) " & _
                                "AND (jnsijin='IPLA') " & _
                                "ORDER BY kdijin"
                            isidatasdr4(qry, "rsijin2")
                            tutupsdr()
                            If dtlistsdr4.rows.count <> 0 Then
                                jipla = jipla + 1
                            Else
                                jpla = jpla + 1
                                tot_pla = tot_pla + (lplg * -1)
                            End If
                            dtlistsdr4.clear
                        Else
                            ''====cek lembur ======
                            qry = "SELECT t_pegawai_lembur.nik,t_pegawai_lembur.tgllembur,t_pegawai_lembur.kdlembur,t_lembur.ketlembur " & _
                                "FROM t_pegawai_lembur LEFT OUTER JOIN t_lembur ON t_pegawai_lembur.kdlembur = t_lembur.kdlembur " & _
                                "WHERE (t_pegawai_lembur.nik ='" & lnik & "') AND " & _
                                "(t_pegawai_lembur.tgllembur = CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "', 102))"
                            isidatasdr4(qry, "rslembur")
                            tutupsdr()
                            If dtlistsdr4.rows.count <> 0 Then
                                jlembur = jlembur + 1
                                tot_lembur = tot_lembur + lplg
                            End If
                            tot_lebih = tot_lebih + lplg
                            dtlistsdr4.clear
                            ''====end cek lembur ==
                        End If
                    Else
                        ''=== PTA =====
                        ''=== Ada kondisi ijin tapi ga absen pulang itu diapain action nya (di itung ipla dan pta-nya)====
                        qry = "SELECT kdijin,nik,tglijin FROM t_pegawai_ijin " & _
                            "WHERE (nik ='" & lnik & "') AND (tglijin = CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "', 102)) " & _
                            "AND (jnsijin='IPLA') " & _
                            "ORDER BY kdijin"
                        isidatasdr4(qry, "rsijin2q")
                        tutupsdr()
                        If dtlistsdr4.rows.count <> 0 Then
                            jipla = jipla + 1
                        End If
                        dtlistsdr4.clear
                        jpta = jpta + 1
                    End If
                    ''========== end cek absen Kepulangan ==========================

                    ''======  itung jumlah jam kerja ================
                    'if lhkis <> 0 then
                    '   ljmljker = lhkis * 60 ''===dikali 60 karena lhkis itu perjam  
                    '	tot_ljmljker = tot_ljmljker + ljmljker
                    ''====simpan ke histori hak istimewa ===
                    '	qry="INSERT INTO t_histo_hakis(nik,tglhdr,jmljamhakis) " & _
                    '       "VALUES('" & lnik & "',CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "', 102)," & lhkis & ")"
                    '   bukadoangsdr()
                    '   simpansdr(qry)
                    '   tutupsdr()
                    'else
                    If dtlistsdr6.rows(0)(3) Is DBNull.Value = False And dtlistsdr6.rows(0)(4) Is DBNull.Value = False Then
                        ljmljker = DateDiff(DateInterval.Minute, dtlistsdr6.rows(0)(3), dtlistsdr6.rows(0)(4))
                        tot_ljmljker = tot_ljmljker + ljmljker
                    Else
                        If dtlistsdr6.rows(0)(3) Is DBNull.Value = False And dtlistsdr6.rows(0)(4) Is DBNull.Value = True Then
                            ''===== ga ada absen pulang ===
                            'ljmljker = Datediff(dateinterval.minute,dtlistsdr6.rows(0)(3),dtlistsdr6.rows(0)(2)) 
                            'tot_ljmljker = tot_ljmljker + ljmljker
                        Else
                            If dtlistsdr6.rows(0)(3) Is DBNull.Value = True And dtlistsdr6.rows(0)(4) Is DBNull.Value = False Then
                                ''=== ga ada absen masuk ============
                                'ljmljker = Datediff(dateinterval.minute,dtlistsdr6.rows(0)(1),dtlistsdr6.rows(0)(4)) 
                                'tot_ljmljker = tot_ljmljker + ljmljker
                            End If
                        End If
                    End If
                    'end if 	
                    jhdr = jhdr + 1
                    ''========== End absennya ada ================================== 
                Else
                    ''========== Tidak ada Absennya =============== 
                    ''==========CUTI, ALPA ========================
                    qry = "SELECT kdth,nik,tglth FROM t_pegawai_tdkhadir " & _
                        "WHERE (nik ='" & lnik & "') AND (tglth = CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "',102))"
                    isidatasdr4(qry, "rstdkhdrxx")
                    tutupsdr()
                    If dtlistsdr4.rows.count <> 0 Then
                        jcuti = jcuti + 1
                        jhdr = jhdr + 1
                    Else
                        jalpa = jalpa + 1
                    End If
                    dtlistsdr4.clear
                End If
                dtlistsdr6.clear
            End If ''===== Masuk End =========================================
        Next j

        ''=============bagian simpen ke tbl presensi =================
        qry = "SELECT nip,tahun,bulan FROM t_presensi WHERE (nip ='" & lnik & "') AND (tahun = " & lthn & ") AND (bulan =" & lbln & ")"
        isidatasdr3(qry, "rscrpre")
        tutupsdr()
        If dtlistsdr3.rows.count = 0 Then
            qry = "INSERT INTO t_presensi " & _
                "(nip,tahun,bulan,hadir,cuti,idt,ipla,lembur,terlambat,pla,dta,pta,alpa,tot_telat,tot_pla,tgl,tot_jmkerja,tot_lembur,tot_lebih) " & _
                "VALUES('" & lnik & "'," & lthn & "," & lbln & "," & jhdr & "," & jcuti & "," & jidt & "," & jipla & "," & jlembur & _
                "," & jtlt & "," & jpla & "," & jdta & "," & jpta & "," & jalpa & _
                "," & tot_telat & "," & tot_pla & ",CONVERT(DATETIME,'" & Format(Now(), "MM/dd/yyyy HH:mm:ss") & "',102)," & tot_ljmljker & _
                "," & tot_lembur & "," & tot_lebih & ")"
            bukadoangsdr()
            simpansdr(qry)
            tutupsdr()
        Else
            qry = "UPDATE t_presensi " & _
                "SET hadir = " & jhdr & ",cuti =" & jcuti & ",idt =" & jidt & ",ipla =" & jipla & ",lembur =" & jlembur & "," & _
                "terlambat = " & jtlt & ",pla =" & jpla & ",dta =" & jdta & ",pta =" & jpta & ",alpa =" & jalpa & "," & _
                "tot_telat = " & tot_telat & ",tot_pla =" & tot_pla & "," & _
                "tgl = CONVERT(DATETIME,'" & Format(Now(), "MM/dd/yyyy HH:mm:ss") & "',102),tot_jmkerja=" & tot_ljmljker & _
                ",tot_lembur=" & tot_lembur & ",tot_lebih=" & tot_lebih & _
                " WHERE (nip ='" & lnik & "') AND (tahun =" & lthn & ") AND (bulan =" & lbln & ")"
            bukadoangsdr()
            simpansdr(qry)
            tutupsdr()
        End If
        dtlistsdr3.clear
        'response.write(qry & "<br>")
    End Sub

    Sub ambilabsen(lthn as integer,lbln as integer)
        on error goto psn

        dim ljamkrjm as string
        dim ljamkrjk as string
        dim ljml,ljbih,ljdul,ltlt,lhakis as integer

        qry="Select userinfo.badgenumber,checkinout.checktime,checkinout.checktype from checkinout,userinfo where checkinout.userid=userinfo.userid " & _
              " AND year(checkinout.checktime)=" & lthn & " and month(checkinout.checktime)=" & lbln & " " & _
              "Order by userinfo.badgenumber,checkinout.checktime,checkinout.checktype"
        isidataabs(qry,"rsambl")
        tutupabs()
        if dtlistabs.rows.count <> 0 then
            for i = 0 to dtlistabs.rows.count - 1
                qry="SELECT t_pegawai.nik, t_pegawai.kdstatus, t_status.kdjam, t_mstjamkerja.jammsk, t_mstjamkerja.jamklr " & _
                    "FROM t_pegawai INNER JOIN t_status ON t_pegawai.kdstatus = t_status.kdstatus INNER JOIN " & _
                    "t_mstjamkerja ON t_status.kdjam = t_mstjamkerja.kdjam " & _
                    "WHERE (t_pegawai.pinabsen ='" & dtlistabs.rows(i)(0) & "')"
                isidatasdr(qry,"rsnik")
                tutupsdr()
                if dtlist.rows.count <> 0 then
                    if dtlist.rows.count <> 1 then
                        dtlist.clear
                        qry="SELECT t_pegawai.nik, t_pegawai.kdstatus, t_status.kdjam, t_mstjamkerja.jammsk, t_mstjamkerja.jamklr " & _
                            "FROM t_pegawai INNER JOIN t_status ON t_pegawai.kdstatus = t_status.kdstatus INNER JOIN " & _
                            "t_mstjamkerja ON t_status.kdjam = t_mstjamkerja.kdjam " & _
                            "WHERE (t_pegawai.pinabsen ='" & dtlistabs.rows(i)(0) & "') AND (substring(t_pegawai.kdstatus,1,2)='S2')"
                        isidata(qry,"rsnikk")
                        tutupsdr()
                    end if
                    ljamkrjm = konversijam(format(dtlistabs.rows(i)(1),"MM/dd/yyyy"),dtlist.rows(0)(3))
                    ljamkrjk = konversijam(format(dtlistabs.rows(i)(1),"MM/dd/yyyy"),dtlist.rows(0)(4))
                    select case ucase(dtlistabs.rows(i)(2))
                        case "I" ''=====absen masuk =====
                            qry="SELECT nik,tglhdr,jammsk,jamklr,jamkrj_msk,jamkrj_plg FROM t_pegawai_hadir " & _
                                "WHERE (tglhdr = CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy") & "',102)) " & _
                                "AND (nik='" & dtlist.rows(0)(0) & "') order by jammsk"
                            isidata2(qry,"rscrabsm")
                            tutupsdr()
                            ltlt = Datediff(dateinterval.minute,cDate(ljamkrjm),dtlistabs.rows(i)(1))
                            if ltlt < 4 then
                                ltlt = 0
                            end if
                            if dtlist2.rows.count <> 0 then
                                ''==absen udah ada, update ====
                                ''============== bandingin jam masuknya lebih kecil mana yg dri absen atau yg udah ada==
                                ''============== kalo lebih kecil absen maka update , kalo lebih kecil yg sudah ada ga perlu update ===
                                if dtlistabs.rows(i)(1) < dtlist2.rows(0)(2) then
                                    qry="UPDATE t_pegawai_hadir " & _
                                        "SET jammsk =CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "',102)," & _
                                        "kdjam ='" & dtlist.rows(0)(2) & "'," & _
                                        "jamkrj_msk =CONVERT(DATETIME,'" & format(ljamkrjm) & "',102)," & _
                                        "jamkrj_plg =CONVERT(DATETIME,'" & format(ljamkrjk) & "',102)," & _
                                        "telatmsk =" & ltlt & _
                                        " WHERE (nik ='" & dtlist.rows(0)(0) & "') AND " & _
                                        "(tglhdr = CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy") & "',102))"
                                    bukadoangsdr()
                                    simpansdr(qry)
                                    tutupsdr()
                                end if
                            else
                                ''==absen blum ada, insert====
                                qry="INSERT INTO t_pegawai_hadir(nik,tglhdr,jammsk,kdjam,jamkrj_msk,jamkrj_plg,telatmsk,pulangdln,jamlebih,jmljamkrj) " & _
                                    "VALUES('" & dtlist.rows(0)(0) & "'," & _
                                    "CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy") & "',102)," & _
                                    "CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "',102)," & _
                                    "'" & dtlist.rows(0)(2) & "'," & _
                                    "CONVERT(DATETIME,'" & format(ljamkrjm) & "',102)," & _
                                    "CONVERT(DATETIME,'" & format(ljamkrjk) & "',102)" & _
                                    "," & ltlt & ",0,0,0)"
                                bukadoangsdr()
                                simpansdr(qry)
                                tutupsdr()
                            end if
                            dtlist2.clear
                        case "O" ''=== absen keluar ===
                            qry="SELECT nik,tglhdr,jammsk,jamklr,jamkrj_msk,jamkrj_plg FROM t_pegawai_hadir " & _
                                "WHERE (tglhdr = CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy") & "',102)) " & _
                                "AND (nik='" & dtlist.rows(0)(0) & "')"
                            isidata2(qry,"rscrabsk")
                            tutupsdr()
                            if dtlist2.rows.count <> 0 then
                                ''==absen udah ada, update ====
                                ''==hitung jml telat,jml lebih,jam kerja ==
                                ljml  = 0
                                ljbih = 0
                                ljdul = 0
                                if dtlist2.rows(0)(2) Is dbnull.value = false  then
                                    ljml = Datediff(dateinterval.minute,dtlist2.rows(0)(2),dtlistabs.rows(i)(1))
                                end if

                                ljbih = Datediff(dateinterval.minute,dtlist2.rows(0)(5),dtlistabs.rows(i)(1))
                                if ljbih < 5 then
                                    ljbih = 0
                                end if

                                ljdul = Datediff(dateinterval.minute,dtlist2.rows(0)(5),dtlistabs.rows(i)(1))
                                if ljdul > 0 then
                                    ljdul = 0
                                else
                                    ljdul = ljdul * -1
                                end if
                                qry="UPDATE t_pegawai_hadir " & _
                                    "SET jamklr = CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "', 102) " & _
                                    ",jamlebih=" & ljbih & ",pulangdln=" & ljdul & ",jmljamkrj=" & ljml & _
                                    " WHERE (tglhdr = CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy") & "', 102)) " & _
                                    "AND (nik ='" & dtlist.rows(0)(0) & "')"
                                bukadoangsdr()
                                simpansdr(qry)
                                tutupsdr()
                            else
                                ''==absen blum ada, insert====
                                ljbih = 0
                                ljdul = 0
                                ljbih = Datediff(dateinterval.minute,cdate(ljamkrjk),dtlistabs.rows(i)(1))
                                if ljbih < 4 then
                                    ljbih = 0
                                end if

                                ljdul = Datediff(dateinterval.minute,cdate(ljamkrjk),dtlistabs.rows(i)(1))
                                if ljdul > 0 then
                                    ljdul = 0
                                else
                                    ljdul = ljdul * -1
                                end if

                                qry="INSERT INTO t_pegawai_hadir(nik,tglhdr,jamklr,kdjam,jamkrj_msk,jamkrj_plg,jamlebih,pulangdln,jmljamkrj) " & _
                                    "VALUES('" & dtlist.rows(0)(0) & "'," & _
                                    "CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy") & "',102)," & _
                                    "CONVERT(DATETIME,'" & format(dtlistabs.rows(i)(1),"MM/dd/yyyy HH:mm:ss") & "',102)," & _
                                    "'" & dtlist.rows(0)(2) & "'," & _
                                    "CONVERT(DATETIME,'" & format(ljamkrjm) & "',102)," & _
                                    "CONVERT(DATETIME,'" & format(ljamkrjk) & "',102)" & _
                                    "," & ljbih & "," & ljdul & ",0)"
                                bukadoangsdr()
                                simpansdr(qry)
                                tutupsdr()
                            end if
                            dtlistsdr2.clear
                    end select
                else
                    'response.write(dtlistabs.rows(i)(0) & "- ga ada nik<br>")
                end if
                dtlistsdr.clear
            next i
        end if
        dtlistabs.clear

        ''==== hitung rekap absen =====
        qry="Select userinfo.badgenumber from checkinout,userinfo where checkinout.userid=userinfo.userid " & _
            " AND year(checkinout.checktime)=" & lthn & " and month(checkinout.checktime)=" & lbln & _
            " Group by userinfo.badgenumber " & _
            " Order by userinfo.badgenumber "
        isidataabs(qry,"rsbdgnum")
        tutupabs()
        for i = 0 to dtlistabs.rows.count - 1
            qry="SELECT t_pegawai.nik, t_pegawai.kdstatus, t_status.kdjam, t_mstjamkerja.jammsk, t_mstjamkerja.jamklr " & _
                "FROM t_pegawai INNER JOIN t_status ON t_pegawai.kdstatus = t_status.kdstatus INNER JOIN " & _
                "t_mstjamkerja ON t_status.kdjam = t_mstjamkerja.kdjam " & _
                "WHERE (t_pegawai.pinabsen ='" & dtlistabs.rows(i)(0) & "')"
            isidatasdr(qry,"rsniknm")
            tutupsdr()
            if dtlistsdr.rows.count <> 0 then
                if dtlistsdr.rows.count <> 1 then
                    dtlistsdr.clear
                    qry="SELECT t_pegawai.nik, t_pegawai.kdstatus, t_status.kdjam, t_mstjamkerja.jammsk, t_mstjamkerja.jamklr " & _
                        "FROM t_pegawai INNER JOIN t_status ON t_pegawai.kdstatus = t_status.kdstatus INNER JOIN " & _
                        "t_mstjamkerja ON t_status.kdjam = t_mstjamkerja.kdjam " & _
                        "WHERE (t_pegawai.pinabsen ='" & dtlistabs.rows(i)(0) & "') AND (substring(t_pegawai.kdstatus,1,2)='S2')"
                    isidatasdr(qry,"rsnikknm2")
                    tutupsdr()
                end if
                qry="SELECT nik,jmljam FROM t_hakis WHERE (nik ='" & dtlistsdr.rows(0)(0) & "')"
                isidatasdr2(qry,"rsnikhakis")
                tutupsdr()
                if dtlistsdr2.rows.count <> 0 then
                    lhakis = dtlistsdr2.rows(0)(1)
                else
                    lhakis = 0
                end if
                dtlistsdr2.clear
                presensi(dtlistsdr.rows(0)(0), lthn, lbln) ',lhakis)
            End if
            dtlistsdr.clear
        next i
        dtlistabs.clear
        ''==== end hitung =============
        exit sub
psn :
        Response.Write("<script>alert('Koneksi ke mesin absen gagal')</sc" & "ript>")
    end sub

    function konversijam(ltgl as string,ljam as string) as string
        dim lhasil,lbru as string

        if val(left(trim(ljam),2)) < 12 then
            lhasil = ltgl & " " & ljam & ":00 AM"
        else
            if val(left(trim(ljam),2)) = 12 then
                lhasil = ltgl & " " & ljam & ":00 PM"
            else
                lbru = left(trim(ljam),2) - 12
                if len(lbru) = 1 then
                    lbru = "0" & lbru
                end if
                lbru = lbru & ":" & right(trim(ljam),2) & ":00 PM"
                lhasil = ltgl & " " & lbru
            end if
        end if
        return lhasil
    end function

    sub isiharilibur(lthn as integer,lbln as integer)
        dim hari,tgl,bln,thn,ket as string

        for j = 1 to 31
            if isdate(lbln & "/" & j & "/" & lthn) = false  then
                exit for
            end if

            qry="SELECT tgl,ketlbr,kettrans FROM t_hrilibur " & _
                "WHERE (tgl =CONVERT(DATETIME,'" & lbln & "/" & j & "/" & lthn & "',102))"
            isidatasdr4(qry,"rshrilbrcxcx")
            tutupsdr()
            if dtlistsdr4.rows.count = 0 then
                hari = format(cdate(lbln & "/" & j & "/" & lthn),"ddd")
                if hari ="Sat" or hari ="Sun" then
                    qry="INSERT INTO t_hrilibur(tgl,ketlbr,kettrans) " & _
                        "VALUES(CONVERT(DATETIME,'" & format(cdate(lbln & "/" & j & "/" & lthn),"MM/dd/yyyy") & "',102),'-','Tidak')"
                    bukadoangsdr
                    simpansdr(qry)
                    tutupsdr()
                end if
            end if
            dtlistsdr4.clear
        next j
    end sub

    sub laprekap(lnik as string,lthn as integer,lnama as string)
        dim lbln as string
        dim ltlt,lplg,lbih,jhdr,jtlt,jawl,jlbh as integer

        response.write("<table style='font-size:11px' width='100%' cellpadding='2px' cellspacing='1px' border='0px' bordercolor='#000000'>")
        response.write("<tr bgcolor='#D9DF99'>")
        response.write("<td align='center' rowspan='2' valign='middle'>" & "<b>NO</b>" & "</td>")
        response.write("<td align='center' rowspan='2' valign='middle'>" & "<b>NAMA</b>" & "</td>")
        response.write("<td align='center' rowspan='2' valign='middle'>" & "<b>BULAN</b>" & "</td>")
        response.write("<td align='center' valign='top' colspan='5'>" & "<b>KEHADIRAN</b>" & "</td>")
        response.write("<td align='center' valign='top' colspan='2'>" & "<b>KETIDAKHADIRAN</b>" & "</td>")
        response.write("<td align='center' valign='top' colspan='3'>" & "<b>IJIN</b>" & "</td>")
        response.write("<td align='center' valign='top' colspan='3'>" & "<b>JAM KERJA</b>" & "</td>")
        response.write("</tr>")

        response.write("<tr bgcolor='#D9DF99'>")
        response.write("<td align='center' valign='top'>" & "<b>HADIR</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>DTA</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>PTA</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>TELAT</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>PLA</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>ALPA</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>CUTI</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>TOTAL</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>IDT</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>IPLA</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>TELAT</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>LEBIH<br>CEPAT</b>" & "</td>")
        response.write("<td align='center' valign='top'>" & "<b>MASUK</b>" & "</td>")
        response.write("</tr>")
        for j = 1 to 12
            qry="SELECT hadir,dta,pta,terlambat,pla,alpa,cuti,idt,ipla,tot_telat,tot_pla,tot_jmkerja " & _
                "FROM t_presensi " & _
                "WHERE (nip ='" & lnik & "') AND (tahun =" & lthn & ") AND (bulan =" & j & ")"
            isidatasdr6(qry,"rspeghdrvv")
            tutupsdr()
            lbln = crbulan(j)
            response.write("<tr bgcolor='#CCCCCC'>")
            if j = 1 then
                response.write("<td align='right' valign='top'>" & i+1 & "</td>")
                response.write("<td align='left' valign='top'>" & lnama & "<br>(" & lnik  & ")</td>")
            else
                response.write("<td align='right' valign='top'>&nbsp;</td>")
                response.write("<td align='left' valign='top'>&nbsp;</td>")
            end if
            if dtlistsdr6.rows.count <> 0 then
                response.write("<td align='left' valign='top'>" & lbln  & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>" & dtlistsdr6.rows(0)(0) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>" & dtlistsdr6.rows(0)(1) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>" & dtlistsdr6.rows(0)(2) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>" & dtlistsdr6.rows(0)(3) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>" & dtlistsdr6.rows(0)(4) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9966FF'>" & dtlistsdr6.rows(0)(5) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9966FF'>" & dtlistsdr6.rows(0)(6) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>" & dtlistsdr6.rows(0)(7) + dtlistsdr6.rows(0)(8) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>" & dtlistsdr6.rows(0)(7) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>" & dtlistsdr6.rows(0)(8) & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>")
                konverjam(dtlistsdr6.rows(0)(9))
                response.write("</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>")
                konverjam(dtlistsdr6.rows(0)(10))
                response.write("</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>")
                konverjam(dtlistsdr6.rows(0)(11))
                response.write("</td>")
            else
                response.write("<td align='left' valign='top'>" & lbln  & "</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#9999FF'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#9966FF'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#9966FF'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>0</td>")
                response.write("<td align='right' valign='top' bgcolor='#FF99CC'>0</td>")
            end if
            response.write("</tr>")
            dtlistsdr6.clear
        next j
        response.write("</table>")
    end sub

    function crbulan (j as integer) as string
        dim ket as string

        select case j
            case 1
                ket = " Januari "
            case 2
                ket = " Februari "
            case 3
                ket = " Maret "
            case 4
                ket = " April "
            case 5
                ket = " Mei "
            case 6
                ket = " Juni "
            case 7
                ket = " Juli "
            case 8
                ket = " Agustus "
            case 9
                ket = " September "
            case 10
                ket = " Oktober "
            case 11
                ket = " November "
            case 12
                ket = " Desember "
        end select
        return ket
    end function

    sub konverjam(lmnt as long)
        dim ljm,lm as double
        select case lmnt
            case >= 60
                ljm =  Math.floor(lmnt/60) 'Math.ceiling,math.floor,math.round
                lm = lmnt mod 60
                response.write(ljm & " jam,<br> " & lm & " mnt" )
            case < 60
                if lmnt > 0 then
                    response.write(lmnt & " mnt" )
                else
                    response.write("0")
                end if
        end select
    end sub

    sub ambiljdl(lnama as string)
        dim spath = lnama
        dim strarry as array = spath.split("/")
        dim le as integer = strarry.length
        dim sret = strarry(le-1)
        dim ket as string

        qry="SELECT modulid,owner,nama_file,deskripsi FROM t_spgmod " & _
          "WHERE (nama_file ='" & sret & "')"
        isidatasdr5(qry,"rsambilrec")
        tutupsdr()

        ket=""
        if  dtlistsdr5.rows.count <> 0 then
            ket = rekjdl(dtlistsdr5.rows(0)(1),dtlistsdr5.rows(0)(3))
        end if
        dtlistsdr5.clear
        response.write(ucase(ket))
    end sub

    function rekjdl(lid as integer,lnama as string) as string
        dim lket as string

        qry="SELECT modulid,owner,nama_file,deskripsi FROM t_spgmod " & _
            "WHERE (modulid ='" & lid & "')"
        isidatasdr6(qry,"rsambilrecdt6")
        tutupsdr()
        if dtlistsdr6.rows.count <> 0 then
            if dtlistsdr6.rows(0)(1) <> 0 then
                lket = rekjdl2(dtlistsdr6.rows(0)(1),lnama,dtlistsdr6.rows(0)(3))
                dtlistsdr6.clear
                return lket
            else
                lket = dtlistsdr6.rows(0)(3)
                dtlistsdr6.clear
                return lket & " > " & lnama
            end if
        end if
    end function

    function rekjdl2(lid as integer,lnama as string, lnama2 as string) as string
        dim lket as string

        qry="SELECT modulid,owner,nama_file,deskripsi FROM t_spgmod " & _
            "WHERE (modulid ='" & lid & "')"
        isidatasdr3(qry,"rsambilrecdt3")
        tutupsdr()
        if dtlistsdr3.rows.count <> 0 then
            if dtlistsdr3.rows(0)(1) <> 0 then
                dtlistsdr3.clear
                return lket
            else
                lket = dtlistsdr3.rows(0)(3)
                dtlistsdr3.clear
                return lket & " > " & lnama2 & " > " & lnama
            end if
        end if
    end function

    function f_oprunit(ldiv as string,lid as string) as string
        dim lopr as string

        qry="SELECT kd_unitkerja FROM t_oprunitkerja " & _
            "WHERE(nik ='" & lid & "') AND (kd_divisi ='" & ldiv & "') ORDER BY kd_unitkerja"
        isidatasdr5(qry,"rscekopr")
        tutupsdr()
        if dtlistsdr5.rows.count = 0 then
            lopr = " kdunitkerja='ZZZZ'"
        else
            lopr = ""
        end if
        for i = 0 to dtlistsdr5.rows.count - 1
            if i = dtlistsdr5.rows.count - 1 then
                lopr = lopr & " kdunitkerja='" & dtlistsdr5.rows(i)(0) & "' "
            else
                lopr = lopr & " kdunitkerja='" & dtlistsdr5.rows(i)(0) & "' OR "
            end if
        next i
        dtlistsdr5.clear

        return lopr
    end function

    function f_sisacuti_old(fnik as string,fth as string) as integer
        dim sisa1,sisa2,fsisa as integer
        dim ctjanmar,ctapdes as integer

        qry ="SELECT nik,thlalu,thini FROM t_pegawai_sisacuti " & _
             "WHERE (nik ='" & fnik & "')"
        isidatasdr3(qry, "rssisactfg")
        tutupsdr()

        fsisa = 0
        If dtlistsdr3.Rows.Count <> 0 Then
            jmlrecsdr = 0
            qry = "SELECT COUNT(*) AS jml " & _
                  "FROM t_pegawai_tdkhadir " & _
                  "WHERE (YEAR(tglth) = " & fth & ") " & _
                  "AND (MONTH(tglth)>=1 AND MONTH(tglth)<=3) " & _
                  "AND (sts_acc ='ACC') " & _
                  "AND (kdth ='CT') " & _
                  "AND (nik ='" & fnik & "')"
            bukajmlsdr(qry)
            tutupsdr()
            ctjanmar = jmlrecsdr
            sisa1 = dtlistsdr3.Rows(0)(1) - jmlrecsdr
            if sisa1 > 0 and month(now()) > 3 then
                sisa1 = 0
            end if
            jmlrecsdr = 0
            qry = "SELECT COUNT(*) AS jml " & _
                  "FROM t_pegawai_tdkhadir " & _
                  "WHERE (YEAR(tglth) = " & fth & ") " & _
                  "AND (MONTH(tglth)>=4 AND MONTH(tglth)<=12) " & _
                  "AND (sts_acc ='ACC') " & _
                  "AND (kdth ='CT') " & _
                  "AND (nik ='" & fnik & "')"
            bukajmlsdr(qry)
            tutupsdr()
            ctapdes = jmlrecsdr
            sisa2 = dtlistsdr3.Rows(0)(2) - jmlrecsdr
            fsisa = sisa1 + sisa2
        End If
        dtlistsdr3.Clear()
        return fsisa
    end function

    function f_sisacuti(fnik as string,fth as string) as integer
        dim sisa1,sisa2,fsisa,fjdispen as integer
        dim ctjanmar,ctapdes,thsek,thlalu as integer

        qry ="SELECT nik,thlalu,thini FROM t_pegawai_sisacuti " & _
             "WHERE (nik ='" & fnik & "')"
        isidatasdr3(qry, "rssisactfg")
        tutupsdr()

        If dtlistsdr3.Rows.Count = 0 Then
            qry="INSERT INTO t_pegawai_sisacuti(nik,thlalu,thini) " & _
                "VALUES('" & fnik & "',0,12)"
            bukadoangsdr()
            simpansdr(qry)
            tutupsdr()
            thlalu = 0
            thsek = 12
        else
            thlalu = dtlistsdr3.Rows(0)(1)
            thsek = dtlistsdr3.Rows(0)(2)
        end if
        dtlistsdr3.Clear()

        fsisa = 0
        jmlrecsdr = 0

        qry ="SELECT COUNT(*) AS jml FROM t_pegawai_dispencuti " & _
             "WHERE (YEAR(tglth) = " & fth & ")  " & _
             "AND (MONTH(tglth) <= 12 AND MONTH(tglth) >= 4) " & _
             "AND (nik ='" & fnik & "')"
        bukajmlsdr(qry)
        tutupsdr()
        fjdispen = jmlrecsdr

        qry = "SELECT COUNT(*) AS jml " & _
              "FROM t_pegawai_tdkhadir " & _
              "WHERE (YEAR(tglth) = " & fth & ") " & _
              "AND (MONTH(tglth)>=1 AND MONTH(tglth)<=3) " & _
              "AND (sts_acc ='ACC') " & _
              "AND (kdth ='CT') " & _
              "AND (nik ='" & fnik & "')"
        bukajmlsdr(qry)
        tutupsdr()
        ctjanmar = jmlrecsdr + fjdispen
        sisa1 = thlalu - (jmlrecsdr)
        if sisa1 > 0 and month(now()) > 3 then
            sisa1 = 0
        end if
        jmlrecsdr = 0
        qry = "SELECT COUNT(*) AS jml " & _
              "FROM t_pegawai_tdkhadir " & _
              "WHERE (YEAR(tglth) = " & fth & ") " & _
              "AND (MONTH(tglth)>=4 AND MONTH(tglth)<=12) " & _
              "AND (sts_acc ='ACC') " & _
              "AND (kdth ='CT') " & _
              "AND (nik ='" & fnik & "')"
        bukajmlsdr(qry)
        tutupsdr()

        ctapdes = jmlrecsdr - fjdispen
        sisa2 = thsek - (jmlrecsdr-fjdispen)
        fsisa = sisa1 + sisa2

        return fsisa
    end function


    sub inputlogcuti(aksi as string,opr as string)
        qry="INSERT INTO tlog_cuti(aksi,usropr,tgl) " & _
            "VALUES('" & aksi & "','" & opr & "',{fn NOW()})"
        bukadoangsdr()
        simpansdr(qry)
        tutupsdr()
    end sub

    sub inputlogidtipla(aksi as string,opr as string)
        qry="INSERT INTO tlog_idtipla(aksi,usropr,tgl) " & _
            "VALUES('" & aksi & "','" & opr & "',{fn NOW()})"
        bukadoangsdr()
        simpansdr(qry)
        tutupsdr()
    end sub



</script>

<script type="text/javascript">

  function psn()  
   {
      return confirm("Anda Yakin ?");
   }


function js_clock(){
	
	var clock_time = new Date();
	var clock_hours = clock_time.getHours();
	var clock_minutes = clock_time.getMinutes();
	var clock_seconds = clock_time.getSeconds();
	var clock_suffix = "";
	

	if (clock_hours < 10){
clock_hours = "0" + clock_hours;
	}

	if (clock_minutes < 10){
clock_minutes = "0" + clock_minutes;
	}

	if (clock_seconds < 10){
clock_seconds = "0" + clock_seconds;
	}

	var clock_div = document.getElementById('js_clock');
	clock_div.innerHTML = clock_hours + ":" + clock_minutes + ":" + clock_seconds + " " + clock_suffix;
	setTimeout("js_clock()", 1000);
}

js_clock();
</script>