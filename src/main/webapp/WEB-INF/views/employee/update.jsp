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
                    <div class="card-header d-flex align-items-center justify-content-between" style="flex-direction: column;">
                      <h3 class="emp_title card-header" style="text-align: center; margin: 3rem 0;">${employeeVO.name} <span class="position_inner"></span> 수정사항</h3>
                        <form method="post" class="card-body" enctype="multipart/form-data" id="frm" action="./update" style="width: 100%;">
                          <div class="upFile" style="text-align: center;display: flex;flex-direction: column;align-items: center;">
                            <img src="../file/employee/${employeeVO.proFile}" style="width:10rem; height:10rem;" alt="직원 프로필" onerror="this.style.display='none'">
                          </div>
                          <div class="upContent" style="display: flex; justify-content: space-between; margin-bottom: 5rem;">
                            <div class="upLeft" style="width: 47%;">
                              <div id="hidden">
                                <input type="hidden" name="employeeNum" value="${employeeVO.employeeNum}" class="col-sm-2 col-form-label">
                                <input type="hidden" name="quitDate" id="quitDate" value="${employeeVO.quitDate}">  
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="employeeNum"  class="col-md-2 col-form-label">사번</label>
                                <div class="col-md-10">
                                  <input id="employeeNum" class="input_con form-control" required="true" readonly="true" value="${employeeVO.employeeNum}"></input>
                                </div>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="name"  class="col-md-2 col-form-label">이름</label>
                                <div class="col-md-10">
                                  <input name="name" class="input_con form-control name input" value="${employeeVO.name}"></input>
                                  <div id="nameMsg"></div>
                                </div>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="phone" class="col-md-2 col-form-label">전화번호</label>
                                <div class="col-md-10">
                                  <input name="phone" class="input_con form-control phone input" value="${employeeVO.phone}"></input>  
                                  <div id="phoneMsg"></div>
                                </div>
                              </div>
                              <div class="mb-3 row">
                                <label for="html5-text-input" class="col-md-2 col-form-label">주소</label>
                                <div class="col-md-10">
                                  <input class="form-control address input" name="address" type="text" id="html5-text-input" value="${employeeVO.address}" placeholder="우편번호" />
                                  <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
                                  <input class="form-control" type="hidden" id="html5-text-input"  placeholder="주소" />
                                  <input class="form-control" type="hidden" id="html5-text-input"  placeholder="상세주소" value="" />
                                  <div id="addressMsg"></div>
                                </div>
                              </div>
                              <div class="mb-3 row">
                                <label for="html5-date-input" class="col-md-2 col-form-label">생년월일</label>
                                <div class="col-md-10">
                                  <input class="form-control birth input" name="birth" type="date" value="${employeeVO.birth}" placeholder="생년월일을 입력해주세요." id="html5-date-input" />
                                  <div id="birthMsg"></div>
                                </div>
                              </div>
                            </div>
                            <div class="upRight"  style="width: calc(100% - 53%);">
                              <div class="updiv mb-3 row">
                                <label for="joinDate" class="col-md-2 col-form-label">입사일</label>
                                <div class="col-md-10">
                                  <input id="joinDate" class="input_con form-control" required="true" readonly="true" value="${employeeVO.joinDate}"></input>
                                </div>  
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="gender" value="${employeeVO.gender}"  class="col-md-2 col-form-label">성별</label>
                                <input type="hidden" id="genderVal" class="input_con" readonly="ture" value="${employeeVO.gender}"></input>
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
                              <div class="updiv mb-3 row" >
                                <label for="state" class="col-md-2 col-form-label">직원상태</label>
                                <input type="hidden" id="state" class="input_con" readonly="ture" value="${employeeVO.state}"></input>
                                <div class="col-md-10" style="display: flex;">
                                  <div class="form-check mt-3" style="margin-top:0 !important; margin-right: 2rem;">
                                    <label class="form-check-label" for="state_in"> 재직 </label>
                                    <input class="form-check-input" name="state" type="radio" value="재직" id="state_in" />
                                  </div>
                                  <div class="form-check">
                                    <label class="form-check-label" for="state_out"> 퇴직 </label>
                                    <input  class="form-check-input" name="state" type="radio" value="퇴직" id="state_out"/>
                                  </div>
                                </div>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="position" class="col-md-2 col-form-label">직급</label>
                                <input type="hidden" id="position" class="input_con" value="${employeeVO.position}"></input>
                                <p class="position_inner"></p>
                                <select name="position">
                                  <option value="ROLE_CEO">대표</option>
                                  <option value="ROLE_GENERAL">총괄 매니저</option>
                                  <option value="ROLE_CUSTOMER">고객관리 매니저</option>
                                  <option value="ROLE_RESOURCES">인사 매니저</option>
                                  <option value="ROLE_FACILITY">시설 매니저</option>
                                  <option value="ROLE_TRAINER">트레이너</option>
                                  <option value="ROLE_EX">가발령</option>
                                </select>
                              </div>
                              <div class="updiv mb-3 row">
                                <label for="leaveDate" class="col-md-2 col-form-label">연차갯수</label>
                                <div class="col-sm-10">
                                  <input id="leaveDate" name="leaveDate" class="input_con form-control" readonly value="${employeeVO.leaveDate}"></input>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="upBtn" style="text-align: center;">
                            <button type="button" id="upBtn" class="btn btn-primary" >수정 사항 등록</button>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/employee/update.js"></script>
  </body>
</html>