$( document ).ready(function() {
	var event=$("#even");
	var id;
	getId((data)=>{
		
		console.log(data);
		id =data;
		console.log(id);
	});
	
	
	$.ajax({
		"url" : "event",
		"type" : "post",
		"data" : event,
		"dataType" : "json",
		"success" : function( events, textStatus, jqXHR) {
			//var r=getUser();
			
			$('#event_tb').empty();
			var tm;
			var i=0;
			var photo;
			var interesse=0;
			const colors = ['rgb(165, 82, 167)', 'rgb(197, 44, 102)'];
			/*******new comment********/
			var c;
			var today = new Date();
			//console.log(events[0]);
		    var e= "</li>"+
	           " </ul>"+
	           "</div>"+
	         "</li>"+
	      " </ul>"+
	
	"</div>"+"</div>"+"</td>"+"</tr>";
		   /* while(i<events.length)
		    	{
		    	annonce=events[i];
				console.log("annonce"+annonce[1].event_id+" user"+annonce[3].id);

		    	i++;
		    	}*/
			while(i<events.length) {
				  interesse=0; 
				var bool=false;

				 photo="img/event.png";

				var annonce = events[i];
				//console.log(annonce);
				tm=annonce[1].event_id;
	            var b="<span class='num'>"+interesse+"</span>";
	            
	            var d="<form action='event' method='post'>"+
                "<input type='hidden' name='id' value='"+annonce[1].event_id+"' /><button type='submit' class='button'name='action' value='intrested'>"+
                "<span class='glyphicon glyphicon-star'></span>interessé"+
              "</button></form>";

if(annonce[2]!==null){
	console.log("non cest pas null");
	photo="data:image/jpg;base64,"+annonce[2].base64Image;
}
	

	

			
        

				//console.log(annonce[2]);
				var a="<tr><td><div class='container'"+
			     "style='background-color: rgb(220, 220, 220);width: 100%;'>"+
			   
			        
			                          
			                              "<div>"+
			                                "<ul class='event-list'>"+
			                                  "<li>"+
			                                    "<time style='background-color:"+colors[i%2]+"'>"+
			                                      "<span class='day'>"+jour(annonce[1].date)+"</span>"+
			                                      "<span class='month'>"+mois(annonce[1].date)+"</span>"+

			                                   "</time>"+
			                                    "<img src='"+photo+"'/>"+
			                                    "<time style='background-color: #eaeaea; color: #2cd1b9;'>";
			                      
			               
	   				              
				
				  c="<span class='inter'>interessés</span>"+

			         "</time>"+
			          "<div class='info'>"+
			            "<h2 class='title'>"+annonce[1].title+"</h2>"+
			            "<p class='desc'>"+annonce[1].description+"</p>"+
			          "</div>"+
			          "<div class='social'>"+
			            "<ul>"+
			              "<li class='facebook' >";
			       
					if(annonce[3]!==null){
						//console.log("event"+annonce[1].event_id+"users"+annonce[3].id);
						//console.log("interesse"+interesse+" annonce"+annonce[1].event_id+" user"+annonce[3].id+"id rec"+id);
						
						while(tm===annonce[1].event_id){
							
							interesse++;
							console.log("interesse"+interesse+" annonce"+annonce[1].event_id+" user"+annonce[3].id+"id rec"+id);
							tm=annonce[1].event_id;
							if(annonce[3].id==id){
								console.log("nchallah"+id);
								bool=true;
							}
							

							i++;
							if(i===events.length){
								console.log("je sors ici");
								break;
							}
							annonce=events[i];
						}
						i--;
						annonce=events[i];

					
					if(bool===true){
						//console.log(" true interesse"+interesse+" annonce"+annonce[1].event_id+" user"+annonce[3].id);

					      b="<span class='num'>"+interesse+"</span>";
				            
				            d="<form action='event' method='post'>"+
			                "<input type='hidden' name='id' value='"+annonce[1].event_id+"' /><button type='submit' class='button' name='action' value='notIntrested'>"+
			                "<span class='glyphicon glyphicon-star'></span> pas interessé"+
			              "</button></form>";
						
						

							interesse=0;
						}
					else{
						console.log("false interesse"+interesse+" annonce"+annonce[1].event_id+" user"+annonce[3].id);

						   b="<span class='num'>"+interesse+"</span>";
				            
				            d="<form action='event' method='post'>"+
			                "<input type='hidden' name='id' value='"+annonce[1].event_id+"' /><button type='submit' class='button' name='action' value='intrested'>"+
			                "<span class='glyphicon glyphicon-star'></span>interessé"+
			              "</button></form>";
						
						
						 interesse=0;
					}
				
					}
					           
					            
					$('#event_tb').append(a+b+c+d+e);

								i++;
					
			
				
			}
			
		}
	
	});
	//console.log(getUser());
});
function ajoutEvent(){
	var frm=$("#new_event");
	$.ajax({
				"url" : "event",
				"type" : "post",
				"data" : frm.serialize(),
			
				"dataType" : "json",
				"success" : function( events, textStatus, jqXHR) {
					//var json = JSON.stringify(events); $('#json').val(json);
					/*
					$('#event_th').empty();
					if (items.length > 0) {
						$('#th').append('<tr><td>' + "Photo" + '</td><td>'
								+ "Titre" + '</td></tr>');
					}
					*/
					$('#event_tb').empty();
					for (i = 0; i <events.length; i++) {
						var event = events[i];
						$('#event_tb').append('<tr><td>' + '</td><td><ul><li><p>title : '+event.title+'</p></li>'+'<li><p> contenu: '+event.description+'</p></li>'+'<li><p>adresse :'+event.location+'</p></li></ul></td></tr>');
						//$('#event_tb').append('<tr><td>'+events[i].title+'</td></tr>');
					}
					//console.log("asma bent rachid");
				}
			});

}

function dejaInteresse(event,e){
	console.log(e);
	//console.log(events);
	var a=false;
	//var i=0;
	//while(i<events.length){
		console.log("boucle");
	//	var e=events[i];
		if(e.event_id===event){
			console.log("trouve");
			a=true;
		//	break;
		}
	//	i++;
	//}
	return a;
	
}
function rechercher(){

	var a="";
	// console.log(document.getElementById("search_adress").value+"**"+$("#search_keyword").value+"***"+$("#search_categorie").value);
	if((document.getElementById("search_adress").value===a)&&(document.getElementById("search_date").value===a)){
		alert("saisissez au moins un critére de recherche");
	}
	else{
	var frm=$("#search_event");
	$.ajax({
		"url" : "event",
		"type" : "post",
		"data" : frm.serialize(),
		"dataType" : "json",
		"success" : function( events, textStatus, jqXHR) {
			//var r=getUser();
			if(events.length===0){
				alert("pas de resultat qui correspond à votre recherche");

			}else{
			$('#event_tb').empty();
			var tm;
			var i=0;
			var photo;
			var interesse=0;
			const colors = ['rgb(165, 82, 167)', 'rgb(197, 44, 102)'];
			/*******new comment********/
			var c;
			var today = new Date();
			//console.log(events[0]);
		    var e= "</li>"+
	           " </ul>"+
	           "</div>"+
	         "</li>"+
	      " </ul>"+
	
	"</div>"+"</div>"+"</td>"+"</tr>";
		   /* while(i<events.length)
		    	{
		    	annonce=events[i];
				console.log("annonce"+annonce[1].event_id+" user"+annonce[3].id);

		    	i++;
		    	}*/
			while(i<events.length) {
				  interesse=0; 
				var bool=false;

				 photo="img/event.png";

				var annonce = events[i];
				//console.log(annonce);
				tm=annonce[1].event_id;
	            var b="<span class='num'>"+interesse+"</span>";
	            
	            var d="<form action='event' method='post'>"+
                "<input type='hidden' name='id' value='"+annonce[1].event_id+"' /><button type='submit' class='button'name='action' value='intrested'>"+
                "<span class='glyphicon glyphicon-star'></span>interessé"+
              "</button></form>";

if(annonce[2]!==null){
	console.log("non cest pas null");
	photo="data:image/jpg;base64,"+annonce[2].base64Image;
}
	

	

			
        

				//console.log(annonce[2]);
				var a="<tr><td><div class='container'"+
			     "style='background-color: rgb(220, 220, 220);width: 100%;'>"+
			   
			        
			                          
			                              "<div>"+
			                                "<ul class='event-list'>"+
			                                  "<li>"+
			                                    "<time style='background-color:"+colors[i%2]+"'>"+
			                                      "<span class='day'>"+jour(annonce[1].date)+"</span>"+
			                                      "<span class='month'>"+mois(annonce[1].date)+"</span>"+

			                                   "</time>"+
			                                    "<img src='"+photo+"'/>"+
			                                    "<time style='background-color: #eaeaea; color: #2cd1b9;'>";
			                      
			               
	   				              
				
				  c="<span class='inter'>interessés</span>"+

			         "</time>"+
			          "<div class='info'>"+
			            "<h2 class='title'>"+annonce[1].title+"</h2>"+
			            "<p class='desc'>"+annonce[1].description+"</p>"+
			          "</div>"+
			          "<div class='social'>"+
			            "<ul>"+
			              "<li class='facebook' >";
			       
					if(annonce[3]!==null){
						//console.log("event"+annonce[1].event_id+"users"+annonce[3].id);
					
						
						while(tm===annonce[1].event_id){
							
							interesse++;
							console.log("interesse"+interesse+" annonce"+annonce[1].event_id+" user"+annonce[3].id);
							tm=annonce[1].event_id;
							if(annonce[3].id===id)
								bool=true;

							i++;
							if(i===events.length){
								console.log("je sors ici");
								break;
							}
							annonce=events[i];
						}
						i--;
						annonce=events[i];

					
					if(bool===true){
						//console.log(" true interesse"+interesse+" annonce"+annonce[1].event_id+" user"+annonce[3].id);

					      b="<span class='num'>"+interesse+"</span>";
				            
				            d="<form action='event' method='post'>"+
			                "<input type='hidden' name='id' value='"+annonce[1].event_id+"' /><button type='submit' class='button' name='action' value='notIntrested'>"+
			                "<span class='glyphicon glyphicon-star'></span> pas interessé"+
			              "</button></form>";
						
						

							interesse=0;
						}
					else{
						console.log("false interesse"+interesse+" annonce"+annonce[1].event_id+" user"+annonce[3].id);

						   b="<span class='num'>"+interesse+"</span>";
				            
				            d="<form action='event' method='post'>"+
			                "<input type='hidden' name='id' value='"+annonce[1].event_id+"' /><button type='submit' class='button' name='action' value='intrested'>"+
			                "<span class='glyphicon glyphicon-star'></span>interessé"+
			              "</button></form>";
						
						
						 interesse=0;
					}
				
					}
					           
					            
					$('#event_tb').append(a+b+c+d+e);

								i++;
					
			
				
			}
			
		}
		}
	});
	
	}	
	
}
function getId(callback){
	var id;
	
	$.ajax({
		"url" : "event",
		"type" : "post",
		"data" : {
			"action" : "searchuserid",
		},
		"dataType" : "" +
				"",
		"success" : function(text) {
           id=text;
           console.log(id);
           callback(id);
          
			} 

	});
  

	//return id;
}
function jour(date){
	var moonLanding = new Date(date);
	return moonLanding.getDate();
	}
	function mois(date){
	const monthNames = ["Jan", "Fév", "Mars", "Avril", "Mai", "Juin",
	"Juil", "Aout", "Sept", "Oct", "Nov", "Dec"
	];
	var moonLanding = new Date(date);
	return monthNames[moonLanding.getMonth()];
	}