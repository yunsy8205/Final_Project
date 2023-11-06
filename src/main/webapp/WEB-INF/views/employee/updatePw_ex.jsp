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
                <form:form modelAttribute="employeeVO" action="/employee/updatePw" method="post" id="pwFrm">
                  <input type="text" name="employeeNum" value="${employeeVO.employeeNum}"/>
                  <input type="text" name="password" value="${employeeVO.password}"/>
                  <div class="row mb-3">
                    <form:label path="inputPw" class="col-sm-2 col-form-label" for="basic-default-name">기존 비밀번호</form:label>
                    <div class="col-sm-10">
                      <form:password path="inputPw" cssClass="form-control" id="basic-default-name"/>
                      <form:errors path="inputPw"></form:errors>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <form:label path="newPw" class="col-sm-2 col-form-label" for="basic-default-name">새 비밀번호</form:label>
                    <div class="col-sm-10">
                      <form:password path="newPw" cssClass="form-control" id="basic-default-name"/>
                      <form:errors path="newPw"></form:errors>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <form:label path="pwCheck" class="col-sm-2 col-form-label" for="basic-default-name">비밀번호 확인</form:label>
                    <div class="col-sm-10">
                      <form:password path="pwCheck"  cssClass="form-control" id="basic-default-name"/>
                      <form:errors path="pwCheck"></form:errors>
                    </div>
                  </div>
                  <div class="proBtn">
                    <button type="submit" id="upBtn">비밀번호 변경</button>
                  </div>
                </form:form>
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
    <script type="text/javascript" src="/js/employee/info.js"></script>
  </body>
</html>