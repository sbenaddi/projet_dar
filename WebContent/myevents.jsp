<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<link href="css/event.css" rel="stylesheet">
<link href="css/asma.css" rel="stylesheet">

<script src="js/myevent.js"></script>
<div>
	<div id="search_bar">
		<form id="search_event">
			<input type="hidden" name="action" value="my_search_event"> <input
				id="search_adress" class="search" name="by_adress" placeholder="Ville" /> 
				<input type="date" id="search_date" class="datepicker" name="by_date">
				 <input type="button" id="search_btn" onclick="rechercher()" value="Rechercher" />

		</form>
	</div>
	<div style="width: 80%;">
		<img src="img/animal.png">
	</div>

	<div id="actualite">
		
		<input id="myeven" type="hidden" name="action" value="display_mine" />

		<div id="event_table" style="text-align: center; margin-top: 20px;">

			<table id="event_tb">


			</table>


		</div>
<div id="myModal" class="modal">


		<div class="modal-content">

			<span onclick="fermer()" class="close">&times;</span>
			<form action="event" method="post">

				<input type="hidden" name="action" value="update" /> 
				<input
					type="hidden" id="id" name="id" />


				<div>

					<input id="pop_title" class="champ_pop" name="title">

				</div>
				<div>

					<textarea id="pop_content" class="champ_pop" name="content"></textarea>

				</div>
				<div>
					<input id="pop_location" class="champ_pop" name="location">

				</div>

				<button type="submit" id="update" value="Confirmer">Confirmer</button>
			</form>
		</div>


	</div>
	
	</div>
</div>
<script>
	function valider() {
		var title = document.getElementById("event_title");
		var location = document.getElementById("event_location");
		var date = document.getElementById("datepicker");
		if ((title.value === "") || (location.value === "")
				|| (date.value === "")) {
			alert("saisissez le contenu de votre annonce et sa categorie ");
			return false;
		} else {
			return true;
		}

	}
</script>
