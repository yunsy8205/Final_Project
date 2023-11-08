<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<script ></script>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      src="https://kit.fontawesome.com/4d61d0b940.js"
      crossorigin="anonymous"
    ></script>
    <script src="/fullcalendar-6.1.9/fullcalendar-6.1.9/dist/index.global.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Calendar -->

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
              <div id="calendar"></div>
              		
              </div>
              <!-- / Content --> 
              
              
              

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
    <script type="text/javascript">
    function passValueToModal() {
        var employeeNum = document.querySelector('th').innerText;
        var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
        // 여기서는 employeeNum을 모달에 적합한 방식으로 전달할 수 있습니다.
        // 예를 들어, 모달 내의 입력 필드 값으로 설정할 수 있습니다.
        var inputField = document.getElementById('employeeNumInput');
        inputField.value = employeeNum;
        console.log(employeeNum)
        
        $('#addTypeForm').on('click', function(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            console.log("운동 추가 버튼이 클릭되었습니다.");
            // Ajax를 사용하여 폼 데이터 서버로 전송
            $.ajax({
                type: "POST",
                url: "/trainer/addType",
                data: {
                    employeeNum: $('#employeeNumInput').val(),
                    name: $('#name').val(),
                    weight: $('#weight').val(),
                    exCount: $('#exCount').val(),
                    ptSet: $('#ptSet').val()
                }, // 폼 데이터 직렬화하여 전송
                success: function(response) {
                    alert("운동 추가 성공");
                    location.reload();
                },
                error: function(error) {
                    console.log("에러 발생", error);
                }
            });
        });
        
    }
    </script>
  </body>
</html>