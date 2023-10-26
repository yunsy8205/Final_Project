<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    #mainContents > h1 {
      margin-top: 2.5em;
      text-align: center;
    }
  </style>

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
              <p>이재혁 님 환영합니다</p>
            </div>
            <div class="header_navi">
              <a href="#">조직도</a>
              <a href="#">로그인</a>
              <a href="#">로그아웃</a>
              <a href="#">마이페이지</a>
            </div>
          </div>
        </header>
        <!-- main내용  -->
        <section id="mainContents"> 
        	<h1>근태 수정 요청서</h1>

          <form method="post" action="/attendanceModify/add">
            <label for="requestDate">수정요청일</label>
            <input type="date" id="requestDate" name="modifyDate">

            <label for="requestTime">수정요청시간</label>
            <input type="time" id="requestTime" name="modifyTime">
            <br>
            <label for="writer">작성자</label>
            <sec:authentication property="Principal" var="user"/>
              <input type="text" id="writer" value="${user.name}" readonly>
              <input type="hidden" name="employeeNum" value="${user.employeeNum}">
            <input type="radio" id="on" name="type">
            <label for="on">출근</label>

            <input type="radio" id="off" name="type">
            <label for="off">퇴근</label>
            <br>
            <label for="content">요청사유</label>
            <br>
            <textarea name="reason" id="requestContents" cols="30" rows="10"></textarea>
            <br>
            <button>제출</button>
          </form>
        </section>
        
      </div>
    </div>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
<script>
  $('#on').on('click', function(){
    $('#requestTime').attr('name', 'onTime');
  })

  $('#off').on('click', function(){
    $('#requestTime').attr('name', 'offTime');
  })
</script>

</html>