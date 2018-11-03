<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

 <body>
        <form method="POST" action="user">
	    <fieldset>
                <legend>Test</legend>

                <label for="name">Name <span class="requis">*</span></label>
                <input type="name" id="name" name="name" value="" size="20" maxlength="60" />
                <br />
               
                 <label for="password">Password <span class="requis">*</span></label>
                <input type="password" id="password" name="password" value="" size="20" maxlength="60" />
                <br />
                
                 <label for="email">email <span class="requis">*</span></label>
                <input type="email" id="email" name="email" value="" size="20" maxlength="60" />
                <br />
                
                <input type="submit" value="user" class="sansLabel" />
                
</body>
</html>
