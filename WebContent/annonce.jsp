<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link href="css/annonce.css" rel="stylesheet">
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
<script src="js/annonce.js"></script>


<div >




	<div id="search_bar">
		<form id="search_form">
			<input type="hidden" name="action" value="search_annonce" /> <input
				id="search_adress" class="search" name="by_adress"
				placeholder="Ville" /> <input id="search_keyword" class="search"
				name="by_keyword" placeholder="mot-clés" /> <select
				id="search_categorie" name="by_categorie" class="search">
				<option>-selectionner une catégorie-</option>
				<option value="chercher un animal">chercher un animal</option>
				<option value="proposer un animal">proposer un animal</option>
				<option value="chercher garde animaux">chercher garde
					animaux</option>
				<option value="garder des animaux">garder des animaux</option>
				<option value="animaux perdus">animaux perdus</option>
				<option value="autre">autre</option>

			</select> <input type="button" id="search_btn" onclick="rechercher()"
				value="Rechercher" />

		</form>
	</div>
	<div style="width:80%;"><img src="img/animal.png"></div>


	<div id="actualite">

		<form id="new_annonce" action="annonce" method="POST" enctype="multipart/form-data" onsubmit="return valider()">
			<input type="hidden" name="action" value="add_annonce" />

			<div>
				<input id="annonce_title" class="champ" name="title"
					placeholder="title" />
			</div>
			<div>
				<!--   <label for="mail">e-mail :</label>-->
				<textarea id="annonce_content" class="champ" name="content"
					placeholder="Exprimez-vous"></textarea>
			</div>
			<div>
				<input id="annonce_location" class="champ" name="location"
					placeholder="Adresse" />
			</div>
			<div>
				<select id="annonce_categorie" name="categorie" class="champ">
					<option>-selectionner une catégorie-</option>
					<option value="chercher un animal">chercher un animal</option>
					<option value="proposer un animal">proposer un animal</option>
					<option value="chercher garde animaux">chercher garde
						animaux</option>
					<option value="garder des animaux">garder des animaux</option>
					<option value="animaux perdus">animaux perdus</option>
					<option value="autre">autre</option>

				</select>
			</div>
		
 <label class="champ" >
	
				<label class="fileContainer" id="file1" ><input name="file1" type="file" accept="image/*" onclick="test('file1')">
				Photos <span
					class="glyphicon glyphicon-picture"></span> 
				</label>
				
					<label class="fileContainer" id="file2" style="display:none;"><input name="file2" type="file" accept="image/*" onclick="test('file2')">
				Photos <span
					class="glyphicon glyphicon-picture"></span> 
				</label>
				
					<label class="fileContainer" id="file3" style="display:none;"><input name="file3" type="file" accept="image/*">
				Photos <span
					class="glyphicon glyphicon-picture"></span> 
				</label>
				</label>
			
			<input type="submit" id="create_btn"
				value="Publier" />


		</form>													   
													   
													
		<!-- <label class="champ" >
			Appuyez pour rajouter des photos
		
				<label class="fileContainer" style="float:right;"><input name="photo" type="file" />
				Photos <span
					class="glyphicon glyphicon-picture"></span> 
				</label>
				</label>-->
		
			
		<div id="annonce_table">
			<input id="me" type="hidden" name="action" value="display_all" />

			<table id="annonce_tb">
				<tr>
					<td>
<div class="container">
  <div class="well">
    <div class="media">
      <a class="pull-left" href="#">
        <img class="media-object" src="http://placekitten.com/150/150">
  		</a>
      <div class="media-body">
        <h4 class="media-heading">Receta 1</h4>
        <p class="text-right">By Francisco</p>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate.
          Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis
          dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan.
          Aliquam in felis sit amet augue.
        </p>
        <ul class="list-inline list-unstyled">
          <li>
            <span>
              <i class="glyphicon glyphicon-calendar"></i> 2 days, 8 hours
            </span>
          </li>
          <li>|</li>
          <span>
            <i class="glyphicon glyphicon-comment"></i> 2 comments
          </span>
          <li>|</li>
          <li>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
          </li>
          <li>|</li>
          <li>
            <!-- Use Font Awesome http://fortawesome.github.io/Font-Awesome/ -->
            <span>
              <i class="fa fa-facebook-square"></i>
            </span>
            <span>
              <i class="fa fa-twitter-square"></i>
            </span>
            <span>
              <i class="fa fa-google-plus-square"></i>
            </span>
          </li>
        </ul>
      </div>
    </div>
  </div>
					</td>
				</tr>

			</table>


		</div>
		<div id="myModal" class="modal">


			<div class="modal-content">

				<span onclick="fermer()" class="close">&times;</span>
				<form action="annonce" method="post">

					<input type="hidden" name="action" value="update" /> <input
						type="hidden" id="id" name="id" />


					<div>

						<input id="pop_title" class="champ_pop" name="title"/>

					</div>
					<div>

						<input id="pop_content" class="champ_pop" name="content" />

					</div>
					<div>
						<input id="pop_location" class="champ_pop" name="location" />

					</div>

					<button type="submit" id="update" value="Confirmer">Confirmer</button>
				</form>
			</div>


		</div>

	</div>
</div>
<script>
function test(id){
	console.log(id);
	if(id==='file1')
	var file=document.getElementById("file2").style.display="block";
	else
		var file=document.getElementById("file3").style.display="block";

}
</script>
<script>
function valider(){
	var a="";
	//console.log(document.getElementById("search_adress").value+"**"+$("#search_keyword").value+"***"+$("#search_categorie").value);
	if((document.getElementById("annonce_content").value===a)||(document.getElementById("annonce_categorie").value==="-selectionner une catégorie-")){
		alert("saisissez au moins le contenu de votre annonce et sa categorie ");
		return false;
	}
	else{
return true;}
}
</script>	