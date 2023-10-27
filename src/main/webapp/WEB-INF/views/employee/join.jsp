<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/css.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/topScript.jsp"></c:import>
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
<div id="wrap">
      <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
      <div id="right">
        <header>
          <div class="header_wrap">
            <div class="header_message">
              <!-- 로그인 성공 시, 사용자 이름 가져오기 -->
            	<sec:authorize access="isAuthenticated()">
            		<sec:authentication property="Principal" var="VO"/>
            		<p>
            			<spring:message code="login.welcome.name" arguments="${VO.name}"></spring:message>
            		</p>
            	</sec:authorize>
            </div>
            <div class="header_navi">
              <a href="#">조직도</a>
              <sec:authorize access="!isAuthenticated()">
                <a href="/employee/login">로그인</a>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
                <a href="/employee/logout">로그아웃</a>
                <a href="#">마이페이지</a>
              </sec:authorize>
            </div>
          </div>
        </header>
        <!-- main내용  -->
        <section id="mainContents"> 
          <h1 class="emp_title">직원 인적사항</h1>
          <form:form modelAttribute="employeeVO" method="post" enctype="multipart/form-data">
            <div class="proFile">
              <input type="file" name="photo" id="photo">
            </div>
            <div class="proContent">
              <div class="proLeft">
                <div class="prodiv">
                  <form:label path="name">이름</form:label>
                  <form:input path="name" id="name" cssClass="input_con"></form:input>
                </div>
                <div class="prodiv">
                  <form:label path="phone">전화번호</form:label>
                  <form:input path="phone" id="phone" cssClass="input_con"></form:input>
                </div>
                <div class="prodiv">
                  <form:label path="address">주소</form:label>
                  <form:input path="address" id="adr_postNum" cssClass="input_con" placeholder="우편번호"></form:input>
                  <button type="button" id="addressBtn">우편번호 찾기</button>
                  <form:input path="address" id="adr_address" placeholder="주소"></form:input>
                  <form:input path="address" id="adr_detail" placeholder="상세주소"></form:input>
                </div>
                <div class="prodiv">
                  <form:label path="birth">생년월일</form:label>
                  <form:input type="date" path="birth" id="birth" cssClass="input_con"></form:input>
                </div>
              </div>
              <div class="proRight">
                <div class="prodiv">
                  <form:label path="joinDate">입사일</form:label>
                  <form:input path="joinDate" id="joinDate" cssClass="input_con" value="0518"></form:input>
                </div>
                <div class="prodiv">
                  <label for="gender">성별</label>
                  <input type="radio" id="gender_M" name="gender" value="M" checked>남
                  <input type="radio" id="gender_W" name="gender" value="W">여
                </div>
                <div class="prodiv">
                  <label for="state">직원상태</label>
                  <input type="radio" name="state" id="state" cssClass="input_con" value="재직" checked>재직</input>
                </div>
                <div class="prodiv">
                  <select name="position" id="position">직급
                    <option value="CEO">대표</option>
                    <option value="GENERAL">총괄 매니저</option>
                    <option value="CUSTOMER">고객관리 매니저</option>
                    <option value="RESOURCES">인사 매니저</option>
                    <option value="FACILITY">시설 매니저</option>
                    <option value="TRAINER">트레이너</option>
                    <option value="EX">가발령</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="proBtn">
              <button type="submit">이전</button>
              <button type="submit">등록</button>
            </div>
          </form:form>
        </section>
      </div>
    </div>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/join.js"></script>
<script>
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
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
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
</script>
</html>