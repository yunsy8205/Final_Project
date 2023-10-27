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
        	<p></p>
        </section>
      </div>
    </div>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
</html>