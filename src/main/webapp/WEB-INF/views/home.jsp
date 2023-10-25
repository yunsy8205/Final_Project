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
      <section class="app">
        <aside class="sidebar">
          <nav class="sidebar-nav">
            <ul>
              <li>
                <a href="#"><i class="fa-solid fa-user"></i> <span>직원관리</span></a>
                <ul class="nav-flyout">
                  <li>
                    <a href="#"
                      >전체 직원 목록</a
                    >
                  </li>
                  <!-- <li>
                    <a href="#"><i class="ion-ios-clock-outline"></i>Times</a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="ion-android-star-outline"></i>Hates</a
                    >
                  </li>
                  <li>
                    <a href="#"><i class="ion-heart-broken"></i>Beat</a>
                  </li> -->
                </ul>
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-users"></i>
                  <span class="">회원관리</span></a
                >
                <ul class="nav-flyout">
                  <li>
                    <a href="#">전체 회원 관리</a>
                  </li>
                  <!-- <li>
                    <a href="#"
                      ><i class="ion-ios-camera-outline"></i>Creeper</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      ><i class="ion-ios-chatboxes-outline"></i>Hate</a
                    >
                  </li>
                  <li>
                    <a href="#"><i class="ion-ios-cog-outline"></i>Grinder</a>
                  </li> -->
                </ul>
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-ticket"></i>
                  <span class="">이용권 관리</span></a
                >
                <ul class="nav-flyout">
                  <li>
                    <a href="#">이용권 목록</a>
                  </li>
                  <!-- <li>
                    <a href="#"
                      ><i class="ion-ios-lightbulb-outline"></i>Bulbs</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      ><i class="ion-ios-location-outline"></i>Where You</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      ><i class="ion-ios-locked-outline"></i>On Lock</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      ><i class="ion-ios-navigate-outline"></i>Ghostface</a
                    >
                  </li> -->
                </ul>
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-dumbbell"></i>
                  <span class="">시설관리</span></a
                >
                <ul class="nav-flyout">
                  <li>
                    <a href="#">전체 기구 목록</a>
                  </li>
                  <li>
                    <a href="#"
                      >기구 수리 요청 목록</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      >전체 락커 목록</a
                    >
                  </li>
                 <!--  <li>
                    <a href="#"
                      ><i class="ion-ios-timer-outline"></i>Lookie Look</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      ><i class="ion-ios-game-controller-a-outline"></i>Dork
                      Mfer</a
                    >
                  </li> -->
                </ul>
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-list-check"></i>
                  <span class="">수업관리</span></a
                >
                <ul class="nav-flyout">
                  <li>
                    <a href="#"
                      >수업 조회</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      >회원 조회</a
                    >
                  </li>
                  <!-- <li>
                    <a href="#"
                      ><i class="ion-ios-paperplane-outline"></i>Planes</a
                    >
                  </li>
                  <li>
                    <a href="#"><i class="ion-android-star-outline"></i>Shop</a>
                  </li> -->
                </ul>
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-clipboard-user"></i>
                  <span class="">근태 관리</span></a
                >
                <ul class="nav-flyout">
                  <li>
					<sec:authentication property="Principal" var="user"/>
                    <a href="/attendance/info?employeeNum=${employeeNum}">내 근태 조회</a>
                  </li>
                  <li>
                    <a href="#"
                      >전체 근태 조회</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      >근태 수정 요청 목록</a
                    >
                  </li>
                  <!-- <li> -->
                    <!-- <a href="#"
                      ><i class="ion-ios-locked-outline"></i>On Lock</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      ><i class="ion-ios-navigate-outline"></i>Ghostface</a
                    >
                  </li> -->
                </ul>
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-file"></i>
                  <span class="">결재</span></a
                >
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-plane"></i>
                  <span class="">휴가</span></a
                >
              </li>
              <li>
                <a href="#"
                  ><i class="fa-solid fa-comments"></i>
                  <span class="">채팅</span></a
                >
              </li>
            	<li>
                <a href="#"
                  ><i class="fa-solid fa-circle-user"></i>
                  <span class="">회원</span></a
                >
                <ul class="nav-flyout">
                  <li>
                    <a href="#">운동일지</a>
                  </li>
                  <li>
                    <a href="#"
                      >PT일지</a
                    >
                  </li>
                  <li>
                    <a href="#"
                      >식단관리</a
                    >
                  </li>
          </nav>
        </aside>
      </section>
      <div id="right">
        <header>
          <div class="header_wrap">
            <div class="header_message">

            	<!-- 로그인 성공 시, 사용자 이름 가져오기 -->
            	<sec:authorize access="isAuthenticated()">
            		<sec:authentication property="name" var="employeename"/>
            		<p>
            			<spring:message code="login.welcome.name" arguments="${employeename}"></spring:message>
            		</p>
            	</sec:authorize>

            </div>
            <div class="header_navi">
              <a href="#">조직도</a>
              <a href="/employee/login">로그인</a>
              <a href="#">로그아웃</a>
              <a href="#">마이페이지</a>
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