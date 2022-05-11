//controller
$(document).ready(function()
{
 $("#alertSuccess").hide();
 $("#alertError").hide();
 $("#alertSuccessfind").hide();
 $("#alertErrorfind").hide();
}); 

$(document).on("click", "#btnfind", function(event)
{
	$("#alertSuccessfind").text("");
	$("#alertSuccessfind").hide();
	$("#alertErrorfind").text("");
	$("#alertErrorfind").hide();
	
	// Form validation-------------------
	var status = validateBasicInterrutionForm();    // need to edit
	// If not valid
	if (status != true)
	{	
 		$("#alertErrorfind").text(status);
 		$("#alertErrorfind").show();
		return;
	}	
	// If valid-----------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
	$.ajax(
	{
	url : "FundAPI",
	type : type,
	data : $("#formItem").serialize(),
	dataType : "text",
	complete : function(response, status)
	{
	onItemSaveComplete(response.responseText, status);
	}
	});	
	
 	/*// Generate the card and append 
	var interruptions = getInterruptionsCard($("#InterruptinArea").val().trim(),
 	$("#InterruptionDate").val(),
 	$("#InterruptionStartTime").val(),$("#InterruptionEndTime").val());
 	$("#colInterruption").append(interruptions);

 	$("#alertSuccess").text("Saved successfully.");
 	$("#alertSuccess").show();

 	$("#formStudent")[0].reset();
	*/
});

$(document).on("click", "#btnSave", function(event)
{
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateItemForm();    // need to edit
	// If not valid
	if (status != true)
	{	
 		$("#alertError").text(status);
 		$("#alertError").show();
		return;
	}	
	// If valid-----------------------
	
	
	
 	// Generate the card and append
	var interruptions = getInterruptionsCard($("#InterruptinArea").val().trim(),
 	$("#InterruptionDate").val(),
 	$("#InterruptionStartTime").val(),$("#InterruptionEndTime").val());
 	$("#colInterruption").append(interruptions);

 	$("#alertSuccess").text("Saved successfully.");
 	$("#alertSuccess").show();
 	
 	$ajax
 	

 	$("#formStudent")[0].reset();
	
});

$(document).on("click", ".remove", function(event)
{
	$(this).closest(".student").remove();
	$("#alertSuccess").text("Removed successfully.");
	$("#alertSuccess").show();
});


//client model
function validateBasicInterrutionForm()
{
 	// NAME
	if ($("#InterruptinArea").val().trim() == "")
	{
		return "Select A Area";
	}
	
	
	// date
	if ($("#InterruptionDate").val()=="")
	{
		return "Select a date";
	}
	
	

 	return true;
}

function validateInterrutionForm()
{
 	// NAME
	if ($("#InterruptinArea").val().trim() == "")
	{
		return "Select A Area";
	}
	
	
	// date
	if ($("#InterruptionDate").val()=="")
	{
		return "Select a date";
	}
	
	// start time
	if ($("#InterruptionStartTime").val()=="")
	{
		return "Select a Start time";
	}
	
	// end time
	if ($("#InterruptionEndTime").val()=="")
	{
		return "Select a end time";
	}



 	return true;
}

function getInterruptionsCard(area, date, startTime,endTime)
{	
	var student = "";
	student += "<div class=\"interruption card bg-light m-2\" style=\"max-width: 10rem;float: left;\">";
	student += "<div class=\"card-body\">";
	student +=  area + ",";
	student += "<br>";
	student +=  date + ",";
	student += "<br>";
	student +=  startTime + " to ";
	student += "<br>";
	student += endTime;
	student += "</div>";
	student += "<input type=\"button\" value=\"Remove\"class=\"btn btn-danger remove\">";
	student += "</div>";


 	
 	
	return student;
}



