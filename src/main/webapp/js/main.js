function buttonfunc(){
	document.getElementById("tbody").className = "w3-table w3-bordered";
};
function addRow()
{
    document.querySelector("button").disabled = true;
	var row = document.createElement("tr");
	
	// subject
	var cell1 = document.createElement("td");
	var inputSubj = document.createElement("input");
	inputSubj.type = "text";
	inputSubj.style.width="100px";
	inputSubj.id = "inputSubj";
	cell1.appendChild(inputSubj);
	row.appendChild(cell1);
	
	var cell2 = document.createElement("td");
	var inputSemester = document.createElement("input");
	inputSemester.type = "text";
	inputSemester.style.width="100px";
	inputSemester.id = "inputSemester";
	cell2.appendChild(inputSemester);
	row.appendChild(cell2);
	
	var cell3 = document.createElement("td");
	var inputValue = document.createElement("input");
	inputValue.type = "text";
	inputValue.style.width="100px";
	inputValue.id = "inputValue";
	cell3.appendChild(inputValue);
	row.appendChild(cell3);
	
	var cell4 = document.createElement("td");
	var inputSemestrial = document.createElement("input");
	inputSemestrial.type = "checkbox";
	inputSemestrial.className ="chbox";
	inputSemestrial.style.height = "20px";
	inputSemestrial.style.width = "20px";
	inputSemestrial.id = "inputSemestrial";
	cell4.appendChild(inputSemestrial);
	row.appendChild(cell4);
	
	var cell5 = document.createElement("td");
	var inputMark = document.createElement("input");
	inputMark.type = "text";
	inputMark.style.width="100px";
	inputMark.id = "inputMark";
	cell5.appendChild(inputMark);
	row.appendChild(cell5);
	
	var cell6 = document.createElement("td");
	var inputComment = document.createElement("input");
	inputComment.type = "text";
	inputComment.style.width="100px";
	inputComment.id = "inputComment";
	cell6.appendChild(inputComment);
	row.appendChild(cell6);
	
	var cell7 = document.createElement("td");
	var inputOrder = document.createElement("input");
	inputOrder.type = "submit";
	inputOrder.style.width="100px";
	inputOrder.style.color="green";
	inputOrder.id = "inputOrder";
	inputOrder.onclick = function () {
		
		var action = "insert";
		var subj = document.getElementById("inputSubj").value;
		var semester = document.getElementById("inputSemester").value;
		var value = document.getElementById("inputValue").value;
		var semestrial;
		var checkbox = document.getElementById("inputSemestrial");
		var mark = document.getElementById("inputMark").value;
		var comment = document.getElementById("inputComment").value;
		if (subj != "" && semester != "" && value != "" && mark != "") {

			if (checkbox.checked == true) {
				semestrial = 1;
			}
			else {
				semestrial = 0;
			}
			var urlString = "index.jsp?action="+action+"&subj="+subj+"&semester="+semester+"&value="+value
				+"&semestrial="+semestrial+"&mark="+mark+"&comment="+comment;
			
			window.location = urlString;
			row.remove();
		}
		else {
			alert("you must complete important information.")
}
		
	}
	cell7.appendChild(inputOrder);
	row.appendChild(cell7);
	
	
	
	
      
      // get the html table
      // 0 = the first table
      var table = document.getElementById('tbody');
      table.appendChild(row);
      
      
}