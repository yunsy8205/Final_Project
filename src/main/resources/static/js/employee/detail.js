






// 이전 페이지
const backBtn = document.getElementById("backBtn")
const r = document.referrer; // 이전 url 확인

backBtn.addEventListener("click", function() {
    window.location.href="/employee/list";
});


// 수정 btn
const btn = document.getElementsByClassName("actionBtn");
const frm = document.getElementById("detailfrm");

for(b of btn){
    b.addEventListener("click",function(){
        let url = this.getAttribute("data-url");
        let check = confirm("정말로 수정하시겠습니까?");

        if(url == "/employee/update"){
            this.check;
            frm.action=url;
            frm.submit();
        }
    })
}



// 삭제 btn