function addMsg() {
	$.ajax({
				"url" : "message",
				"type" : "post",
				"data" : {
					"content" : $("#msg_content").val(),
					"action" : "add_message",
					"user_id" : $("#user_id", window.parent.document).val(),
					"contact_id" : $("#contact_id", window.parent.document)
							.val()
				},

				"dataType" : "text",
				"success" : function(data) {
					var obj = window.parent.document.getElementById("iframe");
					// obj.src = "message.jsp";
					obj.src = "message.jsp";

				}
			});

}