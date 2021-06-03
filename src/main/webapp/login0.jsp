
<!DOCTYPE html>
<html>
<head>
<link rel=”stylesheet” type=”text/css” href=”style.css”>
<script src=”verificalogin.js” type=”text/javascript”></script>
</head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="tiw2021.puffo.HelloAppEngine" %>
<%@ page import ="java.util.*" %>
<%@ page import= "com.google.appengine.api.users.*" %>
<%@ page import="tiw2021.puffo.*" %>
<%@ page import="tiw2021.puffo.login" %>

<body>
<h1>Benvenuto nella pagina di login</h1>


<form method="post" id="log" action="/helloTesina00"> 
    	<label for="username" style="width:80px"><b>Username</b></label>
		<input type="text" id="User" placeholder="Enter Username" name="username" required><br/>
    	<label for="psw" style="width:80px;"><b> Password </b></label>
		<input type="password" id="Password" placeholder="Enter Password" name="password" required><br/>
    	<button type="submit" value="Login" onclick="check()" class="btn btn-success">Login</button>
		<button type="button" onclick="hide()" class="btn btn-danger" align="center" style="position: absolute; left: 50%; margin-top: 5px;">Cancel</button><br>
    	
</form>

<!-- voglio ottenere uno userService e poi un URL /master.jsp a cui arrivo solo dopo aver fatto il login -->
<!-- QUI VOGLIO FARE IL LOGIN -->

<br>



</body>
</html>

