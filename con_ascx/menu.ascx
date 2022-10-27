<script runat="server">
    sub navbar()
	end sub

	sub menu()
	    response.write("<ul class='nav navbar-nav'>")
		response.write("<li class='dropdown'>")
		response.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Master<i class='caret'></i></a>")
		response.write("<ul class='dropdown-menu' role='menu'>")
		response.write("<li class='dropdown-submenu'><a href='#'>Biodata</a>")
		response.write("<ul class='dropdown-menu'>")
		response.write("<li><a href='#'>Data Mahasiswa</a></li>")
		response.write("</ul>")
		response.write("</li>")
		response.write("<li class='dropdown-submenu'><a href='#' class='dropdown-toggle' data-toggle='dropdown'>Mata Kuliah</a>")
		response.write("<ul class='dropdown-menu' role='menu'>")
		response.write("<li><a href=''>Input Mata Kuliah</a></li>")
		response.write("<li><a href=''>Report Mata Kuliah</a></li>")
		response.write("<li><a href=''>Perbaikan Mata Kuliah</a></li>")
		response.write("</ul>")
		response.write("</li>")
		response.write("<li><a href='#'>Mahasiswa Pendengar</a>")
		response.write("</li>")
		response.write("</ul>")
		response.write("</li>")
		response.write("<li >")
		response.write("<a href='#'>Menu Kedua </a>")
		response.write("</li>")
	    response.write("</ul>")
	end sub

</script>


<nav class="navbar navbar-static-top">
  <div class="container">
    <% navbar() %>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
         <% menu() %>
    </div>
    <!-- /.navbar-collapse -->
    <!-- Navbar Right Menu -->
    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <!-- User Account Menu -->
        <li class="dropdown user user-menu">
          <!-- Menu Toggle Button -->
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <!-- The user image in the navbar-->
            <img src="../images/icon-user.png" class="user-image" alt="User Image">
            <!-- hidden-xs hides the username on small devices so only the image appears. -->
            <span class="hidden-xs"><% response.write(session("namappn")) %> </span>
          </a>
          <ul class="dropdown-menu">
            <!-- The user image in the menu -->
            <li class="user-header">
              <img src="../images/icon-user.png" class="img-circle" alt="User Image">

              <p>
                <% response.write(session("namappn")) %>
                <small><% response.write(session("idppn")) %></small>
              </p>
            </li>
            <!-- Menu Body -->
            <li class="user-body">
              <div class="row">
                <div class="col-xs-12 text-center">
                  <a href="#"><i class="fa fa-key"></i> Ubah Password</a>
                </div>
                
              </div>
              <!-- /.row -->
            </li>
            <!-- Menu Footer-->
            <li class="user-footer">
              <div class="pull-left">
                <a href="#" class="btn btn-default btn-flat">Biodata</a>
              </div>
              <div class="pull-right">
                <a href="../logout.aspx" class="btn btn-default btn-flat">Log out</a>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /.navbar-custom-menu -->
  </div>
  <!-- /.container-fluid -->
</nav>
