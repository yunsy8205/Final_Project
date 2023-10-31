
$("#allBtn").click(function(){
	$("#division").val('all');
	$("#divisionForm").submit();
})

$("#lvBtn").click(function(){
    $("#division").val('휴가신청');
    $("#divisionForm").submit();
})

$("#exBtn").click(function(){
    $("#division").val('지출신청');
    $("#divisionForm").submit();
})

$("#abBtn").click(function(){
    $("#division").val('휴직신청');
    $("#divisionForm").submit();
})