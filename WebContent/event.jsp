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

<script src="js/event.js"></script>
<div>
	<div id="search_bar">
		<form id="search_event">
			<input type="hidden" name="action" value="search_event"> <input
				id="search_adress" class="search" name="by_adress" placeholder="Ville" /> 
				<input type="date" id="search_date" class="datepicker" name="by_date">
				 <input type="button" id="search_btn" onclick="rechercher()" value="Rechercher" />

		</form>
	</div>
	<div style="width: 80%;">
		<img src="img/animal.png">
	</div>

	<div id="actualite">
		<form id="new_event" action="event" method="POST"
			enctype="multipart/form-data" onsubmit="return valider()">

			<input type="hidden" name="action" value="add_event" />

			<div>
				<input id="event_title" class="champ" name="title"
					placeholder="titre" />
			</div>
			<div>
				<!--   <label for="mail">e-mail :</label>-->
				<textarea id="event_description" class="champ" name="description"
					placeholder="Parlez-nous de votre événement"></textarea>
			</div>
			<div>
				<input id="event_location" class="champ" name="location"
					placeholder="Adresse" />
			</div>


			<label class="champ"> <input type="date" id="datepicker" class="datepicker"
				name="date"> <label class="fileContainer" id="file"><input
					name="file" type="file" accept="image/*"> Photos <span
					class="glyphicon glyphicon-picture"></span> </label></label> <input type="submit"
				id="create_btn" value="Publier" />


		</form>
		<input id="even" type="hidden" name="action" value="display_all" />

		<div id="event_table" style="text-align: center; margin-top: 20px;">

			<table id="event_tb">


			</table>


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
