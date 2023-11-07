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
              <div class="row mb-5">
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <img class="card-img-top" src="../assets/img/elements/2.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                      </p>
                      <a href="javascript:void(0)" class="btn btn-outline-primary">Go somewhere</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <h6 class="card-subtitle text-muted">Support card subtitle</h6>
                    </div>
                    
                    <div class="card-body">
                      <p class="card-text">Bear claw sesame snaps gummies chocolate.</p>
                      <a href="javascript:void(0);" class="card-link">Card link</a>
                      <a href="javascript:void(0);" class="card-link">Another link</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <h6 class="card-subtitle text-muted">Support card subtitle</h6>
                      <img class="img-fluid d-flex mx-auto my-4" src="../assets/img/elements/4.jpg" alt="Card image cap">
                      <p class="card-text">Bear claw sesame snaps gummies chocolate.</p>
                      <a href="javascript:void(0);" class="card-link">Card link</a>
                      <a href="javascript:void(0);" class="card-link">Another link</a>
                    </div>
                  </div>
                </div>
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

    <script>
      //문서의 로딩을 시작할 때 
      //출근기록이 있는 경우  
      $(document).ready(function(){
        $.ajax({
          type: 'get',
          url: '/attendance/on',
          success: function(result){
            if(result.trim()>0){
              // $('#on').attr('id', 'off');
              // $('#off').text('퇴근하기');
              $('#on').css('display', 'none');
              $('#off').css('display', 'block');
            }
          },
          error: function(){
            alert('관리자에게 문의하세요');
          }
        }) 
      })
      //퇴근기록이 있는 경우
      $(document).ready(function(){
          $.ajax({
          type: 'get',
          url: '/attendance/off',
          success: function(result){
            if(result.trim()>0){
              $('#off').attr('disabled', true);
            }
          },
          error: function(){
            alert('관리자에게 문의하세요');
          }
        })
      })

      //로딩 완료되었을 때
      //퇴근기록이 있는 경우  
      // $(window).on('load', function(){
      //     if($('#btn_block').children().attr('id')=='off'){
      //       $.ajax({
      //       type: 'get',
      //       url: '/attendance/off',
      //       success: function(result){
      //         if(result.trim()>0){
      //           $('#btn_block').children().attr('disabled', true);
      //         }
      //       },
      //       error: function(){
      //         alert('관리자에게 문의하세요');
      //       }
      //     })
      //   }
      // })

      //출근
      function setOn(){
        $.ajax({
          type: 'post',
          url: '/attendance/on',
          success: function(result){
            if(result.trim()>0){
              alert('출근하였습니다');
              $('#on').css('display', 'none');
              $('#off').css('display', 'block');
            }
          },
          error: function(){
            alert('관리자에게 문의하세요');
          }
        })
      }

      //퇴근
      function setOff(){
        $.ajax({
          type: 'post',
          url: '/attendance/off',
          success: function(result){
            if(result.trim()>0){
              alert('퇴근하였습니다');
              $('#off').attr('disabled', true);
            }
          },
          error: function(){
            alert('관리자에게 문의하세요');
          }
        })
      }

      //출근버튼 클릭 시 
      $('#on').on('click', function(){
        setOn();
      })

      //퇴근버튼 클릭 시
      $('#btn_block').on('click', '#off', function(){
        setOff();
      })
 
    </script>
  </body>
</html>