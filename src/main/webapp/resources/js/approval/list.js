
$("#allBtn").click(function(){
	$("#division").val('all');
	$("#divisionForm").submit();
})

$("#proceedingBtn").click(function(){
    $("#division").val('proceeding');
    $("#divisionForm").submit();
})

$("#rejectBtn").click(function(){
    $("#division").val('reject');
    $("#divisionForm").submit();
})

$("#completeBtn").click(function(){
    $("#division").val('complete');
    $("#divisionForm").submit();
})

$("#temporaryBtn").click(function(){
	location.href='./temporaryList'
})
