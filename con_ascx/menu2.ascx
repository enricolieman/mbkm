<script runat="server">
    sub navbar()
        response.write("<div class='navbar-header'>")
        response.write("<a href='/../../utama.aspx' class='navbar-brand'><b>Lintar</b></a>")
        response.write("<a href='' class='navbar-brand'> | </b></a>")
        response.write("<a href='/monitorruangkuliah/index.aspx' class='navbar-brand'><b>Ruang Monitoring Perkuliahan</b></a>")
        response.write("<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#navbar-collapse'>")
        response.write("<i class='fa fa-bars'></i>")
        response.write("</button>")
        response.write("</div>")
	end sub

</script>


<nav class="navbar navbar-static-top">
  <div class="container">
    <% navbar() %>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
      <ul class="nav navbar-nav">
		<li class='dropdown'>
			<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Menu 1<i class='caret'></i></a>
			<ul class='dropdown-menu' role='menu'>
				<li class="dropdown-submenu"><a href="#">Sub Menu 1</a>
					<ul class='dropdown-menu'  >
						<li><a href="#">Item 1</a></li>
						<li><a href="#">Item 2</a></li>
						<li><a href="#">Item 3</a></li>
					</ul>
				</li>
				<li class='dropdown-submenu'><a href="#" class='dropdown-toggle' data-toggle='dropdown'>Sub Menu 2</a>
					<ul class='dropdown-menu' role='menu'>
						<li><a href="#">Item 1</a></li>
						<li><a href="#">Item 2</a></li>
						<li><a href="#">Item 3</a></li>
					</ul>
				</li>
				<li class='dropdown-submenu'><a href="#" class='dropdown-toggle' data-toggle='dropdown'>Sub Menu 3</a>
					<ul class='dropdown-menu' role='menu'>
						<li><a href="#">Item 1</a></li>
						<li><a href="#">Item 2</a></li>
						<li><a href="#">Item 3</a></li>
					</ul>
				</li>

			</ul>
		</li>

		<li class='dropdown'>
			<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Menu 2<i class='caret'></i></a>
			<ul class='dropdown-menu' role='menu'>
				<li class="dropdown-submenu"><a href="#">Sub Menu 1</a>
					<ul class='dropdown-menu'  >
						<li><a href="#">Item 1</a></li>
						<li><a href="#">Item 2</a></li>
						<li><a href="#">Item 3</a></li>
					</ul>
				</li>
				<li class='dropdown-submenu'><a href="#" class='dropdown-toggle' data-toggle='dropdown'>Sub Menu 2</a>
					<ul class='dropdown-menu' role='menu'>
						<li><a href="#">Item 1</a></li>
						<li><a href="#">Item 2</a></li>
						<li><a href="#">Item 3</a></li>
					</ul>
				</li>
				<li class='dropdown-submenu'><a href="#" class='dropdown-toggle' data-toggle='dropdown'>Sub Menu 3</a>
					<ul class='dropdown-menu' role='menu'>
						<li><a href="#">Item 1</a></li>
						<li><a href="#">Item 2</a></li>
						<li><a href="#">Item 3</a></li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
     
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
