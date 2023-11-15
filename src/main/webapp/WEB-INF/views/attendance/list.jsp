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
    .card {
      margin: 30px;
    }
    #pager {
      margin-bottom: 50px;
    }
    .container-xxl {
      margin: 0rem 2.5rem 0 !important;
      max-width: calc(100% - 5.2rem) !important;
      padding: 0 !important;
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
          <div class="layout-page" style="padding-left: 0 !important;">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y">
                <h3>근태 수정 요청 목록</h3>

                <div id="req_btn">
                  <button id="btn" class="btn btn-primary">근태 수정 요청</button>
                </div>
				        <div class="card">
                  <div id="req_list">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>작성자</th>
                          <th>작성일</th>
                          <th>근태수정요청일</th>
                          <th>출/퇴근</th>
                          <th>상태</th>
                          <th>상세</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${list}" var="vo" varStatus="i">
                          <tr>
                            <td>${i.index+1}</td>
                            <td>${vo.employeeVO.name}</td>
                            <td>${vo.attendanceModifyVO.regDate}</td>
                            <td>${vo.attendanceModifyVO.modifyDate}</td>
                            <td>${vo.attendanceModifyVO.type}</td>
                            <td>
                            	<c:if test="${vo.attendanceModifyVO.status eq '승인'}">
                            		<span class="badge bg-label-success me-1">${vo.attendanceModifyVO.status}</span>
                            	</c:if>
                            	<c:if test="${vo.attendanceModifyVO.status eq '요청'}">
                            		<span class="badge bg-label-primary me-1">${vo.attendanceModifyVO.status}</span>
                            	</c:if>	
                            	<c:if test="${vo.attendanceModifyVO.status eq '반려'}">
                            		<span class="badge bg-label-warning me-1">${vo.attendanceModifyVO.status}</span>
                            	</c:if>			
                            </td>
                            <td><a href="./detail?attendanceModifyNum=${vo.attendanceModifyVO.attendanceModifyNum}">보기</a></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              
              <div id="pager">
                <c:if test="${not empty list}">
                  <ul class="pagination justify-content-center">
                    <li class="page-item prev ${pager.pre?'':'disabled'}">
                      <a class="page-link move" data-num="${pager.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
                    </li>
                    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                      <li class="page-item">
                        <a class="page-link move" data-num="${i}" href="#">${i}</a>
                      </li>
                    </c:forEach>
                    <li class="page-item next ${pager.next?'':'disabled'}">
                      <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
                    </li>
                  </ul>
                </c:if>
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
  
  <script>
    const page = $('.page-link[data-num="1"]');
    page.parent().addClass('active');
    
    $('#btn').on('click', function(){
      $(location).attr('href', '/attendanceModify/add');
    })
    
    $('.pagination').on('click', '.move', function(){
      const num = $(this).attr('data-num');
      $(location).attr('href', '?page='+num)
    })
  </script>

</body>
</html>