



var toggler = document.getElementsByClassName("caret");
var i;
$("#dddd").click(function(){
   console.log($("#middle").attr("data-empnum"))
    console.log($("#last").attr("data-empnum"))
})
$("#okBtn").click(function(){
    $(opener.document).find("#middleName").text($("#middle").attr("data-name"))
    $(opener.document).find("#lastName").text($("#last").attr("data-name"))
    $(opener.document).find("#middlePosition").text($("#middle").attr("data-position"))
    $(opener.document).find("#lastPosition").text($("#last").attr("data-position"))
    $(opener.document).find("#middle").val($("#middle").attr("data-empnum"))
    $(opener.document).find("#last").val($("#last").attr("data-empnum"))
    window.close();
})

for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested").classList.toggle("active");
    this.classList.toggle("caret-down");
  });
}

    
$("#ceo").click(function(){
     if($("#last").text()==''){
        $("#last").text("최종결재자:"+$("#ceo").text()+"-"+$("#ceo").attr("data-position"));
        $("#last").attr("data-empnum",$("#ceo").attr("data-empnum"))
        $("#last").attr("data-name",$("#ceo").attr("data-name"))
        $("#last").attr("data-position",$("#ceo").attr("data-position"))
    }
})

$("#general").click(function(){
    if($("#last").text()==''){
        $("#last").text("최종결재자:"+$("#general").text()+"-"+$("#general").attr("data-position"));
        $("#last").attr("data-empnum",$("#general").attr("data-empnum"))
        $("#last").attr("data-name",$("#general").attr("data-name"))
        $("#last").attr("data-position",$("#general").attr("data-position"))
    }else{
        if($("#middle").text()==''){
            $("#middle").text("중간결재자:"+$("#general").text()+"-"+$("#general").attr("data-position"));
            $("#middle").attr("data-empnum",$("#general").attr("data-empnum"))
            $("#middle").attr("data-name",$("#general").attr("data-name"))
            $("#middle").attr("data-position",$("#general").attr("data-position"))
        }
    }
})

$("#personnel").click(function(){
    if($("#middle").text()==''){
        $("#middle").text("중간결재자:"+$("#personnel").text()+"-"+$("#personnel").attr("data-position"));
        $("#middle").attr("data-empnum",$("#personnel").attr("data-empnum"))
        $("#middle").attr("data-name",$("#personnel").attr("data-name"))
        $("#middle").attr("data-position",$("#personnel").attr("data-position"))
    }
})

  