<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="marks.MarksBean"%>
<%@page import="java.util.List"%>
<jsp:useBean id= "marksBean" scope= "session" 
class= "marks.MarksBean">
</jsp:useBean>
<%



String action = request.getParameter("action");
String id = request.getParameter("id");
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


if (action != null && action.equals("insert")) {
	marksBean.insertFunc(subj, semester, value, semestrial, mark, comment);
}
else if(action != null && action.equals("remove")){
	marksBean.removeFunc(id);
}

ArrayList<ArrayList<String>> result = marksBean.getMarksForUser();
// comment

%>

	<div class = "tablediv" style = "display: block;" id = "tabledb">
	<p class = "textset1">
	<button id = "addbutton" class="w3-button w3-white w3-border" style ="margin-left: 10px; margin-top: 10px;" onclick="newRow()">+</button>
	<h style = "margin-left:250px;"> Your Marks</h>
	</p>
	
	<table class="w3-table w3-striped w3-border;" id = "table">
	<tbody id = "tbody">
	<%
	if(result.size()>0){
		%>
		<tr>
		<%
		ArrayList<String> headerRow = result.get(0);
		for(String headerCell: headerRow){
			%>
			<th>
			<%=headerCell%>
			</th>
			<%
		} 
		%>
		<th colspan =2></th>
		</tr>
		<%
	}
	for(int i = 1; i < result.size(); i++){
		ArrayList<String> row = result.get(i);
		%>
		<tr>
		<%
		for(int j = 1; j < row.size(); j++){
			String cell = row.get(j);
				%>
				<td>
				<%=cell%>
				</td>
				<%
			} 
	
			%>
			<td>
				<button 
				class = "w3-button w3-white w3-border" 
				style = "font-size: 12px; padding: 2px 2px;" 
				onclick = "editRow(<%=row.get(0) %>, this.parentElement.parentElement)">Edit
				</button>
			</td>
			
			<td>
				<button 
				class = "w3-button w3-white w3-border" 
				style = "font-size: 12px; padding: 2px 2px;" 
				onclick = "deleteRow(<%=row.get(0) %>)">Delete
				</button>
			</td>
		</tr>
		<%
	}
	%>
	</tbody>
	</table>
	</div>