// 성별 checked
let gVal = document.getElementById("genderVal");
const gM = document.getElementById("gender_M");
const gW = document.getElementById("gender_W");

if(gVal.value == 'M'){
    gM.checked = true;
}else{
    gW.checked = true;
}

gM.addEventListener("change", function() {
    if (gM.checked) {
        gVal.value = gM.value;
    }
});
gW.addEventListener("change", function() {
    if (gW.checked) {
        gVal.value = gW.value;
    }
});


// 상태 checked
const sVal = document.getElementById("state");
const sIn = document.getElementById("state_in");
const sOut = document.getElementById("state_out");

if(sVal.value == '재직'){
    sIn.checked = true;
}else{
    sOut.checked = true;
}

sIn.addEventListener("change", function(){
    if(sIn.checked){
        sVal.value = sIn.value;
    }
})
sOut.addEventListener("change", function(){
    if(sOut.checked){
        sVal.value = sOut.value;
    }
})



// 상태에서 퇴직 눌렀을 경우, 퇴사일 적용 + 퇴직 checked
const qDate = document.getElementById("quitDate");

sOut.addEventListener("change",function(){
    if(sOut.checked){
        let today = new Date();
    
        // => 년월일 나눠서 넣기
        let year = today.getFullYear();
        // 월은 0부터 시작해서 1월(0), 2월(1) 이기에 +1
        let month = (today.getMonth() + 1).toString().padStart(2, '0'); 
        let day = today.getDate().toString().padStart(2, '0');
    
        const join = year + '-' + month + '-' + day;
    
        qDate.value = join;
        console.log("퇴사일 값 : ", join);
        //console.log("현재퇴사일 값 : ", qDate.value);
    
        sVal.value = '퇴직';
    }
})
sIn.addEventListener("change",function(){
    if(sIn.checked){
        //qDate.value = '';
        //console.log("현재퇴사일 값 : ", qDate.value);
        qDate.value = '';
        sVal.value = '재직';
    }
})



// 직급 
const position = document.getElementById("position").value;
const pInner = document.getElementsByClassName("position_inner");


for(let i=0;i<pInner.length;i++){
    if(position == 'ROLE_CEO'){
        pInner[i].innerHTML = '대표';
    }else if(position == 'ROLE_GENERAL'){
        pInner[i].innerHTML = '총괄 매니저'
    }else if(position == 'ROLE_CUSTOMER'){
        pInner[i].innerHTML = '고객관리 매니저'
    }else if(position == 'ROLE_RESOURCES'){
        pInner[i].innerHTML = '인사 매니저'
    }else if(position == 'ROLE_FACILITY'){
        pInner[i].innerHTML = '시설 매니저'
    }else if(position == 'ROLE_TRAINER'){
        pInner[i].innerHTML = '트레이너 매니저'
    }else{
        pInner[i].innerHTML = '가발령 매니저'
    }
}