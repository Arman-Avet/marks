<%@page import="marks.Disciplin"%>
<%@page import="java.util.Collection"%>
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
Collection<Disciplin> disciplins = marksBean.getDisciplins();
%>

<div class = "tablediv" style = "display: none;" id = "tablers">
<p class = "textset1"><h> Your Averages</h></p>

<table class="w3-table w3-striped w3-border;" id = "table" >
<tbody id = "tbody">
	<tr>
		<th>Disciplin</th>
		<th>S1</th>
		<th>S2</th>
		<th>Y</th>
	</tr>
<%
if(disciplins != null && !disciplins.isEmpty()){
	float sum = 0;
	for(Disciplin disciplin: disciplins){
		%>
		<tr>
			<td><%=disciplin.name %></td>
			<td><%=disciplin.semester1.calculateAverage() %></td>
			<td><%=disciplin.semester2.calculateAverage() %></td>
			<td><%=disciplin.calculateYearAverage() %></td>
		</tr>
		<%
		sum+=disciplin.calculateYearAverage();
	}
	%>
		<tr>
			<td colspan = 4>Total: <%=sum/disciplins.size() %></td>
			
		</tr>
	<%
}
%>
		
</tbody>
</table>
</div>