$("#leaveBtn").click(function(){
	
})
$(document).ready(function() {
  $('#summernote').summernote({
	  placeholder: '내용을 작성하세요',
            height: 300,
            maxHeight: 400
  });
  
});

let count=0;
let count1=0;


$("#leaveSelect").change(function(){
	if($("#leaveSelect").val()=='연차'&&count==0){
		$("#leaveReasonRow").before('<tr id="annualRow"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 연차일수</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"></td> </tr>')
		count=1;
	}
	if($("#leaveSelect").val()=='반차'&&count1==0){
		if(count==0){
			$("#leaveReasonRow").before('<tr id="annualRow"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 연차일수</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"></td> </tr>')
			count=1;
		}
		$("#regDateRow").after('<tr id="offKind"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> 반차종류</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3"></td> </tr>')
		count1=1;
	}else{
		$("#offKind").remove()
		count1=0;
	}
	if($("#leaveSelect").val()=='병가'||$("#leaveSelect").val()=='기타'){
		$("#annualRow").remove()
		count=0;
	}
		
	
	
	
	
	
	
	
})
