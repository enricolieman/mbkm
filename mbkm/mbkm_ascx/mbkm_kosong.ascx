
<script runat="server">
    Sub page_load(o As Object, e As EventArgs)
        'cekautUkul()
        If Not Page.IsPostBack Then
            pnlLs.Visible = True
            pnlTambah.Visible = False
        End If
    End Sub

    Sub btnTambah_Click(sender As Object, e As EventArgs)
        pnlLs.Visible = False
        pnlTambah.Visible = True
    End Sub

    Sub btnEdit_Click(sender As Object, e As EventArgs)
        pnlLs.Visible = False
        pnlTambah.Visible = True
    End Sub

    Sub btnHapus_Click(sender As Object, e As EventArgs)
        'pnlLs.Visible = False
        'pnlTambah.Visible = True
    End Sub

    Sub btnKembali_Click(sender As Object, e As EventArgs)
        pnlLs.Visible = True
        pnlTambah.Visible = False
    End Sub

    Sub btnTambahSimpan_Click(sender As Object, e As EventArgs)
        If lblTambahRemark.Text = "Tambah Data" Then
            'prosesTambah()
        Else
            'prosesUbah(lblTambahSemesterId.Text)
        End If
    End Sub

</script>


    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Master Mitra</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="index.aspx">Beranda</a></li>
                            <li class="breadcrumb-item active">Master Mitra</li>
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
                                        List Mitra
                                    </h3>
                                </div>
                                <div class="card-body">
									<div class="row">
										<asp:Button ID="btnTambah" runat="server" Text="Tambah" 
                                        CssClass="btn btn-danger" OnClick="btntambah_click" style="margin-right: 5px;"/>
										<asp:Button ID="btnEdit" runat="server" Text="Edit" 
                                        CssClass="btn btn-success" OnClick="btnedit_click" style="margin-right: 5px;"/>
										<asp:Button ID="btnHapus" runat="server" Text="Hapus" 
                                        CssClass="btn btn-primary" OnClick="btnhapus_click" />
									</div>
									<hr />
									<div class="row">
										<div class="col-sm-6">
											<div class="table-responsive">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th width="100px">No</th>
															<th width="100px">Pilih</th>
															<th>Nama Mitra</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>1</td>
															<td><input type="radio" name="pilihan" value=""/></td>
															<td>Internasional</td>
														</tr>
														<tr>
															<td>2</td>
															<td><input type="radio" name="pilihan" value=""/></td>
															<td>Nasional</td>
														</tr>
														<tr>
															<td>3</td>
															<td><input type="radio" name="pilihan" value=""/></td>
															<td>Lokal</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

									</div>
									<% 'lsData() %>
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

				<!-- UNTUK MENU TAMBAH KERJA SAMA -->
				<asp:Panel ID="pnlTambah" runat="server" Width="100%">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-default">
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-tag"></i>
										<asp:Label ID="lblTambahRemark" runat="server" Text="Tambah Kerja Sama"></asp:Label>
									</h3>
								</div>
								<div class="card-body">
									<!-- <div class="row">
										<asp:Button ID="btnKembali" runat="server" Text="Kembali" CssClass="btn btn-info" 
                                        OnClick="btnKembali_Click" />
									</div>
									<hr /> -->
									<asp:Label ID="lblTambahPesan" runat="server" Text=""></asp:Label>
									<div class="form-group">
										<label for="JenisKegiatan" class="col-sm-2 col-form-label">Jenis Kegiatan</label>
										<div class="col-sm-6">
											<asp:TextBox ID="txtJenisKegiatan" runat="server" Text="" 
                                            MaxLength="50" CssClass="form-control rounded-0"></asp:TextBox>
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
					</div>
                </asp:Panel>
				<!-- END MENU TAMBAH KERJA SAMA -->
			</form>
            </div>
        </section>
    </div>

<link href="../../admin_lte310/plugins/datepicker/datepicker_pps/jquery-ui.css" rel="stylesheet" />
<script src="../../admin_lte310/plugins/datepicker/datepicker_pps/jquery-1.8.2.js"></script>
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
