$("#okBtn").click(function(){
    $(opener.document).find("#middle").val($("#aname0").text())
    $(opener.document).find("#last").val($("#aname1").text())
    $(opener.document).find("#middlePosition").val($("#aposition0").text())
    $(opener.document).find("#lastPosition").val($("#aposition1").text())
    window.close();
})



$("li").click(function () {
    if ($(this).hasClass("active")) {
      $(this).children().css("display", "none");
      $(this).removeClass();
    } else {
      $(this).addClass("active");
      $(this).children().css("display", "block");
    }
  });

let count=0;
for(let i=0;i<$(".empList").length;i++){
    $("#employee"+i).click(function(){
        if(count==0){
            count++;
        $("#middleRow").append('<td id="aname'+i+'"></td><td id="aposition'+i+'"></td>')
        $("#aname"+i).text($("#employee"+i).attr("data-name"))
        $("#aposition"+i).text($("#employee"+i).attr("data-position"))
        $("#middle").val($("#employee"+i).attr("data-name"))
        }else if(count==1){
            count++;
            $("#lastRow").append('<td id="aname'+i+'"></td><td id="aposition'+i+'"></td>')
            $("#aname"+i).text($("#employee"+i).attr("data-name"))
            $("#aposition"+i).text($("#employee"+i).attr("data-position"))
            $("#last").val($("#employee"+i).attr("data-name"))
        }
    })
}


for(let i=0;i<$(".trainerList").length;i++){
    $("#trainer"+i).click(function(){
        console.log($("#trainer"+i).attr("data-name"))
    })
}
  