<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" />
<link href="css/message.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/pagination.css">
<script src="js/pagination.js"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>

<link href="assets/media/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<link href="assets/media/css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css" />

<link href="assets/media/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />

<link href="assets/media/css/style-metro.css" rel="stylesheet" type="text/css" />

<link href="assets/media/css/style.css" rel="stylesheet" type="text/css" />

<link href="assets/media/css/style-responsive.css" rel="stylesheet"
	type="text/css" />

<!-- 	<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/> -->

<link href="assets/media/css/uniform.default.css" rel="stylesheet"
	type="text/css" />

<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL STYLES -->

<link href="assets/media/css/bootstrap-tag.css" rel="stylesheet"
	type="text/css" />

<link href="assets/media/css/bootstrap-wysihtml5.css" rel="stylesheet"
	type="text/css" />

<link href="assets/media/css/jquery.fancybox.css" rel="stylesheet" />

<link href="assets/media/css/bootstrap-wysihtml5.css" rel="stylesheet"
	type="text/css" />

<!-- BEGIN:File Upload Plugin CSS files-->

<link href="assets/media/css/jquery.fileupload-ui.css" rel="stylesheet"
	type="text/css">

<!-- END:File Upload Plugin CSS files-->

<link href="assets/media/css/inbox.css" rel="stylesheet" type="text/css" />

<!-- END PAGE LEVEL STYLES -->

<link rel="shortcut icon" href="media/image/favicon.ico" />

<script src="js/message.js"></script>


<!-- <meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" /> -->




<!-- BEGIN PAGE CONTAINER-->
<div class="content"></div>
<!--  <img id = "bg-img" alt="" src="img/pets5.png"> -->

<div class="container-fluid">

	<!-- BEGIN PAGE HEADER-->

	<div class="row-fluid">

		<div class="span10">

			<!-- BEGIN STYLE CUSTOMIZER -->


			<!-- BEGIN PAGE TITLE & BREADCRUMB-->

			<h3 class="page-title pull-left">

				Inbox <small>user inbox</small>

			</h3>

			<!-- END PAGE TITLE & BREADCRUMB-->

		</div>
		
		<!-- 	<form action="#" class="form-search pull-right">

				<div class="input-append">

					<input class="m-wrap" type="text" placeholder="Search Mail">

					<button class="btn green" type="button">Search</button>

				</div>

			</form> -->

	</div>

	<div class="row-fluid inbox">

		<div class="span2">

			<ul class="inbox-nav margin-bottom-20 pull-left">

			<!-- 	<li class="inbox active" onclick="getAllNewMessages()"><a href="javascript:;" class="btn"
					data-title="Inbox">New messages</a> <b></b></li> -->

				<li id= "receive" class=" inbox receive"  onclick="getReceiveMessages()"><a
					class="btn" href="javascript:;" data-title="receive">Receive Messages</a><b></b></li>

				<li id= "send" class="send" onclick="getSendMessages()"><a class="btn"
					href="javascript:;" data-title="Send">Send Messages</a><b></b></li>

				<!-- 	<li class="trash"><a class="btn" href="javascript:;"
					data-title="Trash">Trash</a><b></b></li> -->

			</ul>

		</div>
		<table class="pull-right" id="msg_table">
			<thead id="msg_th">
			</thead>
			<tbody id="msg_tb">
			</tbody>
		</table>

<!-- 		<div class="span10">

			<div class="inbox-header"></div>

			<div class="inbox-loading">Loading...</div>

			<div class="inbox-content">
			</div>

		</div> -->

	</div>
<!-- 	<div id="pagination" class="pagination"></div> -->

</div>



