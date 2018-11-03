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

 <script src="js/myannonce.js"></script> 

<div>




		<div id="search_bar">
		<form id="search_form">
		<input type="hidden" name="action" value="search_annonce" />
		
			<input id="search_adress" class="search" name="by_adress" placeholder="Ville" />
			<input id="search_keyword" class="search" name="by_keyword" placeholder="mot-clés" />
			<select id="search_categorie" name="by_categorie" class="search">
				<option>-selectionner une catégorie-</option>
				<option value="chercher un animal">chercher un animal</option>
				<option value="proposer un animal">proposer un animal</option>
				<option value="chercher garde animaux">chercher garde animaux</option>
				<option value="garder des animaux">garder des animaux</option>
				<option value="animaux perdus">animaux perdus</option>
				<option value="autre">autre</option>

			</select>
			<input type="button" id="search_btn"  onclick="rechercher()" value="Rechercher"/>
			
			</form>
		</div>


<div id="actualite" style="	background-color: #f2f2f2;">

	<div id="annonce_table">
		<input id="me" type="hidden" name="action" value="display_mine" />

		<table id="annonce_tb">
			<tr>
				<td>

					<div class="container"
						style="width: 85%; border: 1px solid #cad9ea;
						">
						<div>
							<div class="panel-body">
								<section class="post-heading">
									<div class="row">
										<div class="col-md-11">
											<div class="media">


												<img class="media-object photo-profile"
													src="http://0.gravatar.com/avatar/38d618563e55e6082adf4c8f8c13f3e4?s=40&d=mm&r=g"
													width="70" height="70" alt="...">

												<div class="media-body">
													<a class="anchor-username" style="float: left; margin-right: 20px;"><h4
															class="media-heading">Media heading</h4></a> <a
														class="anchor-time" style="float: left;">51 mins</a><br>
													<br> <br>


												</div>
											</div>
										</div>

									</div>
								</section>
								<section class="post-body">
									<br> <a class="anchor-username"
										style="float: left; display: block;"><h4
											class="media-heading">title</h4></a><br>
									<p style="float: left; text-align: justify;">Lorem ipsum
										dolor sit amet, consectetur adipiscing elit. Cras turpis sem,
										dictum id bibendum eget, malesuada ut massa. Ut scel erisque
										nulla sed luctus dapibus. Nulla sit amet mi vitae purus sol
										licitudin venenatis. Praesent et sem urna. Integer vitae
										lectus nis l. Fusce sapien ante, tristique efficitur lorem et,
										laoreet ornare lib ero. Nam fringilla leo orci. Vivamus semper
										quam nunc, sed ornare magna dignissim sed. Etiam interdum
										justo quis risus efficitur dictum. Nunc ut pulvinar quam. N
										unc mollis, est a dapibus dignissim, eros elit tempor diam, eu
										tempus quam felis eu velit.</p>

									<hr style="float: right; margin-bottom: 0px; width: 100%;"/>

								</section>


								<section class="post-footer">

									<div class="post-footer-option container">



										<div class="btn-group" style="float: left;">
											<form action='annonce' method='post'
												style="display: inline-block;">
												<input type='hidden' name='id' value='"+annonce.id+"' />
												<button class="button" type='submit' name='action'
													value='supprimer'>
													<span class='glyphicon glyphicon-trash'></span>supprimer
												</button>
											</form>

											<button class="button" value='modifier'>
												<span class='glyphicon glyphicon-pencil'></span> Modifier
											</button>


											<button class="button" type='button' name='action'
												value='contacter'>
												<span class='glyphicon glyphicon-envelope'></span>Contacter
											</button>
										</div>
									</div>
									<hr style="margin-top: 0px;">

									<div class="post-footer-comment-wrapper"
										style="background-color: white;">
										<!-- commentaire -->
										<div class="media-left" style="background-color: white;">
											<img class="media-object photo-profile" src="img/01.jpg"
												width="50" height="50"
												style="display: inline-block; float: left; margin-right: 10px;">

											<div class="media-body" style="background-color: #f8f8f8;">
												<a class="anchor-username"
													style="float: left; margin-right: 20px;">
													<h4 class="media-heading">Media heading</h4>
												</a> <a class="anchor-time" style="float: left;">51 mins</a>
												<p
													style="float: left; display: block; text-align: justify; padding-right: 20px; margin-left: 20px; font-size: 12px;">Lorem
													ipsum dolor sit amet, consectetur adipiscing elit. Cras
													turpis sem, dictum id bibendum eget, malesuada ut massa. Ut
													scel erisque nulla sed luctus dapibus. Nulla sit amet mi
													vitae purus sol licitudin venenatis. Praesent et sem urna.
													Integer vitae lectus nis l. Fusce sapien ante, tristique
													efficitur lorem et, laoreet ornare lib ero. Nam fringilla
													leo orci. Vivamus semper quam nunc, sed ornare magna
													dignissim sed. Etiam interdum justo quis risus efficitur
													dictum. Nunc ut pulvinar quam. N unc mollis, est a dapibus
													dignissim, eros elit tempor diam, eu tempus quam felis eu
													velit.</p>

											</div>


										</div>

									

									</div>
								</section>
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
