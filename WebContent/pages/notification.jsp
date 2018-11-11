<!DOCTYPE html>
<html lang="en">
<head>
<title>WebSocket</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="../assets/global/plugins/jquery.min.js"></script>
</head>
<body style="width: 97%;height: 97%;">
	<div id="login_div">
		username : <input type="text" id="content" name="content">
		<button onclick="login()">login</button>
	</div>
	<div id="system_msg" style="display:none;float: left;border: double;padding: 10px;width: 21%;">
		<span id="span"> </span>
	</div>
	<div id="chat_area" style="float: right;width: 75%;border: double;height: 92%;">
		<div id="chat_content" style="width: 98%;height: 92%;padding: 10px;overflow-y: auto;"></div>
		<input id="input_content" style="float:left;width: 84%;" type="text"/>
		<button style="width: 8%;" onclick="selectImage()">image</button>
		<input type="file" style="display:none" onchange="changeImage(this)" id="image_select"/>
		<button style="width: 6%;" onclick="sendChatMsg()">send</button>
	</div>
</body>
</html>
