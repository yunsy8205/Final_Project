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
                <h1 class="emp_title">직원 인적사항</h1>
                <form:form modelAttribute="employeeVO" method="post" enctype="multipart/form-data" id="frm" action="./join">
                  <div class="proFile_con">
                    <input type="file" name="empfile" id="proFile" required="true"/>
                  </div>
                  <div class="proContent">
                    <div class="proLeft">
                      <div class="prodiv">
                        <form:label path="name">이름</form:label>
                        <form:input path="name" id="name" cssClass="input_con" required="true"></form:input>
                        <form:errors path="name"></form:errors>
                      </div>
                      <div class="prodiv">
                        <form:label path="phone">전화번호</form:label>
                        <form:input path="phone" id="phone" cssClass="input_con" required="true"></form:input>
                        <form:errors path="phone"></form:errors>
                      </div>
                      <div class="prodiv">
                        <form:label path="address">주소</form:label>
                        <form:input path="address" id="adr_postNum" cssClass="input_con" placeholder="우편번호" value=""></form:input>
                        <button type="button" id="addressBtn">우편번호 찾기</button>
                        <form:input path="address" id="adr_address" placeholder="주소" required="true"></form:input>
                        <form:input path="address" id="adr_detail" placeholder="상세주소" value ="" required="true"></form:input>
                        <form:errors path="address"></form:errors>
                      </div>
                      <div class="prodiv">
                        <form:label path="birth">생년월일</form:label>
                        <form:input type="date" path="birth" id="birth" cssClass="input_con" required="true"></form:input>
                        <form:errors path="birth"></form:errors>
                      </div>
                    </div>
                    <div class="proRight">
                      <div class="prodiv">
                        <form:label path="joinDate">입사일</form:label>
                        <form:input path="joinDate" id="joinDate" cssClass="input_con" value="" readonly="true"></form:input>
                        <form:errors path="joinDate"></form:errors>
                      </div>
                      <div class="prodiv">
                        <label for="gender">성별</label>
                        <input type="radio" id="gender_M" name="gender" value="M" checked>남
                        <input type="radio" id="gender_W" name="gender" value="W">여
                      </div>
                      <div class="prodiv">
                        <label for="state">직원상태</label>
                        <input type="radio" name="state" id="state" cssClass="input_con" value="재직" checked>재직</input>
                      </div>
                      <div class="prodiv">
                        <select name="position" id="position">직급
                          <option value="ROLE_CEO">대표</option>
                          <option value="ROLE_GENERAL">총괄 매니저</option>
                          <option value="ROLE_CUSTOMER">고객관리 매니저</option>
                          <option value="ROLE_RESOURCES">인사 매니저</option>
                          <option value="ROLE_FACILITY">시설 매니저</option>
                          <option value="ROLE_TRAINER">트레이너</option>
                          <option value="ROLE_EX">가발령</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="proBtn">
                    <button type="button" id="backBtn">이전</button>
                    <button type="submit" id="addBtn">등록</button>
                  </div>
                </form:form>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script  type="text/javascript" src="/js/employee/join.js"></script>
</body>
</html>