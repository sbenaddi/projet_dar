<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%!String name=null; %>
<% name=(String)request.getAttribute("name");%>
<h1>HELLO  <%= name %> </h1>
        
</body>
</html>