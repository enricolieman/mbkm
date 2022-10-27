<aside class="main-sidebar sidebar-light-red elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <%--<img src="../admin_lte310/img/logo_utr.png" alt="AdminLTE Logo" class="brand-image">--%>
        <img src="../admin_lte310/img/logo_utr.png" alt="AdminLTE Logo" class="brand-image" />
        <%--<span class="brand-text font-weight-light">Sistem Uang Kuliah</span>--%>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="../admin_lte310/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">SIM MBKM</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <%--<div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>--%>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                <% setMenu() %>
                <% 
				   'response.write(lpath(1))
				   Select Case lpath(1) 
				   
				%>
		        <% Case "kerjasama" %> 
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            Menu Master 
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="kr_mstrkrjsama.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Master Kerjasama</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_mstrtingkatan.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Master Tingkatan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_mstrbentukkegiatan.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Master Bentuk Kegiatan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_mstrjnsmitra.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Master Jenis Mitra</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_mstrnegaramitra.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Negara Mitra</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Menu Kerjasama
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="kr_daftarmitra.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Daftar Mitra</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_mou.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>MoU</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_moa.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>MoA</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_ia.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>IA</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_kegiatan.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Kegiatan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_evaluasi.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Evaluasi</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="kr_laporan.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Laporan</p>
                            </a>
                        </li>
                    </ul>
                </li>
		        <% Case "monitorruangkuliah" %> 
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-paperclip"></i>
                        <p>
                            Kelola Alat Kuliah
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkalat_klasifikasialat.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Klasifikasi Alat</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkalat_inputdata.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Input Data</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkalat_editstatus.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Edit Status</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            Kelola Ruang Kelas
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkruang_gedunglantai.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Gedung & Lantai</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkruang_penamaanruang.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Penamaan Ruang</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkruang_penambahanalat.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Penambahan Alat</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-spinner"></i>
                        <p>
                            Sinkron Jadwal Kuliah
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrsjadwal_pemilihanjadwal.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Pemilihan Jadwal Kuliah</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrsjadwal_settinglibur.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Setting Tanggal Libur</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrsjadwal_pemakaianruang.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Pemakaian Ruang</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-desktop"></i>
                        <p>
                            Monitoring
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkmon_kuliah_ganti.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Kuliah Pengganti</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrkmon_kuliah_harian.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Monitoring Harian</p>
                            </a>
                    </ul>
                </li>

                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>
                            Laporan
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrlap_status_alat.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Status Alat</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrlap_data_jadwal.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Data Jadwal</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrlap_data_ruangan.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Data Ruangan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrlap_monitor_kuliah.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Monitoring Perkuliahan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/monitorruangkuliah/mrlap_data_libur.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Data Tanggal Libur</p>
                            </a>
                        </li>
                    </ul>
                </li>
		        <% Case "mbkm" %> 
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            Menu MBKM
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="mbkm_menu1.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 1</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 2</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 3</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 4</p>
                            </a>
                        </li>
                    </ul>
                </li>

		        <% Case "yudisium" %> 
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            Menu Yudisium
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 1</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 2</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 3</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 4</p>
                            </a>
                        </li>
                    </ul>
                </li>
		        <% Case "skpi" %> 
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            Menu SKPI
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="skpi_menu1.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 1</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 2</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 3</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Menu 4</p>
                            </a>
                        </li>
                    </ul>
                </li>
		        <% Case "ews_akreditasi" %> 
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            Menu EWS Akreditasi
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="ewsprodi_monitoring.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Monitoring Prodi</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="ewsprodi_laporan.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Laporan</p>
                            </a>
                        </li>
                    </ul>
                </li>
		        <% Case "exchangeprogram" %> 

		        <% Case "monitoring_tunggakan" %> 
                <li class="nav-item menu">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            Monitor Tunggakan
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="ewsprodi_monitoring.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Monitoring Prodi</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="ewsprodi_laporan.aspx" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Laporan</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <% Case Else %>
                    <% response.write(lpath(1) & dirPath) %>
		        <% End Select %>



            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>