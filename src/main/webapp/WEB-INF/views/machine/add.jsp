<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <div class="col-xxl">
              <div class="card mb-4">
                  <h5 class="card-header" style="text-align: center; margin: 3rem 0;">새 기구 등록</h5>
                  <form class="card-body" action="./add" method="post" enctype="multipart/form-data" id="frm">
                    <div style="display: flex; justify-content: space-between; margin-bottom: 5rem;" >
                      <div class="memLeft" style="width: 47%;">
                        <!-- 기구 사진 공간 -->
                      </div>
                      <div class="memRight" style="width: calc(100% - 53%);">
                        <div class="mb-3 row">
                          <label for="html5-date-input" class="col-md-2 col-form-label">사진 등록</label>
                          <div class="col-md-10">
                            <input class="form-control joinDate" name="joinDate" type="file" value="" id="html5-text-input" readonly />
                          </div>
                        </div>
                        <div class="mb-3 row">
                          <label for="html5-date-input" class="col-md-2 col-form-label">기구 이름</label>
                          <div class="col-md-10">
                            <input class="form-control expirationDate" name="expirationDate" type="text" value="" id="html5-text-input" readonly/>
                          </div>
                        </div>
                        <div class="mb-3 row" >
                          <label for="html5-text-input" class="col-md-2 col-form-label">구입일</label>
                          <div class="col-md-10">
                            <input class="form-control expirationDate" name="expirationDate" type="text" value="" id="html5-text-input" readonly/>
                          </div>
                        </div>
                        </div>
                      </div>
                    </div>
                    <div class="proBtn" style="text-align: center;">
                      <button type="button" id="backBtn" class="btn btn-primary">이전</button>
                      <button type="button" id="addBtn" class="btn btn-primary">등록</button>
                    </div>
                  </form>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script  type="text/javascript" src="/js/member/add.js"></script>
</body>
</html>