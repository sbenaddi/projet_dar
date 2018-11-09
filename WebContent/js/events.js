$( document ).ready(function() {
	 window.setInterval(function() {
		 setCount();
	 }, 5000);
	
});
function setCount(){
$.ajax({
		
		"url" : "event",
		"type" : "post",
		"data" : $("#even"),
		"dataType" : "json",
		"success" : function( annonces, textStatus, jqXHR) {
			afficher_annonce(annonces);
			latest_posts(annonces);
				}

	});	
}
function display_events(events){
	var i=0;
	var id=1;
	$('#events').empty();
var event;
var bool;
	while(i<events.length){
		var photo="img/event.png";
		event=events[i];
		bool=deja_interesse(events,id,event[1].event_id);
if(bool==true)
	interesse="<a><span><form action='event' method='post'>"+
	"<input type='hidden' name='id' value='"+event[1].event_id+"' /><button style='border:none;background-color:black;margin-top:10px;color:white;padding:5px;' type='submit'  name='action' value='notIntrested'>"+
	"<span class='glyphicon glyphicon-star'></span>pas interessé"+
	"</button></form></a></span>";
else
interesse="<a><span><form action='event' method='post'>"+
"<input type='hidden' name='id' value='"+event[1].event_id+"' /><button style='border:none;background-color:black;margin-top:10px;color:white;padding:5px;' type='submit'  name='action' value='intrested'>"+
"<span class='glyphicon glyphicon-star'></span>interessé"+
"</button></form></a></span>";
		 if(event[1].photo!=null)
			 photo="data:image/jpg;base64,"+event[1].photo.base64Image;
		 
	var even=""+
	  "<div class='single-blog-area blog-style-2 mb-100'>"+
	    "<div class='single-blog-thumbnail'>"+
	        "<img src='"+photo+"' alt=''>"+
	        "<div class='post-date'>"+
	          "<a href='#'>"+
	            jour(event[1].date)+"<span>"+mois(event[1].date)+"</span>"+
	          "</a>"+
	          interesse+
	        "</div>"+
	      "</div>"+
	    <!-- Blog Content -->
	    "<div class='single-blog-content mt-50'>"+
	      "<div class='line'></div>"+
	      "<h4>"+
	        "<a href='#'class='post-headline'>"+event[1].title+"</a>"+
	     " </h4>"+
	     "<p>"+event[1].description+"</p>"+
	      "<div class='post-meta'>"+
	        "<p>"+
	         " By <a href='#'>"+event[0].name+"</a>"+
	        "</p>"+
	        "<p> A "+event[1].location+"</p>"+
	        "</div>"+
	 " </div>"+
	"</div>";
	    var objTo = document.getElementById('events');
	      var new_post = document.createElement("div");
	      new_post.innerHTML = even;
	      objTo.appendChild(new_post);
	    i++;
	
	}
	
}
function deja_interesse(events,id,id_ev){
	
	var i=0;
	var event;
	while(i<events.length){
		event=events[i];
		
		if(event[1].event_id==id_ev)
			if(event[2]!=null){
			if(event[2].id==id)
				return true;
			}
			else return false;
		i++;
	}
	return false;
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
	function heure(date){
		var moonLanding = new Date(date);
		return moonLanding.getHours();
		}
		function minute(date){
		
		var moonLanding = new Date(date);
		return moonLanding.getMinutes();
		}
		function heure(date){
			var moonLanding = new Date(date);
			return moonLanding.getHours();
			}
			function minute(date){
			
			var moonLanding = new Date(date);
			return moonLanding.getMinutes();
			}