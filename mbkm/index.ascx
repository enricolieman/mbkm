<!-- #INCLUDE file ="../con_ascx/conlintar2022.ascx" -->
<!-- #INCLUDE file ="../con_ascx/conkerjasama.ascx" -->

<script runat="server">
    Sub page_load(o As Object, e As EventArgs)
        'cekautUkul()
        If Not Page.IsPostBack Then
        End If
    End Sub

</script>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                </div>

                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.aspx">Beranda</a></li>
                        <li class="breadcrumb-item active">Menu Aplikasi</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>

     <nav class="navbar navbar-expand-lg rounded" style="background-color:#dc3545;">
       <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-link text-decoration-none text-white" href="index.aspx">Mata Kuliah</a>
            <a class="nav-link text-decoration-none text-white" href="mbkm_menu1.aspx">SKPI</a>
            <a class="nav-link text-decoration-none text-white" href="mbkm_menu2.aspx">Tugas Akhir</a>
            <a class="nav-link text-decoration-none text-white" href="mbkm_menu2.aspx">Wisuda</a></a>
            <a class="nav-link text-decoration-none text-white" href="mbkm_menu2.aspx">Cetak</a>   
            <a class="nav-link text-decoration-none text-white" href="mbkm_menu2.aspx">MBKM</a>                                 
          </div>
        </div>
      </div>
    </nav>    

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
                                        <strong>Kegiatan Mahasiswa</strong>
                                    </h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">

                                        <div class="col-lg-3">
                                            <div class="card" style="border-radius:15px; height:20rem;">
                                                <div class="card-header border-0">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 class="card-title"><strong>Pengumuman MBKM</strong></h3>
                                                    </div>
                                                </div>
                                                <div class="card-body ">
                                                    <div id="" style="line-height:1.5">
                                                        <ol style="margin-top:-10px; margin-left:-20px; font-size:14px;">
                                                            <li><a class="text-decoration-none text-info" href="" >Jadwal Pembayaran Uang Kuliah Semester Genap 2021/2022</a></li>
                                                            <li><a class="text-decoration-none text-info" href="">Pengumumam Pelaksanaan Wisuda ke-78 Universitas Tarumanagara</a></li>
                                                            <li><a class="text-decoration-none text-info" href="">Jadwal Pembayaran  Uang Kuliah Semester Genap 2021/2022</a></li>
                                                            <li><a class="text-decoration-none text-info" href="">Pengumumam Pelaksanaan Wisuda ke-78 Universitas Tarumanagara</a></li>
                                                            <li><a class="text-decoration-none text-info" href="">Jadwal Pembayaran  Uang Kuliah Semester Genap 2021/2022</a></li>
                                                        </ol>                        
                                                    </div>    
                                                </div>
                                            </div>
                                        </div> 

                                        <div class="col-lg-9">
                                            <div class="card" style="border-radius:15px; height:20rem;">
                                                <div class="card-header border-0">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 class="card-title"><strong>Kategori MBKM Kemendikbudristek</strong></h3>   
                                                    </div>    
                                                </div>    
                                                <div class="card-body ">
                                                    <div>                
                                                        <div class="row justify-content-center">                                
                                                            <div class="card" style="margin: 1%; padding: 1.5rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;">
                                                                <a class="text-center" href="#" style="color:black;">Mengajar di Sekolah</a>
                                                            </div> 

                                                            <div class="card" style="margin: 1%; padding: 1.5rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;" >
                                                                <a class="text-center" href="#" style="color:black;">Pertukaran Pelajar</a>
                                                            </div>   

                                                            <div class="card" style="margin: 1%; padding: 1rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;">
                                                                <a class="text-center" href="#" style="color:black;">Magang/Praktik Industri</a>
                                                            </div>     

                                                            <div class="card" style="margin: 1%; padding: 1rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;">
                                                                <a class="text-center" href="#" style="color:black;">Studi/Proyek Independen</a>
                                                            </div>     

                                                            <div class="card" style="margin: 1%; padding: 1.5rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;">
                                                                <a class="text-center" href="#" style="color:black;">Wirausaha</a>
                                                            </div> 

                                                            <div class="card" style="margin: 1%; padding: 1.5rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;" >
                                                                <a class="text-center" href="#" style="color:black;">Proyek Kemanusiaan</a>
                                                            </div>    

                                                            <div class="card" style="margin: 1%; padding: 1.5rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;">
                                                                <a class="text-center" href="#" style="color:black;">Penelitian/Riset</a>
                                                            </div>     

                                                            <div class="card" style="margin: 1%; padding: 1.5rem; border-radius:5%; height:4rem; width:12rem; background-color: #ededed;">
                                                                <a class="text-center" href="#" style="color:black;">Proyek di Desa</a>
                                                            </div>                                                             
                                                            
                                                                                               
                                                        </div>
                                                                                                                  
                                                    </div>                                                  
                                                </div>                                           
                                                
                                                
                                            </div>
                                        </div>                 

                                        <div class="col-lg-3">
                                            <div class="card" style="border-radius:15px; height:20rem;">
                                                <div class="card-header border-0">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 class="card-title"><strong>Informasi</strong></h3>
                                                    </div>
                                                </div>
                                                <div class="card-body ">
                                                    <div style="line-height:1.7">
                                                        <ol style="margin-top:-15px; margin-left:-20px; font-size:14px;">
                                                            <li><a class="text-decoration-none text-info" href="">Template Branding Untar (Logo, Power Point)</a></li>
                                                            <li><a class="text-decoration-none text-info" href="">PANDUAN KRRS ONLINE S1 KEDOKTERAN</a></li>
                                                            <li><a class="text-decoration-none text-info" href="">PANDUAN KRRS ONLINE PROGRAM S1</a></li>
                                                        </ol>                        
                                                    </div>    
                                                </div>
                                            </div>
                                        </div> 

                                        <div class="col-lg-9">
                                            <div class="card" style="border-radius:15px; height:20rem;">
                                                <div class="card-header border-0">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 class="card-title mb-5"><strong>Timeline MBKM</strong></h3>
                                                    </div>        
                                                    <div>
                                                        <div style="display:inline-block; ">
                                                        <span class="material-symbols-outlined text-success ">check_circle</span>
                                                        <span class="text-success" style="position:relative; bottom:8px; text-align:center; ">Mengajar di<p> Sekolah</p>
                                                        </span>
                                                        </div>

                                                        <div style="display:inline-block;">                                                        
                                                        <span class="material-symbols-outlined text-success ">check_circle</span>
                                                        <span class="text-success" style="position:relative; bottom:8px; text-align:center;" >Pertukaran<p>Pelajar</p>  
                                                        </div>                                                        

                                                        <div style="display:inline-block;">
                                                        <span class="material-symbols-outlined text-success ">check_circle</span>
                                                        <span class="text-success" style="position:relative; bottom:8px; text-align:center;">Magang/Praktik<p>Industri</p></span>       
                                                        </div>   

                                                        <div style="display:inline-block;">
                                                        <span class="material-symbols-outlined text-success ">check_circle</span>
                                                        <span class="text-success" style="position:relative; bottom:8px; text-align:center;">Studi/Proyek<p>Independen</p></span>       
                                                        </div>      
                                                        
                                                        <div style="display:inline-block;">
                                                        <span class="material-symbols-outlined text-warning">error</span>
                                                        <span class="text-warning" style="position:relative; bottom:8px; text-align:center;">Wirausaha<p>Sedang berjalan</p></span>       
                                                        </div>            

                                                        <div style="display:inline-block;">
                                                        <span class="material-symbols-outlined text-secondary ">lock</span>
                                                        <span class="text-secondary " style="position:relative; bottom:8px; text-align:center;">Proyek<p>Kemanusiaan</p></span>       
                                                        </div>   

                                                        <div style="display:inline-block;">
                                                        <span class="material-symbols-outlined text-secondary ">lock</span>
                                                        <span class="text-secondary" style="position:relative; bottom:8px; text-align:center;">Penelitian<p>/Riset</p></span>       
                                                        </div>      
                                                        
                                                        <div style="display:inline-block;">
                                                        <span class="material-symbols-outlined text-secondary ">lock</span>
                                                        <span class="text-secondary" style="position:relative; bottom:8px; text-align:center;">Proyek<p>di Desa</p></span>       
                                                        </div>                                                          

                                                                                                                                                         
                                                    </div>

                                                    
                                                    <div class="progress" style="height: 30px">
                                                    <div class="progress-bar" role="progressbar" style="width: 12.5%; background-color:#8dd7ee" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                                                    <div class="progress-bar" role="progressbar" style="width: 12.5%; background-color:#5fc8db" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                    <div class="progress-bar" role="progressbar" style="width: 14%; background-color:#45c0cf" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>                                                     
                                                    <div class="progress-bar" role="progressbar" style="width: 14%; background-color:#24b5c3" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>                                                       
                                                    
                                                </div>
                                            </div>
                                        </div>                                              

                                        <!--            
                                        <div class="d-flex col-lg-6">
                                            <div class="card" style="border-radius:15px">
                                                <div class="card-header border-0">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 class="card-title"><strong>Grafik MBKM</strong></h3>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <div class="position-relative mb-4">
                                                        <canvas id="visitors-chart" height="252"></canvas>
                                                    </div>

                                                    <div class="d-flex flex-row justify-content-end">
                                                        <span class="mr-2">
                                                            <i class="fas fa-square text-success"></i> MoU
                                                        </span>

                                                        <span class="mr-2">
                                                            <i class="fas fa-square text-warning"></i> MoA
                                                        </span>
                                                        <span>
                                                            <i class="fas fa-square text-danger"></i> IA
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="card" style="border-radius:5%">
                                                <div class="card-header border-0">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 class="card-title"><strong>Status MBKM</strong></h3>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <div id="donut-chart" style="height: 300px;"></div>
                                                </div>
                                            </div>
                                        </div>
                                        -->

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
            </form>
        </div>
    </section>
</div>

<!-- OPTIONAL SCRIPTS -->
<script src="../../admin_lte310/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../admin_lte310/dist/js/demo.js"></script>
<!-- FLOT CHARTS -->
<script src="../../admin_lte310/plugins/flot/jquery.flot.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="../../admin_lte310/plugins/flot/plugins/jquery.flot.pie.js"></script>
<!-- GOOGlE FONTS AND ICONS MATERIALS-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<script>
$(function(){
  $('#jtimeline-demo').jTimeline();
});
</script>

<script>
$('#jtimeline-demo').jTimeline({

  // pixels per second
  resolution: 50000, 

  // minimum spacing between events
  minimumSpacing: 200, 

  // scrolling (translateX) step size
  step: 200, 

  // character for left arrow
  leftArrow: "&larr;", 

  // character for right arrow
  rightArrow: "&rarr;", 
  
});
</script>


<script>
    /* global Chart:false */

    $(function () {
        'use strict'

        var ticksStyle = {
            fontColor: '#495057',
            fontStyle: 'bold'
        }

        var mode = 'index'
        var intersect = true

        var $visitorsChart = $('#visitors-chart')
        // eslint-disable-next-line no-unused-vars
        var visitorsChart = new Chart($visitorsChart, {
            data: {
                labels: ['2019', '2020', '2021', '2022'],
                datasets: [{
                    type: 'line',
                    data: [6, 1, 5, 7, 10],
                    backgroundColor: 'transparent',
                    borderColor: '#ffc107',
                    pointBorderColor: '#ffc107',
                    pointBackgroundColor: '#ffc107',
                    fill: false
                    // pointHoverBackgroundColor: '#007bff',
                    // pointHoverBorderColor    : '#007bff'
                },
                {
                    type: 'line',
                    data: [1, 0, 3, 2, 5],
                    backgroundColor: 'tansparent',
                    borderColor: '#28a745',
                    pointBorderColor: '#28a745',
                    pointBackgroundColor: '#28a745',
                    fill: false
                    // pointHoverBackgroundColor: '#ced4da',
                    // pointHoverBorderColor    : '#ced4da'
                },
                {
                    type: 'line',
                    data: [2, 3, 5, 6, 7],
                    backgroundColor: 'tansparent',
                    borderColor: '#f44336',
                    pointBorderColor: '#f44336',
                    pointBackgroundColor: '#f44336',
                    fill: false
                    // pointHoverBackgroundColor: '#f44336',
                    // pointHoverBorderColor    : '#f44336'
                }]
            },
            options: {
                maintainAspectRatio: false,
                tooltips: {
                    mode: mode,
                    intersect: intersect
                },
                hover: {
                    mode: mode,
                    intersect: intersect
                },
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        // display: false,
                        gridLines: {
                            display: true,
                            lineWidth: '4px',
                            color: 'rgba(0, 0, 0, .2)',
                            zeroLineColor: 'transparent'
                        },
                        ticks: $.extend({
                            beginAtZero: true,
                            suggestedMax: 10
                        }, ticksStyle)
                    }],
                    xAxes: [{
                        display: true,
                        gridLines: {
                            display: false
                        },
                        ticks: ticksStyle
                    }]
                }
            }
        })
    })

// lgtm [js/unused-local-variable]

</script>

<script>
    $(function () {

        var donutData = [
            {
                label: 'Aktif',
                data: 35,
                color: '#00a65a'
            },
            {
                label: 'Tidak Aktif',
                data: 45,
                color: '#f44336'
            },
            {
                label: 'Unknown',
                data: 20,
                color: '#fff703'

            }
        ]
        $.plot('#donut-chart', donutData, {
            series: {
                pie: {
                    show: true,
                    radius: 1,
                    innerRadius: 0.5,
                    label: {
                        show: true,
                        radius: 2 / 3,
                        formatter: labelFormatter,
                        threshold: 0.1
                    }
                }
            },
            legend: {
                show: false
            }
        })
    })

    function labelFormatter(label, series) {
        return '<div style="font-size:12px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
            + label
            + '<br>'
            + Math.round(series.percent) + '%</div>'
    }
</script>


    



