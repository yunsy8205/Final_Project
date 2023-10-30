// 주소
$('#addressBtn').click(function(){
    adr();
})

function adr() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                a = extraAddr;
            
            } else {
                a = '';
            }

            // console.log("참고항목 : "+a)
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('adr_postNum').value = data.zonecode;
            document.getElementById("adr_address").value = addr + a;
            // 커서를 상세주소 필드로 이동한다.
            checks[2]=true;
            document.getElementById("adr_detail").focus();
        }
    }).open();
}



// 입사일
$(document).ready(function() {
    let today = new Date();

    // => 년월일 나눠서 넣기
    let year = today.getFullYear();
    // 월은 0부터 시작해서 1월(0), 2월(1) 이기에 +1
    let month = (today.getMonth() + 1).toString().padStart(2, '0'); 
    let day = today.getDate().toString().padStart(2, '0');

    const join = year + '-' + month + '-' + day;

    $("#joinDate").val(join);
});



// form 전체 입력
const frm = document.getElementById("frm");
const nameI = document.getElementById("name");
const phone = document.getElementById("phone");
const address = document.getElementById("adr_address");
const birth = document.getElementById("birth");
const nMsg = document.getElementById("nameMsg");
const pMsg = document.getElementById("phoneMsg");
const aMsg = document.getElementById("addressMsg");
const bMsg = document.getElementById("birthMsg");
const addBtn = document.getElementById("addBtn");
let phoneCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
let birthCheck = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
let checks = [false, false, false, false];

// nameI.addEventListener("blur",function(){
//     nMsg.innerHTML="";
//     if(nameI.value == ''){
//         nMsg.innerHTML = '이름을 입력해주세요.';
//         nMsg.className = 'f';
//     } else {
//         checks[0]=true;
//     }
// })
// phone.addEventListener("blur",function(){
//     pMsg.innerHTML="";
//     if(phone.value == ''){
//         pMsg.innerHTML="전화번호를 입력해주세요.";
//         pMsg.className = 'f';
//     }else if(!phoneCheck.test(phone.value)){
//         pMsg.innerHTML="정확한 전화번호를 다시 입력해주세요.";
//         pMsg.className = 'f';
//     }else{
//         checks[1]=true;
//     }
// })
// address.addEventListener("blur",function(){
//     aMsg.innerHTML="";
//     if(address.value=""){
//         aMsg.innerHTML="주소를 입력해주세요.";
//         aMsg.className="f";
//     }
// })
// birth.addEventListener("blur",function(){
//     bMsg.innerHTML="";
//     if(birth.value==""){
//         bMsg.innerHTML="생년월일을 입력해주세요."
//         bMsg.className="f";
//     }else if(!birthCheck.test(birth.value)){
//         bMsg.innerHTML="정확한 생년월일을 다시 입력해주세요."
//         bMsg.className="f";
//     }else{
//         const birthDate = new Date(birth.value);
//         const today = new Date();
//         if(birthDate > today){
//             bMsg.innerHTML="미래의 날짜는 입력할 수 없습니다.";
//             bMsg.className="f";
//         }else{
//             checks[3]=true;
//         }
//     }
// })

// addBtn.addEventListener("click", function(){
//     let allCheck = checks.includes(false);
//     if(!allCheck){
//         frm.submit();
//         location.href="/employee/list";
//     }else{
//         for(let i = 0; i < checks.length; i++){
//             if(checks[i] == false){
//                 alert("모든 항목은 필수 입력입니다.");
//                 console.log("false : "+checks[i]);
//                 return;
//             }
//         }
//     }
// })


// 이전 페이지
const backBtn = document.getElementById("backBtn")
const r = document.referrer; // 이전 url 확인

backBtn.addEventListener("click", function() {
    window.location.href="/employee/list";
});

