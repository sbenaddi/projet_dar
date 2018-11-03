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
	
	//Logout
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
							window.location.href = "http://localhost:8090/Projet_dar/login.jsp";
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
						obj.src = "annonce.jsp";
					});
			$("#li_events").click(function() {
						obj.src = "event.jsp";
					});
			$("#li_publications").click(function() {
						obj.src = "myannonce.jsp";
					});
			$("#li_accessoires").click(function() {
// obj.src = "accessoires.jsp";
					obj.src = "accessoires.jsp";
					});
			$("#li_comment").click(function() {
						obj.src = "tellus.jsp";
					});
			$("#li_messages").click(function() {
						obj.src = "message.jsp";
// obj.src = "inbox.jsp";

					});
			$("#li_aboutUs").click(function() {
						obj.src = "aboutUs.jsp";

					});
			$("#li_updateprofile").click(function() {
				obj.src = "updateprofile.jsp";
			});

		})
