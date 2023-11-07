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
                    <div class="card-header">
                      <h1 class="emp_title">${employeeVO.name} <span class="position_inner"></span> 정보수정</h1>
                      <form:form modelAttribute="employeeVO" method="post" enctype="multipart/form-data" id="frm" action="./infoUpdate">
                        <div class="proFile_con">
                          <img src="../file/employee/${employeeVO.proFile}" alt="직원 프로필">
                          <p>${employeeVO.proOriginal}</p>
                          <input type="file"  name="empfile" id="proFile" required/>
                        </div>
                        <input type="text" class="form-control" name="employeeNum" value="${employeeVO.employeeNum}">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 5rem;">
                          <div  class="empLeft" style="width: 47%;">
                            <div class="row mb-3">
                              <form:label path="name" class="col-md-2 col-form-label">이름</form:label>
                              <form:input path="name" id="name" class="form-control" value="${employeeVO.name}" readonly="true"></form:input>
                              <form:errors path="name"></form:errors>
                            </div>
                            <div class="row mb-3">
                              <form:label path="phone" class="col-md-2 col-form-label">전화번호</form:label>
                              <form:input path="phone" id="phone"  class="form-control" ></form:input>
                              <form:errors path="phone"></form:errors>
                            </div>
                            <div class="mb-3 row">
                              <label for="html5-text-input" class="col-md-2 col-form-label">주소</label>
                              <div class="col-md-10">
                                <form:input path="address" class="form-control address input" type="text" id="html5-text-input"  value="" placeholder="우편번호"/>
                                <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                                <input class="form-control" type="hidden" id="html5-text-input"  placeholder="주소" />
                                <input class="form-control" type="hidden" id="html5-text-input"  placeholder="상세주소" value="" />
                                <div id="addressMsg"></div>
                              </div>
                            </div>
                            <div class="row mb-3" >
                              <form:label path="birth" class="col-md-2 col-form-label">생년월일</form:label>
                              <form:input type="date" path="birth" id="birth"  class="form-control" ></form:input>
                              <form:errors path="birth"></form:errors>
                            </div>
                          </div>
                          <div class="empRight" style="width: calc(100% - 53%);">
                            <div class="row mb-3">
                              <form:label path="joinDate" class="col-md-2 col-form-label">입사일</form:label>
                              <form:input path="joinDate" id="joinDate"  class="form-control" value="" readonly="true"></form:input>
                              <form:errors path="joinDate"></form:errors>
                            </div>
                            <div class="row mb-3">
                              <label for="html5-text-input" class="col-md-2 col-form-label">성별</label>
                              <input type="hidden" id="genderVal" cssClass="input_con" readonly="ture" value="${employeeVO.gender}"></input>
                              <div class="col-md-10" style="display: flex;">
                                <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                                  <label class="form-check-label" for="gender_M"> 남 </label>
                                  <input class="form-check-input" name="gender" type="radio" value="M" id="gender_M" />
                                </div>
                                <div class="form-check">
                                  <label class="form-check-label" for="gender_W"> 여 </label>
                                  <input  class="form-check-input" name="gender" type="radio" value="W" id="gender_W"/>
                                </div>
                              </div>
                            </div>
                            <div class="row mb-3">
                              <label for="state"class="col-md-2 col-form-label">직원상태</label>
                              <input type="radio" name="state" id="state" class="form-check-input state_input" style="padding-right: 0;
                              margin-right: calc(var(--bs-gutter-x) * 0.5);" value="재직" checked>재직</input>
                            </div>
                            <div class="row mb-3">
                              <label for="position"class="col-md-2 col-form-label">직급</label>
                              <input style="display: none;" name="position" id="position"  class="form-check-input" value="${employeeVO.position}" >${employeeVO.position}</input>
                            </div>
                          </div>
                        </div>
                        <div class="upBtn">
                          <button type="submit" id="upBtn">수정 완료</button>
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
    <script type="text/javascript" src="/js/employee/infoUpdate.js"></script>
  </body>
</html>