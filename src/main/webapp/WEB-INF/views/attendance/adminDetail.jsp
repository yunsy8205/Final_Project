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
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
<head>
  <style>
    h3 {
      margin-top: 40px !important;
      text-align: center;
    }
    .modify_Con {
      display:flex; justify-content: space-between;
    }
    .form-control:disabled {
      background-color:#ffffff00 !important;
    }
    .form-check-input, .form-check-label{
      opacity: 1 !important;
    }
    .card {width:40%;}
    #form {width:calc(100% - 40%);}
    .totalBtn {text-align:center;}
  </style>

  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
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
              <div class="container-xxl flex-grow-1 container-p-y">
                <h3>근태 수정 요청안</h3>
                <div class="modify_Con">
                  <div class="card">
                    <div id="req_list" class="table-responsive text-nowrap">
                      <table class="table table-hover">
                        <tr>
                          <th>이름</th>
                          <td>${vo.employeeVO.name}</td>
                        </tr>
                        <tr>
                          <th>작성일</th>
                          <td>${vo.attendanceModifyVO.regDate}</td>
                        </tr>
                        <tr>
                          <th>출근시간</th>
                          <td>${vo.onTime}</td>
                        </tr>
                        <tr>
                          <th>퇴근시간</th>
                          <td>${vo.offTime}</td>
                        </tr>
                        <tr>
                          <th>상태</th>
                          <td>${vo.state}</td>
                        </tr>
                      </table>
                    </div>
                  </div>

                  <div id="form">
                    <form>
                      <div class="row g-3">
                        <div class="col-md-6">
                          <label for="requestDate" class="form-label">수정요청일</label>
                          <input type="date" id="requestDate" name="modifyDate" class="form-control" value="${vo.attendanceModifyVO.modifyDate}" disabled>
                        </div>
                        <div class="col-md-6">
                          <label for="requestTime" class="form-label">수정요청시간</label>
                          <input type="time" id="requestTime" name="modifyTime" class="form-control" value="${vo.attendanceModifyVO.modifyTime}" disabled>
                        </div>
                      </div>
                      <div class="row g-3">
                        <div class="col-md-6">
                          <label for="writer" class="form-label">작성자</label>
                          <input type="text" id="writer" value="${vo.employeeVO.name}" class="form-control" disabled>
                          <input type="hidden" id="num" name="employeeNum" value="${vo.employeeVO.employeeNum}">
                        </div>
                        <div class="col-md-6">
                        <c:set var="radioType" value="${vo.attendanceModifyVO.type}" />
                          <input type="radio" id="on" name="type" value="출근" ${radioType eq '출근' ? 'checked' : ''} class="form-check-input" disabled>
                          <label for="on" class="form-check-label">출근</label>
        
                          <input type="radio" id="off" name="type" value="퇴근" ${radioType eq '퇴근' ? 'checked' : ''} class="form-check-input" disabled>
                          <label for="off" class="form-check-label">퇴근</label>
                        </div>
                      </div>
                      <div class="col-12">
                        <label for="content" class="form-label">요청사유</label>
                        <textarea name="requestContents" id="content" cols="30" rows="5" class="form-control" disabled>${vo.attendanceModifyVO.requestContents}</textarea>
                      </div>
                    </form>
                  </div>
                </div>
                <div>
                  <form id="frm" method="post" action="/admin/attendanceModify/update">
                    <div class="row g-3">
                      <div class="col-md-6">
                        <input type="radio" id="normal" name="state" value="정상" class="form-check-input">
                        <label for="normal" class="form-check-label">정상</label>
        
                        <input type="radio" id="tardy" name="state" value="지각" class="form-check-input">
                        <label for="tardy" class="form-check-label">지각</label>

                        <input type="radio" id="Absenteeism" name="state" value="결근" class="form-check-input">
                        <label for="Absenteeism" class="form-check-label">결근</label>

                        <input type="radio" id="early" name="state" value="조퇴" class="form-check-input">
                        <label for="early" class="form-check-label">조퇴</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <label for="contents" class="form-label">수정의견</label>
                      <textarea name="modifyContents" id="contents" cols="30" rows="5" class="form-control"></textarea>
                    </div>
                    <input type="hidden" name="modifyTime" class="form-control" value="${vo.attendanceModifyVO.modifyTime}">
                    <input type="hidden" name="attendanceNum" value="${vo.attendanceNum}">
                    <input type="hidden" name="attendanceModifyNum" value="${vo.attendanceModifyVO.attendanceModifyNum}">
                    <input type="hidden" id="status" name="status">
                    <input type="hidden" name="type" value="${vo.attendanceModifyVO.type}">
                  </form>
                </div>
                <div class="totalBtn">
                  <button type="button" id="before_btn" class="btn btn-primary">이전</button>
                  <button type="button" id="approve_btn" class="btn btn-primary">승인</button>
                  <button type="button" id="reject_btn" class="btn btn-primary">반려</button>
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

    <script>
      $('#before_btn').on('click', function(){
        $(location).attr('href', '/admin/attendanceModify/list');
      })

      $('#approve_btn').on('click', function(){
        $('#status').val('승인');
        $('#frm').submit();
      })

      $('#reject_btn').on('click', function(){
        $('#status').val('반려');
        $('#frm').submit();
      })
    </script>
  </body>
</html>
