// file 삭제 및 정보 upload
const delFile = document.getElementById("delFile");

delFile.addEventListener("click", function(){
    let num = this.getAttribute("data-delete-file");
    let check = confirm("정말로 삭제하시겠습니까?");

    if(check){
        fetch("/employee/infoFileDelete?employeeNum="+num, {method : "get"})
            .then((result)=>{return result.text()})
            .then((r)=>{
                if(r.trim()=='1'){
                    this.previousSibling.remove();
                    this.remove();
                }
            })
    }

})