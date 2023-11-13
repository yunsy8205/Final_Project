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
  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
  <script src='/fullcalendar-6.1.9/fullcalendar-6.1.9/dist/index.global.js'></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 
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
              
              <div class="table-responsive text-nowrap">
              <form action="./list" method="get">
                <div class="input-group">
                  
								  <select id="kind" name="kind" class="select2 form-select">
									  <option selected value="employeeNum">사원번호</option>
									  <option value="name">이름</option>
								  </select>
								  <input type="text" class="form-control" id="search" name="search"/>
								  <button
									class="btn btn-outline-primary"
									id="searchBtn"
									type="submit"
									>
									조회
								  </button>
                
								</div>
              </form>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>사원번호</th>
                      <th>이름</th>
                      <th>직급</th>
                      <th>휴가종류</th>
                      <th>휴가시작일</th>
                      <th>휴가종료일</th>
                      <th>사용연차일수</th>
                      
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                    <c:forEach items="${ll}" var="vo">
                      <tr>
                        <td>${vo.employeeNum}</td>
                        <td>${vo.employeeVO.name}</td>
                        <c:if test="${vo.employeeVO.position=='ROLE_CEO'}"><td>대표</td></c:if>
												<c:if test="${vo.employeeVO.position=='ROLE_GENERAL'}"><td>총괄매니저</td></c:if>
												<c:if test="${vo.employeeVO.position=='ROLE_CUSTOMER'}"><td>고객관리</td></c:if>
												<c:if test="${vo.employeeVO.position=='ROLE_RESOURCES'}"><td>인사관리</td></c:if>
                        <c:if test="${vo.employeeVO.position=='ROLE_FACILITY'}"><td>시설관리</td></c:if>
												<c:if test="${vo.employeeVO.position=='ROLE_TRAINER'}"><td>트레이너</td></c:if>
                        
                        <td>${vo.leaveKind}</td>
                        <td>${vo.startDate}</td>
                        <td>${vo.endDate}</td>
                        <td>${vo.useDate}</td>
                        
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              
                <ul class="pagination justify-content-center">
                  <li class="page-item prev ${pager.pre?'':'disabled'}">
                    <a class="page-link move" data-num="${pager.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
                  </li>
                  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                     <li class="page-item">
                     <a class="page-link move b1" value="1" data-num="${i}" href="./list?kind=${pager.kind}&search=${pager.search}&page=${i}">${i}</a>
                     </li>
                  </c:forEach>
                  <li class="page-item next ${pager.next?'':'disabled'}">
                    <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
                  </li>
                  </ul>
              
            </div>
          
            <!--/ Hoverable Table rows -->
              <!-- / Content --> 
              
              
              <!-- Footer -->
                <!-- <footer class="content-footer footer bg-footer-theme">
                  <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                    <div class="mb-2 mb-md-0">
                      ©
                      <script>
                        document.write(new Date().getFullYear());
                      </script>
                      , made with ❤️ by
                      <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                    </div>
                    <div>
                      <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                      <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                      <a
                        href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                        target="_blank"
                        class="footer-link me-4"
                        >Documentation</a
                      >

                      <a
                        href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                        target="_blank"
                        class="footer-link me-4"
                        >Support</a
                      >
                    </div>
                  </div>
                </footer> -->
                <!-- / Footer -->       

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

    </script>
  </body>
</html>