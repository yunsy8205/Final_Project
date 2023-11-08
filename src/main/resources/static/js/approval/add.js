
let check=false;
let lineCheck=false;


$("#approvalBtn").click(function(){
	if($("#title").val().length!=0&&$("#leaveSelect").val().length!=0&&$("#startDate").val().length!=0&&
	$("#endDate").val().length!=0&&$("#contents").val().length!=0){
		check=true;
	}else{
		alert("빈칸을 채워주세요.")
	}
	if($("#middleName").text().length!=0&&$("#lastName").text().length!=0){
		lineCheck=true;
	}else{
		alert("결재선을 선택해주세요.")
	}
	if(check==true&&lineCheck==true){
		$("#addForm").submit()
	}
})


function click_add(){
	let url = "line";
	let name = "line";
	let option="width = 600, height = 600, left = 100, top=50,location=no";
	window.open(url,name,option)
}
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
$("#tempBtn").click(function(){
	$("#addForm").attr("action","tempAdd")
	if(formatDate($("#startDate").val())=='NaN-NaN-NaN'){
		$("#startDate").val(formatDate('2023-01-01'))
	}
	if(formatDate($("#endDate").val())=='NaN-NaN-NaN'){
		$("#endDate").val(formatDate('2023-01-01'))
	}
	
	$("#addForm").submit();
})





function dateDiff(start_date, end_date) {
    let dateDiff =
    (new Date(end_date).getTime() - new Date(start_date).getTime())
    / (1000 * 60 * 60 * 24);
    return dateDiff;
}


$("#leaveSelect").change(function(){
	if($("#leaveSelect").val()=='연차'){
		$("#endDate").change(function(){
			if($("#leaveSelect").val()=='연차'){
			$("#useDate").val(dateDiff($("#startDate").val(),$("#endDate").val())+1)
			}
		})
		if($("#annualRow").length==0){
			$("#leaveReasonRow").before('<tr id="annualRow"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 연차일수</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"><input type="text" id="useDate" name="useDate" readonly></td> </tr>')
		}
		$("#offKind").remove()
		
	}
	if($("#leaveSelect").val()=='반차'){
		$("#useDate").val("0.5")
		if($("#annualRow").length==0){
			$("#leaveReasonRow").before('<tr id="annualRow"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 연차일수</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"><input type="text" id="useDate" name="useDate" readonly></td> </tr>')
		}
		if($("#offKind").length==0){
			$("#regDateRow").after('<tr id="offKind"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 반차종류</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"><input type="radio" id="off"name="halfKind" value="오전">오전<input type="radio" id="off"name="halfKind" value="오후">오후</td> </tr>')
		
		}
		
	}
		
	if($("#leaveSelect").val()=='병가'||$("#leaveSelect").val()=='기타'){
		$("#annualRow").remove()
		$("#offKind").remove()
	}
	
	
})

