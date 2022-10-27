<!-- #INCLUDE file ="../../con_ascx/conlintar2022.ascx" -->
<!-- #INCLUDE file ="../../con_ascx/conkerjasama.ascx" -->

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.Oledb" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    Sub page_load(o As Object, e As EventArgs)
        cekauthlintar()
        If Not Page.IsPostBack Then
            pnlLs.Visible = True
            pnlTambah.Visible = False
            nilai_awal()
        End If
    End Sub

    Sub nilai_awal()
        qry = "SELECT id_tingkat, ket_tingkat FROM tmstr_tingkatan ORDER BY id_tingkat ASC"
        isidatakr(qry, "rscektingkat")
        tutupkr()
        dgtingkatan.datasource = dtlistkr
        dgtingkatan.databind()
        dgtingkatan.visible = True
        dtlistkr.Clear() 
    End Sub

    Sub btnTambah_Click(sender As Object, e As EventArgs)
        '------------ MELAKUKAN PENAMBAHAN DATA ------------
        pnlLs.Visible = False
        pnlTambah.Visible = True
        txtketTingkatan.Text = ""
        btnTambahSimpan.Text = "Simpan"
    End Sub

    Sub btnTambahSimpan_Click(sender As Object, e As EventArgs)
        If Trim(txtketTingkatan.Text) = "" Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Bentuk Tingkatan tidak boleh kosong..!');", True)
            Exit Sub
        End If

        qry = "SELECT ket_tingkat FROM tmstr_tingkatan " &
              "WHERE ket_tingkat = '" & txtketTingkatan.Text & "' "
        isidatakr(qry, "rsisitingkat")
        tutupkr()
        If dtlistkr.Rows.Count <> 0 Then
            dtlistkr.Clear()
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Bentuk Tingkatan sudah ada..!');", True)
            Exit Sub
        End If

        Select Case btnTambahSimpan.Text
            Case "Simpan"
                qry = "INSERT INTO tmstr_tingkatan(ket_tingkat) " &
                      "VALUES('" & Replace(txtketTingkatan.Text, "'", "''") & "')"
                bukadoangkr()
                simpankr(qry)
                tutupkr()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Data berhasil disimpan..!');", True)
            Case "Update"
                qry = "UPDATE tmstr_tingkatan SET " &
                    "ket_tingkat='" & txtketTingkatan.Text & "' " &
                    "WHERE id_tingkat='" & lblidtingkat.Text & "'"
                bukadoangkr()
                simpankr(qry)
                tutupkr()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Data berhasil diubah..!');", True)
            Case "Hapus"

        End Select
        pnlLs.Visible = True
        pnlTambah.Visible = False
        nilai_awal()

    End Sub

    Sub dgtingkatan_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles dgtingkatan.EditCommand
        pnlLs.Visible = False
        pnlTambah.Visible = True
        lblidtingkat.Text = dgtingkatan.DataKeys(e.Item.ItemIndex)
        btnTambahSimpan.Text = "Update"
        qry = "SELECT ket_tingkat FROM tmstr_tingkatan WHERE id_tingkat=" & lblidtingkat.Text
        isidatakr(qry, "rscekinfotingkatan")
        tutupkr()
        If dtlistkr.rows.count = 0 Then
            txtketTingkatan.Text = ""
            Exit Sub
        End If
        txtketTingkatan.Text = dtlistkr(0)("ket_tingkat")
        dtlistkr.Clear()
    End Sub

    Sub dgtingkatan_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles dgtingkatan.DeleteCommand
        qry = "DELETE FROM tmstr_tingkatan " &
              "WHERE id_tingkat=" & dgtingkatan.DataKeys(e.Item.ItemIndex) & " "
        bukadoangkr()
        simpankr(qry)
        tutupkr()
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Data berhasil dihapus..!');", True)
        response.redirect("mbkm_menu1.aspx")
    End Sub

    Sub btnKembali_Click(sender As Object, e As EventArgs)
        pnlLs.Visible = True
        pnlTambah.Visible = False
    End Sub
    
    
</script>


<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Merdeka Belajar Kampus Merdeka</h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.aspx">Beranda</a></li>
                        <li class="breadcrumb-item active">Master Tingkatan</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <form runat="server">
                <asp:Panel ID="pnlLs" runat="server" Width="100%">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fas fa-tag"></i>
                                        Daftar MBKM
                                    </h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <asp:Button ID="btnTambah" runat="server" Text="Tambah Data"
                                            CssClass="btn btn-danger" OnClick="btntambah_click" Style="margin-right: 5px;" />
                                        
                                    </div>

                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <asp:DataGrid ID="dgtingkatan" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyField="id_tingkat" 
                                             Font-Size="13px" alternatingitemstyle-backcolor="#eeeeee" 
                                             OnEditCommand="dgtingkatan_EditCommand" OnDeleteCommand="dgtingkatan_DeleteCommand"
                                             headerstyle-backcolor="#dc3545" HeaderStyle-HorizontalAlign="center"  HeaderStyle-ForeColor="white">
                                               <Columns>
                                                   <asp:TemplateColumn HeaderText="Kategori MBKM">
                                                       <ItemTemplate>
                                                         <asp:Label ID="lblidtingkat" runat="server" 
                                                         Text='<%# DataBinder.Eval(Container, "DataItem.id_tingkat") %>'></asp:Label>
                                                       </ItemTemplate>
                                                   </asp:TemplateColumn>
                                                   <asp:TemplateColumn HeaderText="Nama Kegiatan">
                                                       <ItemTemplate>
                                                          <asp:Label ID="txtTingkatan1" runat="server" 
                                                          Text='<%# DataBinder.Eval(Container,"DataItem.ket_tingkat") %>'>
														  </asp:Label>
                                                       </ItemTemplate>
                                                   </asp:TemplateColumn>
                                                   <asp:TemplateColumn HeaderText="Institusi">
                                                       <ItemTemplate>
                                                          <asp:Label ID="txtTingkatan2" runat="server" 
                                                          Text='<%# DataBinder.Eval(Container,"DataItem.ket_tingkat") %>'>
														  </asp:Label>
                                                       </ItemTemplate>
                                                   </asp:TemplateColumn>                                                   
                                                   <asp:ButtonColumn CommandName="Edit" HeaderText="Edit" Text="Edit" ButtonType="PushButton" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                   <asp:ButtonColumn CommandName="Delete" HeaderText="Hapus" Text="Hapus" ButtonType="PushButton" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                </Columns>
                                            </asp:DataGrid>     
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <!-- /.remark 
                                    <button type="submit" class="btn btn-info">Sign in</button>
                                    <button type="submit" class="btn btn-default float-right">Cancel</button>
                                   -->
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlTambah" runat="server" Width="100%">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fas fa-tag"></i>
                                        <asp:Label ID="lblTambahRemark" runat="server" Text="Tambah/Edit MBKM"></asp:Label>
                                    </h3>
                                </div>
                                <div class="card-body">
                                    <asp:Label ID="lblidtingkat" runat="server" Text="" Visible="True" ></asp:Label>
                                    <div class="form-group">
                                        <label for="lblketTingkatan" class="col-sm-2 col-form-label">Keterangan MBKM</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtketTingkatan" runat="server" Text=""
                                                MaxLength="120" CssClass="form-control rounded-0"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <asp:Button ID="btnTambahSimpan" runat="server" Text="Simpan"
                                        OnClick="btnTambahSimpan_Click" CssClass="btn btn-info" />
                                    <asp:Button ID="btnTambahBatal" runat="server" Text="Batal"
                                        OnClick="btnKembali_Click" CssClass="btn btn-default float-right" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </form>
        </div>
    </section>
</div>

<link href="../../admin_lte310/plugins/datepicker/datepicker_pps/jquery-ui.css" rel="stylesheet" />
<script src="../../admin_lte310 /plugins/datepicker/datepicker_pps/jquery-1.8.2.js"></script>
<script src="../../admin_lte310/plugins/datepicker/datepicker_pps/jquery-ui-1.9.0.custom.js"></script>
<script src="../../admin_lte310/plugins/datepicker/datepicker_pps/jquery.ui.datepicker-id.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		//$("#ctl00_ContentPlaceHolder1_txtTanggalDenda").datepicker({
		//	dateFormat: "dd-mm-yy",
		//	changeMonth: true,
		//	changeYear: true,
		//	//minDate: "-4M", maxDate: "+4M +1D",
		//});
		$("#ctl00_ContentPlaceHolder1_txtTanggalMulai").datepicker({
			dateFormat: "dd-mm-yy",
			changeMonth: true,
			changeYear: true,
			minDate: "-4M -4Y", maxDate: "+4M +1Y",
			onClose: function (selectedDate) {
				$("#ctl00_ContentPlaceHolder1_txtTanggalMulai").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#ctl00_ContentPlaceHolder1_txtTanggalAkhir").datepicker({
			dateFormat: "dd-mm-yy",
			changeMonth: true,
			changeYear: true,
			//numberOfMonths: 2,//
			minDate: "-4M -4Y", maxDate: "+5M +5Y",
			onClose: function (selectedDate) {
				$("#ctl00_ContentPlaceHolder1_txtTanggalAkhir").datepicker("option", "minDate", selectedDate);
			}
		});
	});

	//validasi harus angka
	var specialKeys = new Array();
	specialKeys.push(8, 9); //Backspace, tab

	//Nominal Tagihan
	function IsNumDenda(e) {
		var keyCode = e.which ? e.which : e.keyCode
		var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
		document.getElementById("errorDenda").style.display = ret ? "none" : "inline";
		return ret;
	}
</script>
