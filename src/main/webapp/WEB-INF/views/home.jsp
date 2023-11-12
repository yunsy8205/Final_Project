<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
  	
    <style>
      #off {
        display: none;
      }
      .row {
	    height: 450px;
	  }
	  #notice{
	  	display: flex;
	  }
	  #plus {
	    flex: 0 0 auto;
	    width: 3%;
	    font-size: 25px;
	  }
	  #ntitle {
	    flex: 0 0 auto;
	    width: 94%;
	  	margin: auto;
	  }
	  #hr1{
	  	background-color: #696cff;
	  }
	  .b1{
		  height: 40%;
		  text-align: center;
	  }
	  .b2{
	  	height: 25%;
	  	text-align: center;
	  }
	  .b3{
	  	height: 20%;
	  	text-align: center;
	  }
	  .b4{text-align: center;}
	  .tTitle{padding-right: 10px;}
	  .a1{
	  	color: #697a8d;
	  }
	  #fc-dom-1{
	  	font-size: 17px;
	  }
	  .chartBox{
	  	width: 100%;
	  	height: 100%;
	  }
	  .chart1{
	  	width: 100%;
	  	height: 90%;
	  }
	  
    </style>
	<!-- moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
	<!-- fullcalendar bundle -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.9/index.global.min.js'></script>
	<!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@6.1.9/index.global.min.js'></script>
	<!-- chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
  </head>
  <script type="text/javascript">

//full calendar
document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');

    const calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth', 
    headerToolbar: {
        left: '',
        center: 'title',
        right: '' 
    },
    titleFormat: 'YYYY년 M월',
    height: '100%',
    fixedWeekCount: false,
    events: '/attendance/month',

  
    });
    //캘린더 그리기
    calendar.render();
});
  </script>
  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
      <!-- sidebar -->
        <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
      <!-- /sidebar -->
        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
             
              <div class="row mb-3 r1">
                <div class="col-md-6 col-lg-4 mb-3" style="width: 22%;">
                  <div class="card h-100">
                    <div class="card-body box1">
                      <div class="border b1">
                      <!-- 이미지 이름 직책 -->
                      <sec:authentication property="principal" var="user"/>	
                      <h5 class="card-title" id="user" data-num="${user.employeeNum}">
	                      ${user.name}
	                      ${user.position}
	                  </h5>
                      </div>
                      <div class="border b2">
                      <!-- 출근시간 퇴근시간 -->
                      <div><strong class="tTitle">출근시간 </strong><span id="onTime"></span></div>
                      <div><strong class="tTitle">퇴근시간 </strong><span id="offTime"></span></div>
                      </div>
                      <div class="border b3">
                      <!-- 디지털 시계 -->
                      <div class="clock">
					    <h1 id="time" class="time"></h1>
					  </div>
                      </div>
	                  <div id="btn_block" class="border b4">
               		  <button type="button" id="on" class="btn btn-primary">출근하기</button>
                	  <button type="button" id="off" class="btn btn-primary">퇴근하기</button>
              		  </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3" style="width: 50%;">
                  <div class="card h-100">
                    <div class="card-body">
                      <div id="notice"><h5 id="ntitle" class="card-title">최근 공지</h5><a id="plus" href="/notice/list">+</a></div>
	                  <hr id="hr1">
	                  <div class="table-responsive text-nowrap">
							<table class="table table-hover">
								<tbody class="table-border-bottom-0">
									<c:forEach items="${list}" var="n">
										<tr>
											<td><span class="badge bg-label-primary me-1">${n.category}</span>
												<a class="a1" href="./notice/detail?noticeNum=${n.noticeNum}">${n.title}</a></td>
											<td>${n.name}</td>
											<td>${n.modDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					   </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3" style="width: 28%;">
                  <div class="card h-100">
                    <div class="card-body calendarBox">
                      <div id="calendar"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mb-5 r2">
                <div class="col-md-6 col-lg-4 mb-3" style="width: 50%;">
                  <div class="card h-100">
                    <div class="card-body chartBox" >
                    	<div style="width: 100%; height: 10%;">
                    		<h5>총 회원 현황</h5>
                    	</div>
                    	<div class="chart1">
	                    	<canvas id="myChart" width="582.5vw" height="330vh"></canvas>
                    	</div>
                    	<div>
                    		<c:forEach items="${chart}" var="c">
                    		<div id="${c.month}" data-member="${c.member}"></div>
                    		</c:forEach>
                    	</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3" style="width: 50%;">
                  <div class="card h-100">
                    <div class="card-body">
                      <div id="notice"><h5 id="ntitle" class="card-title">결재</h5><a id="plus" href="#">+</a></div>
	                  <hr id="hr1">
	                  <div class="table-responsive text-nowrap">
							<table class="table table-hover">
								<tbody class="table-border-bottom-0">
									<c:forEach items="" var="n">
										<tr>
											<td><span class="badge bg-label-primary me-1">${n.category}</span>
												<a class="a1" href="./notice/detail?noticeNum=${n.noticeNum}">${n.title}</a></td>
											<td>${n.name}</td>
											<td>${n.modDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					   </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>

    <script src="/js/attendance/work.js"></script>
    <script>
    
    // 요소 선택
    const timeDiv = document.getElementById('time');

    // getTime 함수
    function getTime(){
      let now = new Date();
      //let year = now.getFullYear();
      //let month = now.getMonth() + 1; //getMonth는 0부터 시작하기 때문
      //let date = now.getDate();
      let hour = now.getHours();
      let minute = now.getMinutes();
      let second = now.getSeconds();
      
      hour = hour < 10 ? "0"+hour : hour;
      minute = minute < 10 ? "0"+minute : minute;
      second = second < 10 ? "0"+second : second;
    // 위의 각 변수에는 시간 데이터가 숫자로 대입되어 있으나 두 자리 또는 한 자리수로 있어
    // 자릿수를 맞추기 위해 삼항연산식을 사용해 10보다 작은 경우 숫자의 앞에 0을 붙여 두 자릿수를 맞춘다.
   
      timeDiv.innerText = hour+":"+minute+":"+second;
    }

    // setInterval 메소드
    getTime();
    setInterval(getTime, 1000);
    
    	let employeeNum = $('#user').attr("data-num");
    	let workDate = getTodayDate();

    	attendanceTime(employeeNum, workDate);
    	function attendanceTime(employeeNum, workDate){
    		$.ajax({
    			type:"get",
    			url:"./attendanceTime",
    			data:{
    				"employeeNum":employeeNum,
    				"workDate":workDate
    			},
    			success:function(response){
    				if(response.time != null){
	    				if(response.time.offTime != null) {							
		    				$('#offTime').text(response.time.offTime);
	    				
	    				}
	    				if(response.time.onTime != null) {					
	        				$('#onTime').text(response.time.onTime);
	        			}
    				}
    			},
    			error:function(){
    				console.log("ajax 실패");
    			}
    			})
    	}
    	
    	function getTodayDate() {
    	    let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)
    	
    	    let year = today.getFullYear();
    	    let month = ('0' + (today.getMonth() + 1)).slice(-2); 
    	    let day = ('0' + today.getDate()).slice(-2);
    		
    	    let dateString = year + '-' + month + '-' + day; 
    		
    		console.log(dateString);

    	    return dateString;
    	}
    	
    	// 차트
    	let jan = Number($('#01').attr("data-member"));
    	let feb = Number($('#02').attr("data-member"))+jan;
    	let mar = Number($('#03').attr("data-member"))+feb;
    	let apr = Number($('#04').attr("data-member"))+mar;    		
    	console.log(mar);
    	console.log(apr);
    	let may = Number($('#05').attr("data-member"))+apr;
    	let jun = Number($('#06').attr("data-member"))+may;
    	let jul = Number($('#07').attr("data-member"))+jun;
    	let aug = Number($('#08').attr("data-member"))+jul;
    	let sep = Number($('#09').attr("data-member"))+aug;
    	let oct = Number($('#10').attr("data-member"))+sep;
    	let nov = Number($('#11').attr("data-member"))+oct;
    	let dec = Number($('#12').attr("data-member"))+nov;
    	
    	let chartData =  [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]
    	//let chartLabels = "[""+  +"]";
    	const ctx = document.getElementById('myChart').getContext('2d');
    	new Chart(ctx, {
    	    type: 'line',
    	    data: {
    	      labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	      datasets: [{
    	        label: '회원수',
    	        data: chartData,
    	        borderWidth: 2,
    	        borderColor: '#696CFF',
    	        backgroundColor: '#F0F0FF',
    	       	fill: true
    	      }]
    	    },
    	    options: {
    	      scales: {
    	        y: {
    	          beginAtZero: true
    	        }
    	      },
    	      elements:{
    	    	  line:{
    	    		  tension: 0.4
    	    	  }
    	      }
    	    }
    	  });
    	
    </script>
  </body>
</html>