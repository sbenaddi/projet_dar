$(document).ready(function() {


	$.ajax({
		"url" : "user",
		"type" : "get",
		"data" : {
			"action" : "getUser"
		},
		"dataType" : "text",
		"success" : function(data) {
			console.log(data);
			var user = JSON.parse(data);

			
			document.getElementById("acceuilusername").innerHTML = user.name ? user.name : "";
			document.getElementById("acceuilimgprofile").src = "data:image/png;base64,"+user.avatar;
			
		}
	});
	
	// Logout
	$("#logOut").click(function() {
		const swalWithBootstrapButtons = swal.mixin({
			  confirmButtonClass: 'btn btn-success',
			  cancelButtonClass: 'btn btn-danger',
			  buttonsStyling: false,
			})

			swalWithBootstrapButtons({
			  title: 'Vous etes Sure? ',
			  text: "de se déconncter",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonText: 'Oui, logOut!',
			  cancelButtonText: 'Non, Annuler!',
			  reverseButtons: true
			}).then((result) => {
			  if (result.value) {
				  swalWithBootstrapButtons(
					      'Deconnecté!',
					      '',
					      'success'
					    )
				setTimeout(function(){
					$.ajax({
						"url" : "login",
						"type" : "post",
						"data" : {"action":"logOut"},
						"dataType" : "text",
						"success" : function(data) {
							window.location.href = "http://localhost:8090/Projet_dar/pages/login.jsp";
						}
					});
				}, 2000);
				  
			  } else if (
			    // Read more about handling dismissals
			    result.dismiss === swal.DismissReason.cancel
			  ) {
			    swalWithBootstrapButtons(
			      'Annulé',
			      ' ',
			      'error'
			    )
			  }
			})
	});
	
	// logOut();
	
	function menu(current){
		var listeMenu = ['li_actualite','li_events','li_publications','li_accessoires','li_comment','li_messages','li_aboutUs','li_updateprofile'];
		for(var i=0 ; i<listeMenu.length ; i++ ){
			var element = document.getElementById(listeMenu[i]);
			if(current == listeMenu[i]){
			    element.classList.add("active");
			    element.classList.add("open");
			}else{
				element.classList.remove("active");
				element.classList.remove("open");
			}
		}
	}

			function setCount() {
                
				$.ajax({
							"url" : "message",
							"type" : "post",
							"data" : {
								"action" : "getCountNoRead",
								"user_id" : $("#user_id").val()
							},
							"dataType" : "text",
							"success" : function(data) {
								$("#msg_count").text(data);
							}
						});

			}
			var obj = document.getElementById("iframe");

			$("#li_actualite").click(function() {
						obj.src = "annonces.jsp";
						menu('li_actualite');
					});
			$("#li_events").click(function() {
						obj.src = "events.jsp";
						menu('li_events');
					});
			
			$("#li_create").click(function() {
				obj.src = "myevents.jsp";
				menu('li_actualite');
			});
			
			$("#li_publications").click(function() {
						obj.src = "myposts.jsp";
						menu('li_publications');

					});
			$("#li_accessoires").click(function() {
// obj.src = "accessoires.jsp";
					obj.src = "accessoires.jsp";
					menu('li_accessoires');
					});
			$("#li_comment").click(function() {
						obj.src = "tellus.jsp";
						menu('li_comment');
					});
			$("#li_messages").click(function() {
						obj.src = "message.jsp";
						menu('li_messages');
// obj.src = "inbox.jsp";

					});
			$("#li_aboutUs").click(function() {
						obj.src = "aboutUs.jsp";
						menu('li_aboutUs');

					});
			$("#li_updateprofile").click(function() {
				obj.src = "updateprofile.jsp";
				menu('li_updateprofile');
			});
			
		})
