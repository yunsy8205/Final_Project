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
    .attendance {display: flex;}
    .attendance #my {
      width:calc(100% - 75%);
      background-color: rgb(189, 194, 255);
      margin-right: 50px;
    }
    .attendance #calendar {width:75%;}
    .fc .fc-toolbar.fc-header-toolbar {
    	margin-top: 2.5em;
    }
    .profile {
      text-align: center;
      margin-top: 40px;
      margin-bottom: 20px;
    }
    .rounded-circle {
      width: 140px;
      border-radius: 50%;
    }
    .name {
      text-align: center;
    }
    .time {
      margin-top: 30px;
      margin-bottom: 30px;
      text-align: center;
    }
    .attendance_btn {
      margin-top: 30px;
      margin-bottom: 15px;
      text-align: center;
      width:100%;
      display: inline-block;
    }
    .list {
      line-height: 2;
    }
  </style>
	<c:import url="/WEB-INF/views/layout/css.jsp"></c:import>
	<c:import url="/WEB-INF/views/layout/topScript.jsp"></c:import>
	<link rel="stylesheet" href="/css/main.css" />
	
	<!-- moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
	<!-- fullcalendar bundle -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.9/index.global.min.js'></script>
	<!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@6.1.9/index.global.min.js'></script>
	<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
       	  headerToolbar: {
       	      start: '',
       	      center: 'title',
       	      end: 'today prev,next'
       	    },
       	  titleFormat: 'YYYY년 M월',
          height: '90%',
         // contentHeight: 'auto',
          fixedWeekCount: false
        });
        calendar.render();
      });
  </script>
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
        <section id="mainContents" class="attendance"> 
        	<div id="my">
            <div class="profile">
              <img class="rounded-circle" src="/img/1.jpg" alt="">
            </div>
            <div class="name">
              ${vo.name}
            </div>
            <div class="time">
              <ul>
                <li class="list">출근시간 - 
                  <c:forEach items="${vo.list}" var="l">
		                ${l.onTime}
	                </c:forEach>
                </li>
                <li class="list">퇴근시간 - 
                  <c:forEach items="${vo.list}" var="l">
		                ${l.offTime}
	                </c:forEach>
                </li>
                <br>
                <li class="list">연차개수 - ${vo.leaveDate}개</li>
              </ul>
            </div>
            <button class="attendance_btn" >내 정보 수정</button>
            <button class="attendance_btn" id="req_btn">근태 수정 요청</button>
          </div>
        	<div id="calendar">
          </div>
        </section>
        
      </div>
    </div>

    <script>
      const req_btn = document.getElementById('req_btn');

      req_btn.addEventListener('click', function(){
        location.href = '/attendanceModify/add';
      })
    </script>
</body>
</html>