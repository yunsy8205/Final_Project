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
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h1 class="emp_title">${employeeVO.name} <span class="position_inner"></span> 수정사항</h1>
                        <form method="post" enctype="multipart/form-data" id="frm" action="./update">
                          <div class="upFile">
                            <input type="file" name="photo" id="photo">
                          </div>
                          <div class="upContent">
                            <div class="upLeft">
                              <div id="hidden">
                                <input type="hidden" name="employeeNum" value="${employeeVO.employeeNum}">
                                <input type="text" name="quitDate" id="quitDate" value="${employeeVO.quitDate}">
                              </div>
                              <div class="updiv">
                                <label for="employeeNum">사번</label>
                                <input id="employeeNum" cssClass="input_con" required="true" readonly="true" value="${employeeVO.employeeNum}"></input>
                              </div>
                              <div class="updiv">
                                <label for="name">이름</label>
                                <input id="name" name="name" cssClass="input_con" value="${employeeVO.name}"></input>
                              </div>
                              <div class="updiv">
                                <label for="phone">전화번호</label>
                                <input id="phone" name="phone" cssClass="input_con" value="${employeeVO.phone}"></input>
                              </div>
                              <div class="updiv">
                                <label for="address">주소</label>
                                <input id="address" name="address" cssClass="input_con" value="${employeeVO.address}"></input>
                              </div>
                              <div class="updiv">
                                <label for="birth">생년월일</label>
                                <input id="birth" name="birth" cssClass="input_con" readonly="true" value="${employeeVO.birth}"></input>
                              </div>
                            </div>
                            <div class="upRight">
                              <div class="updiv">
                                <label for="joinDate">입사일</label>
                                <input id="joinDate" cssClass="input_con" required="true" readonly="true" value="${employeeVO.joinDate}"></input>
                              </div>
                              <div class="updiv">
                                <label for="gender" value="${employeeVO.gender}">성별</label>
                                <input type="hidden" id="genderVal" cssClass="input_con" readonly="ture" value="${employeeVO.gender}"></input>
                                <input type="radio" id="gender_M" class="gender" name="gender" value="M">남
                                <input type="radio" id="gender_W" class="gender" name="gender" value="W">여
                              </div>
                              <div class="updiv">
                                <label for="state">직원상태</label>
                                <input type="hidden" id="state" cssClass="input_con" value="${employeeVO.state}"></input>
                                <input type="radio" name="state" id="state_in" cssClass="input_con" value="재직">재직</input>
                                <input type="radio" name="state" id="state_out" cssClass="input_con" value="퇴직">퇴직</input>
                                
                              </div>
                              <div class="updiv">
                                <label for="position">직급</label>
                                <input type="hidden" id="position" cssClass="input_con" value="${employeeVO.position}"></input>
                                <p class="position_inner"></p>
                                <select name="position" id="position">
                                  <option value="ROLE_CEO">대표</option>
                                  <option value="ROLE_GENERAL">총괄 매니저</option>
                                  <option value="ROLE_CUSTOMER">고객관리 매니저</option>
                                  <option value="ROLE_RESOURCES">인사 매니저</option>
                                  <option value="ROLE_FACILITY">시설 매니저</option>
                                  <option value="ROLE_TRAINER">트레이너</option>
                                  <option value="ROLE_EX">가발령</option>
                                </select>
                              </div>
                              <div class="updiv">
                                <label for="leaveDate">연차갯수</label>
                                <input id="leaveDate" name="leaveDate" cssClass="input_con" required="true" value="${employeeVO.leaveDate}"></input>
                              </div>
                            </div>
                          </div>
                          <div class="upBtn">
                            <button type="submit" id="upBtn">등록</button>
                          </div>
                        </form>
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
    <script src="/js/employee/update.js"></script>
  </body>
</html>