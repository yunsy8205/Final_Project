<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
        	
        </section>
        
      </div>
    </div>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>

</html>