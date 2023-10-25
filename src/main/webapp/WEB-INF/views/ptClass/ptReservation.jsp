<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- bootstrap 4 -->
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>






<c:import url="/WEB-INF/views/layout/css.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/topScript.jsp"></c:import>
<link rel="stylesheet" href="/css/main.css" />

    <script src='/fullcalendar-6.1.9/fullcalendar-6.1.9/dist/index.global.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      lang: 'ko',
      
      select: function(arg) {
        var title = prompt('Event Title:');
        


        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end
            
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true
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
        <section id="mainContents"> 
        	<div id="calendar"></div>
        </section>
        
      </div>
    </div>
    
    <!-- insertModal -->
  <div class="modal fade insertModal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">일정 등록</h4>
          <button type="button" class="close" onclick="initModal('insertModal', g_arg)">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="form-group empl_nm">
			<label for="empl_nm">보고자:</label>
			<input type="textbox" class="form-control" placeholder="" id="empl_nm" readonly="readonly">
		  </div>
		  <br>
          <div class="form-group">
			<label for="title">일정내용:</label>
			<input type="textbox" class="form-control" placeholder="" id="title">
		  </div>
		  <div class="form-group">
			<label for="start">시작시간:</label>
			<select class="form-control" id="start" onchange="startChange()">
				<option value="09:00">09:00</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
			</select>
		  </div>
		   <div class="form-group">
			<label for="end">종료시간:</label>
			<select class="form-control" id="end">
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
				<option value="19:00">19:00</option>
			</select>
		  </div>
		  <div class="form-group">
			  <label for="allDay">종일여부:</label>
			  <div class="form-check">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" value="true" name="allDay">예
				</label>
			  </div>
		
			  <div class="form-check">
				<label class="form-check-label">
					<input type="radio" checked="checked" class="form-check-input" value="false" name="allDay">아니오
				</label>
			  </div>
			</div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
		  <button type="button" class="btn btn-success approvalBtn" onclick="approvalSch('insertModal',g_arg)">승인</button>
		  <button type="button" class="btn btn-danger rejectBtn" onclick="rejectSch('insertModal', g_arg)">반려</button>
		  
		  <button type="button" class="btn btn-dark  float-right deleteBtn" onclick="deleteSch('insertModal', g_arg)">삭제</button>
		  <button type="button" class="btn btn-warning float-right insertBtn" onclick="insertSch('insertModal', g_arg)">등록</button>
        </div>
        
      </div>
    </div>
  </div>


    
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
</html>