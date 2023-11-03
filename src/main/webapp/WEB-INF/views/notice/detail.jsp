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
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<style>
    	h3 {
	    	margin-top: 40px !important;
	    	text-align: center;
	    }

		.a1{
			color: white;
		}
		
		#btn{
			padding-left: 40%;
			margin-top: 50px;
		}
		table{
			table-layout: fixed;
		}
		#title1{
			font-size: 18px;
			
		}

	</style>
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
				<h3>공지사항</h3>

              <div class="row">
                <div class="mb-4">
                    <div class="card-body">
                      <div>
                      	<table class="table">
                      		<tr >
                      			<th>제목</th>
                      			<td id="title1" colspan="5"><strong>${notice.category}</strong> ${notice.title}</td>
                      		</tr>
                      		<tr>
                      			<th>작성자</th>
                      			<td colspan="2">${notice.name}</td>
                      			<td></td>
                      			<td></td>
                      			<td></td>
                      		</tr>
                      		<tr>
                      			<th>작성일</th>
                      			<td>${notice.modDate}</td>
                      			<th>조회</th>
                      			<td>${notice.hit}</td>
                      			<td></td>
                      			<td></td>
                      		</tr>
                      	</table>
                      </div>
                      <div>
                      		${notice.contents}<br>
                      		<hr>
                      		<c:forEach items="${notice.files}" var="f">
                      			${f.oriName}
                      		</c:forEach>
                      </div>
                      <hr>
                      <div id="btn" class="col-sm-10">
                          	<a class="a1 btn btn-primary" href="./list">이전</a>
                            <a class="a1 btn btn-primary" href="./update">수정</a>
                            <a class="a1 btn btn-primary" href="./delete">삭제</a>
                      </div>
                    </div>
                  </div>
                    <!-- /Account -->
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
  
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>