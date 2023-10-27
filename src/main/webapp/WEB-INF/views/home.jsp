<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./layout/css.jsp"></c:import>
<c:import url="./layout/topScript.jsp"></c:import>
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
            		<sec:authentication property="principal" var="employeeVO"/>
            		<p>
            			<spring:message code="login.welcome.name" arguments="${employeeVO.name}"></spring:message>
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
        <div style="background-color: rgb(183, 234, 234); height: 100%">
          <div class="main_wrap">
            <div class="main_top">
              <div class="main_member">멤버정보자리</div>
              <div class="main_notice">공지 자리</div>
              <div class="main_calendar">달력자리</div>
            </div>
            <div class="main_bottom">
              <div class="main_schedule">스케줄자리</div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
<c:import url="./layout/btmScript.jsp"></c:import>
</html>