<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="marks.MarksBean"%>
<%@page import="java.util.List"%>
<jsp:useBean id= "marksBean" scope= "session" 
class= "marks.MarksBean">
</jsp:useBean>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
<script src="js/main.js"></script>
<h2 class="h2"><i>YourAverage.ch</i></h2>
<%
//actual server path
//  C:\work\java\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\marks\img
String username = request.getParameter("username");
String password = request.getParameter("password");
String message = "";
if(username != null && password != null){
	boolean isOk = marksBean.login(username, password);
	if(!isOk){
		message = "incorrect password & username.";
	}
}


if(marksBean.getCurrentUser() == null){
	%>
	
	<jsp:include page="login.jsp">
		<jsp:param name="message" value="<%=message %>" />
	</jsp:include>
	<%
}
else{
	%>
	<nav>
	<ul>
		<li><a onclick ="showdb()">Marks</a></li>
		<li><a onclick ="showrs()">Averages</a></li>
	</ul>
	</nav><br>
	<%
	String paramId = request.getParameter("inputId");
	if(paramId!=null){
		String paramSubj = request.getParameter("inputSubj");
		String paramSemester = request.getParameter("inputSemester");
		String paramValue = request.getParameter("inputRatio");
		String paramSemestrial = request.getParameter("inputSemestrial");
		String paramMark = request.getParameter("inputMark");
		String paramComment = request.getParameter("inputComment");
		if (paramId.equals("")){
			marksBean.insertFunc(paramSubj, paramSemester, paramValue, paramSemestrial, paramMark, paramComment);

		}
		else {
			marksBean.editFunc(paramId, paramSubj, paramSemester, paramValue, paramSemestrial, paramMark, paramComment);
		}
	}
	
	%>
	<div style = "display: flex">
		<p style = "width: 260px; padding:0 20px; color:green; font-size: 16px; text-align:justify;">
		This web application allows you to record your marks during your college year 
		and get precise data about your  actual situation. The application calculates the averages as it is done in swiss colleges.
		The calculation is done for each discipline and each semester using the following formula: (mark*ratio + mark*ratio + ... / ratio total) + biannual /2.
		The year average is calculated as semester 1 average + semester 2 average /2.
		</p>
		<jsp:include page="table.jsp" />  
		<jsp:include page="results.jsp" /> 
	</div> 
	<%
}
%>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content"  style="width:800px">
    <span class="close" onclick = "closeModal">&times;</span>
    <p>
    <form action="index.jsp" method="POST" id="editForm">
    	<table>
    		<tr>
    			<td><input type = "text" id = "inputSubj" name = "inputSubj" class = "modalInput" placeholder = "discipline name"  style="width:140px"/></td>
    			<td>semester</td>
    			<td>
	    			<span><select id = "inputSemester" name = "inputSemester" class = "modalInput" style="width:40px">
		    			<option value = "1">1</option>
					    <option value = "2">2</option>
				    </select>
				    </span>
    			</td>
    			<td>ratio</td>
    			<td><input type = "text" id = "inputRatio" name = "inputRatio" class = "modalInput" placeholder = "ratio" value = "1"/></td>
    			<td>is&nbsp;bianual</td>
    			<td><input type="checkbox" id="inputSemestrial" name="inputSemestrial" style="padding-top:50px" class = "modalChb"/></td>
    			<td><input type = "text" id = "inputMark" name = "inputMark" class = "modalInput" placeholder = "mark"/> </td>
    			<td><button class = "submitButton" style = "heigth:40px;" onclick="submitRow()">submit</button></td>
    		</tr>
    		<tr>
    		<td colspan=8><input id = "inputComment" name = "inputComment" class = "comment" placeholder = "comment..."/></td>
    		</tr>
    	</table>
	    <input type = "hidden" id = "inputId" name = "inputId" value= ""/>
	</form>
    </p>
  </div>

</div>
<script src="js/main.js"></script>
</body>
</html>
