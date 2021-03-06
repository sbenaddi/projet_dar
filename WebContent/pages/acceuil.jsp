<%@page import="java.util.List"%>
<%@page import="model.dao.UtilsDao"%>
<%@page import="java.util.Date"%>
<%@page import="model.bo.Utilisateur"%>
<%@page import="model.bo.Comment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Acceuil</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description" />
<meta content="" name="author" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
	rel="stylesheet" type="text/css" />
<link
	href="../assets/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<link
	href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="../assets/global/css/components.css" id="style_components"
	rel="stylesheet" type="text/css" />
<link href="../assets/global/css/plugins.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/admin/layout/css/layout.css" rel="stylesheet"
	type="text/css" />
<link id="style_color"
	href="../assets/admin/layout/css/themes/darkblue.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/admin/layout/css/custom.css" rel="stylesheet"
	type="text/css" />
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="page-header-fixed page-quick-sidebar-over-content ">
	<div class="page-header navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
				<a href="index.html"> <img
					src="../assets/admin/layout/img/logo-invert.png" alt="logo"
					class="logo-default" />
				</a>
				<div class="menu-toggler sidebar-toggler">
					<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
				</div>
			</div>
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte 
					notification.jsp
					-->
					<li class="dropdown dropdown-extended dropdown-notification"
						id="li_notification"><a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <i
							class="icon-bell"></i> 
							<span id="notificationnumber" class="badge badge-default"></span>
					</a>
						<ul id="notificationcontent" class="dropdown-menu">
							
						</ul>             
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown  dropdown-inbox" id="li_messages"><a
						href="javascript:;" class="dropdown-toggle" data-hover="dropdown"
						data-close-others="false"> <i class="icon-envelope-open"></i>
							<span id="msg_count" class="badge badge-default"> 0 </span>
					</a>
						<ul class="">
							<!-- 	<li class="external" >
                                    <h3>
                                    	You have <span class="bold">7 New</span> Messages
                                    </h3> 
                                    <a>view all</a>
                                    </li> -->
							<!-- 	<li id="li_messages" class="nav-item dropdown no-arrow mx-1"><a
                                    class="nav-link " role="button" aria-haspopup="true"
                                    aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
                                    	<span id="msg_count" class="badge badge-danger">0</span>
                                    </a></li> -->
						</ul></li>
					<li class="dropdown dropdown-user"><a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <img alt=""
							id="acceuilimgprofile" class="img-circle" src="" /> <span
							id="acceuilusername" class="username username-hide-on-mobile"></span>
							<i class="fa fa-angle-down"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li id="li_updateprofile"><a href="javascript:;"> <i
									class="icon-user"></i> My Profile
							</a></li>
							<li><a id="logOut" href="#"> <i class="icon-calendar"></i>Logout
							</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<div class="page-sidebar navbar-collapse collapse">
				<ul class="page-sidebar-menu" data-keep-expanded="false"
					data-auto-scroll="true" data-slide-speed="200">
					<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
					<!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
					<li class="sidebar-search-wrapper">
						<form class="sidebar-search " action="extra_search.html"
							method="POST">
							<a href="javascript:;" class="remove"> <i class="icon-close"></i>
							</a>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn"> <a href="javascript:;"
									class="btn submit"><i class="icon-magnifier"></i></a>
								</span>
							</div>
						</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->
					</li>
					<li id="li_actualite"><a href="javascript:;"> <i
							class="icon-home"></i> <span class="title">Actualité</span> <span></span>
					</a></li>
					<li id="li_events"><a href="javascript:;"> <i
							class="icon-basket"></i> <span class="title">Events</span> <span
							class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li id="li_create"><a href="ecommerce_product.html"> <i
									class="icon-home"></i> Create Events
							</a></li>
							<li><a href="ecommerce_index.html"> <i class="icon-home"></i>
									All Events
							</a></li>
							<li><a href="ecommerce_orders.html"> <i
									class="icon-basket"></i> My Events
							</a></li>
						</ul></li>
					<li id="li_publications"><a href="javascript:;"> <i
							class="icon-rocket"></i> <span class="title">Mes
								Publications</span> <span></span>
					</a></li>
					<li id="li_accessoires"><a href="javascript:;"> <i
							class="icon-diamond"></i> <span class="title">Accessoires</span>
							<span></span>
					</a></li>
					<li id="li_comment"><a href="javascript:;"> <i
							class="icon-puzzle"></i> <span class="title">Tell Us about
								what do you think</span> <span></span>
					</a></li>
					<!-- BEGIN ANGULARJS LINK -->
					<li id="li_aboutUs"><a href="javascript:;"> <i
							class="icon-paper-plane"></i> <span class="title"> About
								US</span>
					</a></li>
				</ul>
				<!-- END SIDEBAR MENU -->
			</div>
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<input id="contact_id" value="1" style="display: none"></input>
		<div class="page-content-wrapper">
			<div class="page-content" style="padding: 0px;">

				<iframe id="iframe" frameborder="0" style="margin: 0px;"
					width="100%" height="800" src="annonces.jsp"></iframe>
				<!-- END PAGE CONTENT-->
			</div>
		</div>
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="page-footer">
		<div class="page-footer-inner">
			2018 &copy; M2 STL <a
				href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes"
				title="Purchase Metronic just for 27$ and get lifetime updates for free"
				target="_blank">Projet DAR</a>
		</div>
		<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
	<script src="../assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script src="../assets/global/plugins/jquery-migrate.min.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="../assets/global/plugins/jquery-ui/jquery-ui.min.js"
		type="text/javascript"></script>
	<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script src="../assets/global/plugins/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script src="../assets/global/plugins/jquery.cokie.min.js"
		type="text/javascript"></script>
	<script src="../assets/global/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<script src="http://maps.google.com/maps/api/js?sensor=true"
		type="text/javascript"></script>
	<script src="../assets/global/plugins/gmaps/gmaps.min.js"
		type="text/javascript"></script>
	<script src="../assets/global/scripts/metronic.js"
		type="text/javascript"></script>
	<script src="../assets/admin/layout/scripts/layout.js"
		type="text/javascript"></script>
	<script src="../assets/admin/layout/scripts/quick-sidebar.js"
		type="text/javascript"></script>
	<script src="../assets/admin/layout/scripts/demo.js"
		type="text/javascript"></script>
	<script src="../assets/admin/pages/scripts/contact-us.js"></script>
	<script src="../js/acceuil.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.28.11/dist/sweetalert2.all.min.js"></script>	
	<script type="text/javascript" src="../js/websocket.js"></script>
</body>
</html>