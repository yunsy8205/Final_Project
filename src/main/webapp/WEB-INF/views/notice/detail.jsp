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
                      <form action="./add" method="post" enctype="multipart/form-data">
                        <div class="row mb-3">
                        <label class="col-sm-2 col-form-label" for="basic-default-name">카테고리</label>
	                        <div id="radioBox" class="col-md">
		                        <span class="radio1">
			                        <input
			                        name="category"
			                        class="form-check-input"
			                        type="radio"
			                        value="인사"
			                        id="cat1"
			                        checked
			                        />
		                        	<label class="form-check-label" for="cat1"> 인사 </label>
		                        </span>
		                        <span class="radio1">
			                        <input
			                        name="category"
			                        class="form-check-input"
			                        type="radio"
			                        value="휴무"
			                        id="cat2"
			                        />
		                        	<label class="form-check-label" for="cat2"> 휴무 </label>
	                        	</span>
	                        	<span class="radio1">
			                        <input
			                        name="category"
			                        class="form-check-input"
			                        type="radio"
			                        value="시설"
			                        id="cat3"
			                        />
		                        	<label class="form-check-label" for="cat3"> 시설 </label>
	                        	</span>
	                        	<span class="radio1">
			                        <input
			                        name="category"
			                        class="form-check-input"
			                        type="radio"
			                        value="기타"
			                        id="cat4"
			                        />
		                        	<label class="form-check-label" for="cat4"> 기타 </label>
	                        	</span>
	                        </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="title">제목</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" />
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">내용</label>
                          <div class="col-sm-10">
                            <textarea rows="" cols="" id="summernote" name="contents" class="form-control"></textarea>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="files">첨부파일</label>
                          <div class="col-sm-10">
                            <input type="file" class="form-control" id="files" name="files"/>
                          </div>
                        </div>
                        <div class="row justify-content-end">
                          <div class="col-sm-10">
                          	<a class="a1 btn btn-primary" href="./list">이전</a>
                            <button type="submit" class="btn btn-primary">등록</button>
                          </div>
                        </div>
                      </form>
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
  
	<script>
      $('#summernote').summernote({
        placeholder: '공지사항 내용을 입력해주세요.',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>