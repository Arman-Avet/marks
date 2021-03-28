<form action="index.jsp", method="post" id="logForm">
	<div class = "logindiv">
		<p style = "color: green; font-size:140%;margin-top:0px; text-align:center;margin:auto;">Log in</p>
		<input id = "username" name = "username" class = "loginput" type="text" placeholder="username"></input><br>
		<input id = "password" name = "password" class = "loginput" type="password" placeholder="password"></input>
		<button class = "submitButton" type="button" onclick = "loginUser()"  style = "margin-top: 10px;">login</button><br>
		<div class = "regerror"><%= request.getParameter("message")%></div>
		<p style ="margin-left:10px; margin-top: 5px; margin-bottom: 5px;">not registered ?<a href="register.jsp" class = "reglog"> register now!</a></p>
	</div>
</form>
