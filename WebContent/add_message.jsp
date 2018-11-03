<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/add_message.css" rel="stylesheet">

<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="js/add_message.js"></script>
<div id="add">
	<div id="textArea">
		<textarea id="msg_content" name="content"
			placeholder="Input Text..."></textarea>
	</div>
    <div id = "send">
    	<input id="add_btn" type="button" class="button" onclick="addMsg()" value="Send"></input>
    </div>
	

		<!-- <label id="la">Test</label>  -->

</div>
