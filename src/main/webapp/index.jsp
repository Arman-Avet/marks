<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="marks.Test1"%>
<%@ page import="java.util.List" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<script src="js/main.js"></script>
<h2>Hello World!</h2>
<%
String action = request.getParameter("action");
String subj = request.getParameter("subj");
String semester = request.getParameter("semester");
String value = request.getParameter("value");
String semestrial = request.getParameter("semestrial");
String mark = request.getParameter("mark");
String comment = request.getParameter("comment");

System.out.println("subject = " + subj);
System.out.println("semester = " + semester);
System.out.println("ratio = " + value);
System.out.println("is semestrial = " + semestrial);
System.out.println("mark value = " + mark);
System.out.println("comment = " + comment);



Test1 t = new Test1();
if (action != null && action.equals("insert")) {
	t.insertFunc(subj, semester, value, semestrial, mark, comment);
}

ArrayList<ArrayList<String>> result = t.getAll();
// comment

%>
<button class="w3-button w3-white w3-border" onclick="addRow()">+</button>
<table class="w3-table w3-striped w3-border;">
<tbody id = "tbody">
<%
boolean isFirst = true;
for(ArrayList<String> row: result){
	%>
	<tr>
	<%
	for(String cell: row){
		if (isFirst){
			%>
			<th>
			<%=cell%>
			</th>
			<%
		}
		else {
			%>
			<td>
			<%=cell%>
			</td>
			<%
		}
	} 
	isFirst = false;
	%>
	</tr>
	<%
}
%>
</tbody>
</table>

</body>
</html>
