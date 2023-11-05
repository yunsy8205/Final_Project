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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 
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
                <div>
				<!-- 검색창 -->
				<div>
					<form action="./approverList" method="get"
						style="width: 20%; float: right; margin-right: 180px;">
						<div id="frm" style="width: 300px;">
							<input type="hidden" value="${pager.page}" id="page" name="page">
							<input type="hidden" value="${pager.division}" name="division">
							<!-- 파라미터 이름 kind -->
							<select name="kind" id="k" class="search">
								<option class="kind" value="title">제목</option>
								<option class="kind" value="contents">내용</option>
							</select> <input type="text" name="search" value="${pager.search}"
								class="search" placeholder="검색어를 입력하세요."
								style="text-align: center;">
							<button type="submit">검색</button>
						</div>

					</form>
				</div>
				<div>
					<form action="./approverList" id="divisionForm" method="get">
						<input type="hidden" value="" id="division" name="division">
					</form>
					<button class="btn btn-primary" id="allBtn">전체</button>
					<button class="btn btn-primary" id="lvBtn">휴가신청</button>
					<button class="btn btn-primary" id="exBtn">지출신청</button>
					<button class="btn btn-primary" id="abBtn">휴직신청</button>
				</div>
				<div>
					<form action="./approverList" id="progressForm" method="get">
						<input type="hidden" value="" id="progress" name="progress">
					</form>
					<button class="btn btn-primary" id="before">결재전</button>
					<button class="btn btn-primary" id="after">결재완료</button>
				</div>

				<div>
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>기안일</th>
								<th>결재양식</th>
								<th>제목</th>
								<th>문서번호</th>
								<th>기안자</th>
								<th>결재상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td>${vo.regDate}</td>
									<td>${vo.category}</td>
									<td><a href="./approverDetail?approvalNum=${vo.approvalNum}">${vo.title}</a></td>
									<td>${vo.approvalNum}</td>
									<td>${vo.name}</td>
									<td>${vo.state}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTable_paginate">
						<ul class="pagination">
							<li
								class="paginate_button page-item previous ${pager.pre?'':'disabled'}"
								id="dataTable_previous"><a
								href="./approverList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}&division=${pager.division}"
								aria-controls="dataTable" data-dt-idx="0" tabindex="0"
								class="page-link">Previous</a></li>
							<c:forEach begin="${pager.startNum }" end="${pager.lastNum}"
								var="i">
								<li class="paginate_button page-item active" id="dataTable">
									<a
									href="./approverList?page=${i}&kind=${pager.kind}&search=${pager.search}&division=${pager.division}"
									aria-controls="dataTable" data-dt-idx="1" tabindex="0"
									class="page-link">${i}</a>
								</li>
							</c:forEach>

							<li
								class="paginate_button page-item next ${pager.next?'':'disabled'}"
								id="dataTable_next"><a
								href="./approverList?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}&division=${pager.division}"
								aria-controls="dataTable" data-dt-idx="7" tabindex="0"
								class="page-link">Next</a></li>
						</ul>
					</div>
				</div>
				</div>

              </div>
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
  
	<script src="/resources/js/approval/approverList.js"></script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>