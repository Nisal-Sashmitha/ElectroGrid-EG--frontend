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
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	
	$("#alertSuccessfind").text("");
	$("#alertSuccessfind").hide();
	$("#alertErrorfind").text("");
	$("#alertErrorfind").hide();
	
	// Form validation-------------------
	var status = validateBasicInterrutionForm();
	console.log(status)    // need to edit
	// If not valid
	if (status != true)
	{	
 		$("#alertErrorfind").text(status);
 		$("#alertErrorfind").show();
		return;
	}	
	// If valid-----------------------
	
	$.ajax(
	{
	url : "InterruptionAPI",
	type : "GET",
	data : $("#frmFindInterruptions").serialize(),
	dataType : "text",
	complete : function(response, status)
	{
	onItemFindComplete(response.responseText, status);
	}
	});	
	
 
	
});

$(document).on("click", "#btnSave", function(event)
{
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	console.log("In save");
	var status = validateInterrutionForm();    // need to edit
	// If not valid
	if (status != true)
	{	
 		$("#alertError").text(status);
 		$("#alertError").show();
		return;
	}	
	// If valid-----------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
	$.ajax(
	{
	url : "InterruptionAPI",
	type : type,
	data : $("#frmInterruptions").serialize(),
	dataType : "text",
	complete : function(response, status)
	{
	onItemSaveComplete(response.responseText, status);
	}
	});	
	
	
	
});
$(document).on("click", ".btnUpdate", function(event)
{
	
	
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	$("#hidItemIDSave").val($(this).closest("tr").find('td:eq(0)').text());
 	$("#InterruptionDate").val($(this).closest("tr").find('td:eq(1)').text());
 	$("#InterruptionStartTime").val($(this).closest("tr").find('td:eq(2)').text());
 	$("#InterruptionEndTime").val($(this).closest("tr").find('td:eq(3)').text());
 	$("#InterruptinArea").val($(this).closest("tr").find('td:eq(4)').text());
}); 

$(document).on("click", ".btnRemove", function(event)
{
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
 $.ajax(
 {
 url : "InterruptionAPI",
 type : "DELETE",
 data : "itemID=" + $(this).closest("tr").find('td:eq(0)').text(),
 dataType : "text",
 complete : function(response, status)
 {
 onItemDeleteComplete(response.responseText, status);
 }
 });
});




//client model---------------------------------------------------------

function onItemFindComplete(response, status)
{
	if (status == "success")
	{
	var resultSet = JSON.parse(response);
	if (resultSet.status.trim() == "success")
	{
	$("#alertSuccessfind").text("Search finished successfully.");
	$("#alertSuccessfind").show();
	$("#divItemsGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
	$("#alertError").text(resultSet.data);
	$("#alertError").show();
	}
	} else if (status == "error")
	{
	$("#alertError").text("Error while searching.");
	$("#alertError").show();
	} else
	{
	$("#alertError").text("Unknown error while searching..");
	$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#InterruptinAreafind").val($("#InterruptinArea").val());
	$("#InterruptionDatefind").val($("#InterruptionDate").val());
	$("#frmInterruptions")[0].reset();
}

function onItemSaveComplete(response, status)
{
	if (status == "success")
	{
	var resultSet = JSON.parse(response);
	if (resultSet.status.trim() == "success")
	{
	$("#alertSuccess").text("Successfully saved.");
	$("#alertSuccess").show();
	$("#divItemsGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
	$("#alertError").text(resultSet.data);
	$("#alertError").show();
	}
	} else if (status == "error")
	{
	$("#alertError").text("Error while saving.");
	$("#alertError").show();
	} else
	{
	$("#alertError").text("Unknown error while saving..");
	$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#InterruptinAreafind").val($("#InterruptinArea").val());
	$("#InterruptionDatefind").val($("#InterruptionDate").val());
	$("#frmInterruptions")[0].reset();
}

function validateBasicInterrutionForm()
{
 	// area
	if ($("#InterruptinAreafind").val().trim() == "")
	{
		return "Select A Area";
	}
	
	//area numeric check
	if (!$.isNumeric($("#InterruptinArea").val().trim()))
	{
		return "area should ID should be numeric!";
	}
	
	
	// date
	if ($("#InterruptionDatefind").val()=="")
	{
		return "Select a date";
	}
	
	

 	return true;
}

function validateInterrutionForm()
{
 	// areaID
	if ($("#InterruptinArea").val().trim() == "")
	{
		return "Select A Area";
	}
	
	//numeric check
	if (!$.isNumeric($("#InterruptinArea").val().trim()))
	{
		return "area should ID should be numeric!";
	}
	
	// areaid numeric
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
	
	if ($("#InterruptionEndTime").val()< $("#InterruptionStartTime").val())
	{
		return "start time cannot be after the end time";
	}



 	return true;
}

function onItemDeleteComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully deleted.");
 $("#alertSuccess").show();
 $("#divItemsGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while deleting.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while deleting..");
 $("#alertError").show();
 }
}




