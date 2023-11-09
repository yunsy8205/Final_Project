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
  data-assets-path="/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <style>
      #off {
        display: none;
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
      <!-- /sidebar -->
        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <sec:authentication property="principal" var="user"/>
	              <div id="user" data-num="${user.employeeNum}">
	                ${user.name} 
	                ${user.position}
	              </div>
              <div id="btn_block">
                <button type="button" id="on" class="btn btn-primary">출근하기</button>
                <button type="button" id="off" class="btn btn-primary">퇴근하기</button>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>

    <script src="/js/attendance/work.js"></script>
  </body>
</html>