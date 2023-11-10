<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
<head>
  <style>
    .attendance {display: flex;}
    .attendance #my {
      width:calc(100% - 75%);
      background-color: rgba(105, 108, 255, 0.16);
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
    .btn-primary {
      margin-top: 30px;
      margin-bottom: 15px;
      text-align: center;
      width:100%;
      display: inline-block;
    }
    ul {
      list-style-type: none;
    }
    .list {
      line-height: 2;
      text-align: left;
    }
    #smallModal {
      display: none;
    }
    .btn_block {
      text-align: center;
    }
    .btn-primary {
      width: 70%;
    }
    
  </style>

  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>

  <!-- moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
	<!-- fullcalendar bundle -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.9/index.global.min.js'></script>
	<!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@6.1.9/index.global.min.js'></script>

</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
		      <!-- sidebar -->
          <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
          <!-- Layout container -->
          <div class="layout-page">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y attendance">
              
                <!-- Modal -->
                <div class="modal fade" id="smallModal" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="workDate"></h5>
                        <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <p id="date">
                              
                            </p>
                          </div>
                          <div class="col mb-3">
                            <p id="state">
                              
                            </p>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col mb-3">
                            <p id="on">
                              
                            </p>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col mb-3">
                            <p id="off">
                               
                            </p>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary close" data-bs-dismiss="modal">
                          확인
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

                <div id="my">
                  <div class="profile">
                    <img class="rounded-circle" src="/file/employee/${vo.employeeVO.proFile}" alt="">
                  </div>
                  <div class="name">
                    ${vo.employeeVO.name}
                  </div>
                  <div class="time">
                   <ul>
                      <li class="list">
                        출근시간 <c:if test="${not empty vo.onTime}"> - ${vo.onTime} </c:if>
                      </li>
                      <li class="list">
                      	퇴근시간 <c:if test="${not empty vo.offTime}"> - ${vo.offTime} </c:if>
                      </li>
                      <br>
                      <li class="list">연차개수 - ${vo.employeeVO.leaveDate}개</li>
                    </ul>
                  </div>
                  <div class="btn_block">
                    <button class="btn btn-primary">내 정보 수정</button>
                    <button class="btn btn-primary" id="req_btn">근태 수정 요청</button>
                  </div>
                </div>
                <div id="calendar">
                </div>

              </div>
              <!-- / Content -->  

              <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
          </div>
        <!-- / Layout page -->
      <div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
  

    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>

    <script src="/js/attendance/calendar.js"></script>
  </body>
</html>