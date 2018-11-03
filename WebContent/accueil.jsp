<%@page import="java.util.List"%>
<%@page import="model.dao.LoginDao"%>
<%@page import="java.util.Date"%>
<%@page import="model.bo.Utilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Acceuil</title>

<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index1.jsp">Accueil</a>



		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<!-- <div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div> -->
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<!-- <li id="li_messages"><button ></button> <span class="badge badge-danger">0</span>
			</li> -->
			<!-- 	<li id="li_messages" class="nav-item dropdown no-arrow mx-1"><a
				 id="messageDropdown" role="button"
				data-toggle="dropdown" >
					<i class="fas fa-bell fa-fw"></i> <span id = "msg_count" class="badge badge-danger">0</span>
			</a></li> -->
			<li id="li_messages" class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link " role="button" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
					id="msg_count" class="badge badge-danger">0</span>
			</a></li>
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
					class="badge badge-danger">0</span>
			</a></li>

			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="login.jsp" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active" id="li_actualite"><a
				class="nav-link"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Actualité</span>
			</a></li>
			<li class="nav-item dropdown" id="li_events"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span>Events</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">

					<a class="dropdown-item" href="">All Events</a> <a
						class="dropdown-item" href="">My Events</a> <a
						class="dropdown-item" href="">Create Events</a>
					<div class="dropdown-divider"></div>

				</div></li>
			<li class="nav-item" id="li_publications"><a class="nav-link">
					<i class="fas fa-fw fa-chart-area"></i> <span>Mes
						Publications</span>
			</a></li>
			<li class="nav-item" id="li_accessoires"><a class="nav-link">
					<i class="fas fa-fw fa-table"></i> <span>Accessoires</span>
			</a></li>

			<li class="nav-item" id="li_think"><a class="nav-link"> <i
					class="fas fa-fw fa-table"></i> <span>Tell us what do you
						think</span></a></li>
		</ul>

		<input id="user_id" value="3" style="display: none"></input> <input
			id="contact_id" value="1" style="display: none"></input>



		<div id="content-wrapper">
			<iframe id="iframe" frameborder="0" width="100%" height="800"></iframe>
			<!-- <p class="small text-center text-muted my-5">
            <em>More actualities coming soon...</em>
          </p> 
	<%-- 		<div id="matter1">
				<p class="small text-center text-muted my-5">
					<em>More actualities coming soon...</em>
				</p>
			</div>
			<div id="matter2" style="display: none"></div>
			<div id="matter3" style="display: none"></div>
			<div id="matter4" style="display: none">
				<jsp:include page="accessoires.jsp" />
			</div>
			<div id="matter5" style="display: none"></div>
			<div id="matter6" style="display: none">
				<jsp:include page="message.jsp" />
			</div>
			<div id="matter7" style="display: none"></div>
			<div id="matter8" style="display: none"></div>
			<div id="matter9" style="display: none"></div> --%>

			<!-- Area Chart Example-->

			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>SU,M2STL 2018_2019</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="js/demo/datatables-demo.js"></script>
	<script src="js/demo/chart-area-demo.js"></script>


	<script src="js/acceuil.js"></script>
</body>

</html>
