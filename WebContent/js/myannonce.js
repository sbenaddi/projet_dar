$( document ).ready(function() {
$.ajax({
		
		"url" : "annonce",
		"type" : "post",
		"data" : $("#me"),
		"dataType" : "json",
		"success" : function( annonces, textStatus, jqXHR) {
			// var r=getUser();
		
			$('#annonce_tb').empty();
			var tm;
			var tmp;
			var i=0;
			
			var com="";
			/** *****new comment******* */
			var c;
			var p="";// photos

			var b= "</section>"+"</div>"+"</div>"+"</div>"+"</td>"+"</tr>";
			
			while(i<annonces.length) {
				
				var annonce = annonces[i];
				//console.log("je ne sais méme pas sil fait ca ");
				
				tm=annonce[1].id;
				
				var a="<tr><td><div class='container'"+
			     "style='width: 85%; border: 1px solid #e0e0e0;background-color:white;'>"+
			    "<div>"+
			        "<div class='panel-body'>"+
			            "<section class='post-heading'>"+
			                "<div class='row'>"+
			                    "<div style='width:70%;display:inline-block;float:left;' class='col-md-11'>"+
			                        "<div class='media'>"+
			                        "<img class='media-object photo-profile' src='img/01.jpg'"+
				                     "width='70' height='70'"+
				                     "style='display: inline-block; float: left; margin-right: 10px;'>"+
				                     
			                            "<div class='media-body'>"+
			                                "<a class='anchor-username' style='float: left; margin-right: 20px; text-decoration: none;'>"+
			                                    "<h4 class='title' class='media-heading'>"+

			                                    annonce[0].name+
			                                    "</h4>"+
			                                "</a> <a class='anchor-time' style='float: left;margin-right:10px; text-decoration: none;margin-top:20px;'>"+annonce[1].date+"</a>"+
			                                 "<a class='anchor-time' style='float: left; text-decoration: none;margin-top:15px;'> à "+annonce[1].location+"</a>"+
			                            "</div>"+
			                        "</div>"+
			                     
			                    "</div>"+
			                    "<div class='btn-group'> "+
	   				             
	   				              "<form action='message' method='post'style='display: inline-block;'> "+
	   				                    
	   				               
	   				                "<input type='hidden' name='id' value='"+annonce[1].id+"' />"+
	   				                "<button class='button' type='submit' name='action' value='contacter' >"+
	   				                       
	   				               
	   				                  "<span class='glyphicon glyphicon-envelope'></span>contacter"+
	   				                 
	   				               "</button>"+
	   				                "</form></div>"+
			                "</div>"+
			            "</section>"+
			            "<section class='post-body' style='margin-top:10px;background-color:#c4c4c4;padding:10px;'>"+
			                " <a class='anchor-username'"+
			                     "style='float: left; display: block; text-decoration: none;'>"+
			                    "<h4 class='title' class='media-heading'>"+ annonce[1].title+
			    
			                    "</h4>"+
			                "</a><br><br>"+
			                "<p class='contenu'>"+
			                   annonce[1].content+
			                "</p>"+
			               

			                "<hr style='float: right; margin-bottom: 0px; width: 100%; />"+

			            "</section>"+

			            "<section class='post-footer'>"+
			            "<div class='post-footer-option container'>";
			          
			           
			        

			                

				c="<form action='commentaire' method='post'>"+
	            "<input type='hidden' name='id' value='"+annonce[1].id+"' />"+
	            "<input type='hidden' name='action' value='add_comment' />"+

					"<textarea class='commentaire'"+
			          "name='content_comment' placeholder='Votre commentaire' onfocusout='this.form.submit();'></textarea>"+
			        "</form>";   
			                    
				
				/** **********si pas de commentaire**** */
				if(annonce[3]===null){//pas de commentaire
					if(annonce[2]===null){//pas de photo
					
					$('#annonce_tb').append(a+"</div>"+c+b);
					i++;
					}
					else{//pas de com mais il y a de photo
						while(tm===annonce[1].id){
							//console.log("i must be here ");
							p=p+"<img class='images' class='media-object photo-profile' src='data:image/jpg;base64,"+annonce[2].base64Image+"'"+
		                     "width='70' height='70'"+
		                     "style='display: inline-block; float: left; margin-right: 10px;'>";
								     tm=annonce[1].id;
								     i++;
								     if(i===annonces.length)
											break;
										annonce=annonces[i];
										
						}
						
						  p=p+"</div>";
						$('#annonce_tb').append(a+p+c+b);
						p="";
						
					}
					
					
				}
				else{//il y a de comm
					if(annonce[2]===null){// il y a com mais pas de photo
				while(tm===annonce[1].id){
				
				com=com+ "<div class='post-footer-comment-wrapper' style='background-color:  #f8f8f8;margin-bottom:5px;'>"+
	         
	            "<div class='media-left' style='background-color:  #f8f8f8;'>"+
	                "<img class='media-object photo-profile' src='img/01.jpg'"+
	                     "width='50' height='50'"+
	                     "style='display: inline-block; float: left; margin-right: 10px;'>"+

	                "<div class='media-body' style='background-color: #f8f8f8;width:100%;'>"+
	                    "<a class='anchor-username'"+
	                       "style='float: left; margin-right: 20px; text-decoration: none;'>"+
	                        "<h4 class='media-heading'>"+annonce[4].name+"</h4>"+
	                    "</a> <a class='anchor-time' style='float: left; text-decoration: none;'>"+annonce[3].date+"</a>"+
	                    "<p style='float: left; display: block; text-align: justify; padding-right: 20px; margin-left: 20px; font-size: 12px;'>"+

	                    annonce[3].content+                   
	                     
	                   "</p>"+
	                 
						"</div>"+
						
						 
						
	                "</div>"+

	            "</div>";

			     tm=annonce[1].id;
			  			     i++;
			  			   if(i===annonces.length)
								break;

			    
					annonce=annonces[i];

				}	
				$('#annonce_tb').append(a+"</div>"+com+c+b);
				 com="";
				}
				else{//il ya de comm et de photo
						while(tm===annonce[1].id){
							console.log("annonce"+annonce[1].id+"commentaire"+annonce[3].id);
							com=com+ "<div class='post-footer-comment-wrapper' style='background-color:  #f8f8f8;margin-bottom:5px;'>"+
					         
				            "<div class='media-left' style='background-color:  #f8f8f8;'>"+
				                "<img class='media-object photo-profile' src='img/01.jpg'"+
				                     "width='50' height='50'"+
				                     "style='display: inline-block; float: left; margin-right: 10px;'>"+

				                "<div class='media-body' style='background-color: #f8f8f8;width:100%;'>"+
				                    "<a class='anchor-username'"+
				                       "style='float: left; margin-right: 20px; text-decoration: none;'>"+
				                        "<h4 class='media-heading'>"+annonce[4].name+"</h4>"+
				                    "</a> <a class='anchor-time' style='float: left; text-decoration: none;'>"+annonce[3].date+"</a>"+
				                    "<p style='float: left; display: block; text-align: justify; padding-right: 20px; margin-left: 20px; font-size: 12px;'>"+

				                    annonce[3].content+                    
				                     
				                   "</p>"+
				                 
									"</div>"+
									
									 
									
				                "</div>"+

				            "</div>";
							tmp=annonce[3].id;
							if(p===""){
							while(tmp===annonce[3].id){// je collecte les photo
								
								p=p+  "<img class='images' class='media-object photo-profile' src='data:image/jpg;base64,"+annonce[2].base64Image+"'>";
			                   
									     tmp=annonce[3].id;
									     
									     i++;
											if(i===annonces.length)
												break;
											annonce=annonces[i];

							}
							i--;
						  p=p+"</div>";
							}
							else{
								
							while(tmp===annonce[3].id){
								 tmp=annonce[3].id;
								// console.log(tmp);
								// tm=annonce[1].id;
						     i++;
						     if(i===annonces.length)
									break;
								annonce=annonces[i];
								
								
								
							}
							i--;
							}
							 

						     i++;
								// console.log("je
								// reboucle"+tm+"**"+annonce[1].id);
								if(i===annonces.length)
									break;
								annonce=annonces[i];

								console.log("annonce avant de boucler new comment "+annonce[1].id+" comment"+annonce[3].id+"tm"+tm);
						}//while
					// console.log("je vais passer a autre
					// annonce"+tm+"**"+annonce[1].id);
						$('#annonce_tb').append(a+p+com+c+b);
						 com="";
						 p="";
					}//if
				}
				
			}
			
		}

	});	

});



/***********ajouter une annonce*****************/
function modifier(){
	console.log("modifier");
	
}
function supprimer(){
	console.log("supprimer");
	
}
function contacter(){
	console.log("contacter");
	
}
function myBtn(id,titre,content,adresse) {
	console.log("mok a weld lkelb");
	var modal = document.getElementById('myModal');
	var title = document.getElementById('pop_title');
	var contenu = document.getElementById('pop_content');
	var location = document.getElementById('pop_location');
	var annonce = document.getElementById('id');


	title.value=titre;
	annonce.value=id;
	contenu.value=content;
	location.value=adresse;
	modal.style.display = "block";
}


var span = document.getElementsByClassName("close")[0];

function fermer() {
	var modal = document.getElementById('myModal');
	console.log("couckfslkfou!!");

	modal.style.display = "none";
}

window.onclick = function(event) {
	var modal = document.getElementById('myModal');

	if (event.target == modal) {
		modal.style.display = "none";
	}
}
