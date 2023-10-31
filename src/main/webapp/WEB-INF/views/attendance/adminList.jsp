<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    h3 {
      margin-top: 40px !important;
      text-align: center;
    }
    #req_btn {
      text-align: right;
      margin: 30px;
    }
   
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
                <h3>근태 수정 요청 목록</h3>

				        <div class="card">
                  <div id="req_list" class="table-responsive text-nowrap">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>작성자</th>
                          <th>작성일</th>
                          <th>근태수정요청일</th>
                          <th>상태</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${list}" var="vo" varStatus="i">
                          <tr>
                            <td><a href="./detail?attendanceModifyNum=${vo.attendanceModifyVO.attendanceModifyNum}">${i.index+1}</a></td>
                            <td>${vo.employeeVO.name}</td>
                            <td>${vo.attendanceModifyVO.regDate}</td>
                            <td>${vo.attendanceModifyVO.modifyDate}</td>
                            <td>${vo.attendanceModifyVO.status}</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
                         

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


</body>
</html>