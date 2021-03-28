var action = "insert";
//Get the modal
var modal = byId("myModal");



// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
function showdb() {
	byId("tabledb").style.display = "block";
	byId("tablers").style.display = "none";
}
function showrs() {
	byId("tablers").style.display = "block";
	byId("tabledb").style.display = "none";
}
function newRow(){
	byId("inputSubj").value= ""; 
	byId("inputSemester").value = ""; 
	byId("inputRatio").value = "1"; 
	byId("inputMark").value = ""; 
	byId("inputComment").value= ""; 
	byId("inputSemestrial").checked= false; 
	modal.style.display = "block";
}

function submitRow() {
	var subj = byId("inputSubj").value; 
	var semester = byId("inputSemester").value; 
	var ratio = byId("inputRatio").value; 
	var mark = byId("inputMark").value; 
	var comment = byId("inputComment").value; 

	if (subj != "" && semester != "" && ratio != "" && mark != "") {

		byId("editForm").submit();
		modal.style.display = "none";
	}
	else {
		alert("You must fill in the required fields.")
	}
	

}
function deleteRow(rowId) {
	if(confirm("Are you sure?")){
		var urlString = "index.jsp?action=remove&id="+rowId;
		window.location = urlString;
	}

}
function editRow(rowId, row) {
		var semestrial = 0;

		var valSubj = row.children[0].innerText;
		var valSemester = row.children[1].innerText;
		var valRatio = row.children[2].innerText;
		var valSemestrial = row.children[3].innerText;
		var valMark = row.children[4].innerText;
		var valComment = row.children[5].innerText;
		
		var id = byId("inputId"); 
		var subj = byId("inputSubj"); 
		var semester = byId("inputSemester"); 
		var ratio = byId("inputRatio"); 
		var checkbox = byId("inputSemestrial"); 
		var mark = byId("inputMark"); 
		var comment = byId("inputComment"); 
		
		id.value = rowId;
		subj.value = valSubj;
		semester.value = valSemester;
		ratio.value = valRatio;
		if (valSemestrial == "1") {
			checkbox.checked = true;
		}
		else{
			checkbox.checked = false;
		}
		mark.value = valMark;
		comment.value = valComment;
		modal.style.display = "block";
}


function createUser() {
	var username = byId("username").value;
	var password = byId("password").value;
	var confpass = byId("confirmpassword").value;
	var email = byId("email").value;
	if (password.length < 6) {
		alert("password must be longer than 6 characters")
		//must delete current input value
	}
	else if (password.length > 20) {
		alert("password must be lesser than 20 characters")
		//must delete current input value
	}

	else if (confpass == "") {
		alert("please confirm your password")
	}
	else if (confpass != password) {
		alert("please match your password and confirm password")
	}
	else {
		byId("regForm").submit();
	}
		
	
}
function loginUser() {
	var username = byId("username").value;
	var password = byId("password").value;
	if (username == "") {
			alert("username is empty")
	}
	else if (password == "") {
			alert("password is empty")
	}
	else{
		byId("logForm").submit();
	}
}
function byId(id){
	return document.getElementById(id);
}



