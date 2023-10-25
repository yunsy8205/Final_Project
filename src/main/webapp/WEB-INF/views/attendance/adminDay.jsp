<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <style>
    #today_block {
      text-align: center;
      margin-top: 50px;
      margin-bottom: 40px;
    }
    #today {
      font-size: 25px;
      margin-top: 50px;
      margin-left: 20px;
      margin-right: 20px;
    }
    #btn_block {
      margin: 30px;
    }
    #frm {
      display: inline-block;
    }
    #month_btn {
      float: right;
      margin-right: 30px;
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
          <div id="today_block">
            <button><i class="fa-solid fa-caret-left fa-2xl"></i></button>
            <span id="today">

            </span>
            <button><i class="fa-solid fa-caret-right fa-2xl"></i></button>
          </div>
          <div id="btn_block">
            <form id="frm">
              <input type="text" name="search" placeholder="이름을 입력하세요">
              <button>조회</button>
            </form>
            <button id="month_btn">월별 근태 확인</button>
          </div>
          <div id="today_list">
            당일 근태 목록 들어갈 자리
          </div>
        </section>
        
      </div>
    </div>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
<script>
  const options = { year: 'numeric', month: 'long', day: 'numeric' };
  $('#today').html(new Date().toLocaleDateString('ko-KR', options));

</script>
</html>