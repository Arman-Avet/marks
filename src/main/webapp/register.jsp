<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="marks.MarksBean"%>
<%@page import="java.util.List"%>
<jsp:useBean id= "marksBean" scope= "session"
class= "marks.MarksBean">
</jsp:useBean>
<html class = "reghtml">
<head>

<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
<script src="js/main.js"></script>
<div>
<h2 class="h2"><i>MarkCalculator2000 wow !</i></h2>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");

if(username != null && password != null && email != null){
	boolean isOk = marksBean.register(username, password, username, email);
	if(isOk){
		%>
		<p>You have been registered. Now click <a href="index.jsp">here</a> to login.</p>
		<%
	}
	else{
		%>
		
		<form action="register.jsp", method="post" id="regForm">
			<div class = "registerdiv">
			<input id = "username" name = "username" class = "loginput" type="text" placeholder="username"></input><br>
			<input id = "email" name = "email" class = "loginput" type="text" placeholder="e-mail"></input><br>
			<input id = "password" name = "password" class = "loginput" type="password" placeholder="password"></input><br>
			<input id = "confirmpassword" name = "confirmpassword" class = "loginput" type="password" placeholder="confirm password"></input>
			<button class = "submitButton" type="button" onclick = "createUser()">register</button><br>
			<div class = "regerror"> User with such name already exists. Please try another username.</div>
			<p style ="margin-left:10px; margin-top: 5px; margin-bottom: 5px;">already registered ?<a href="index.jsp" class = "reglog"> log in!</a></p>
			</div>
		</form>
		<%
	}
}
else{
	%>
	<form action="register.jsp", method="post" id="regForm">
			<div class = "registerdiv">
			<input id = "username" name = "username" class = "loginput" type="text" placeholder="username"></input><br>
			<input id = "email" name = "email" class = "loginput" type="text" placeholder="e-mail"></input><br>
			<input id = "password" name = "password" class = "loginput" type="password" placeholder="password"></input><br>
			<input id = "confirmpassword" name = "confirmpassword" class = "loginput" type="password" placeholder="confirm password"></input>
			<button class = "submitButton" type="button" onclick = "createUser()">register</button><br>
			<p style ="margin-left:10px; margin-top: 5px; margin-bottom: 5px;">already registered ?<a href="index.jsp" class = "reglog"> log in!</a></p>
			</div>
		</form>
		<%
}
	%>
</div>
</body>
</html>