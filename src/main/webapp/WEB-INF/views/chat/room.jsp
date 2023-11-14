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
   
   <style>
        h3 {
          margin-top: 40px !important;
          text-align: center;
      }
      .col-xl1 {
          flex: 0.4 0 0%;
       }
       .card .card-header + .card-body, .card .card-header + .card-content > .card-body:first-of-type {
          
          height: 550px;
      }
      #msgArea{
         width: 100%;
          height: 90%;
          background-color: #E7E7FF;
          padding: 0.8rem 0 1.5rem;
      }
      .alert-primary{
         background-color: #696CFF;
         color: white;
      }
      .msg{
         margin: 0.7rem 1.5rem 0 1.5rem;
      }
      .chatDate{
         font-size: 11px;
      }
      #msgArea::-webkit-scrollbar {
          width: 8px;
      }
      #msgArea::-webkit-scrollbar-thumb {
          background-color: #696CFF;
          border-radius: 10px;
      }
      #msgArea::-webkit-scrollbar-track {
          background-color: #E7E7FF;
          border-radius: 10px;
          box-shadow: inset 0px 0px 5px white;
       }
       #listBox{
          height: 85%;
          width: 100%;
          overflow-y: scroll;
       }
       #listBox::-webkit-scrollbar {
          width: 8px;
      }
      #listBox::-webkit-scrollbar-thumb {
          background-color: #696CFF;
          border-radius: 10px;
      }
      #listBox::-webkit-scrollbar-track {
          background-color: white;
          border-radius: 10px;
          box-shadow: inset 0px 0px 5px white;
       }
       .userBox{
          display: block !important;
          text-align: center;
          height: 70px;
          margin: 0 auto;
       }
       .userBox2{
          display: flex;
       }
       #userProfile{
           width: 50px;
          height: 50px;
          object-fit: cover;   
        }
        #proBox{
           width: 50px;
          height: 50px; 
          border-radius: 50%;
          overflow: hidden;
         }
         #my{
            font-size: 18px;
            line-height: 50px;
            font-weight: bolder;
         }
         .chatList{
            color: #566A7F;
            font-size: 16px;
         }
         #someone{
            font-size: 18px;
         }
         .myMsg{
            margin-left: auto;
          text-align: right;
          margin-right: 2%;
         }
         .yourMsg{
            background-color: white;
             margin-right: auto;
             text-align: left;
             margin-left: 2%;
         }
         .chatDate{
            margin-top:5px;
         }
         .box1{
                height: 100%;
         }
         .box2{
               padding-top: 15px !important;
         }
         .chatHome{
               margin: auto;
         }
         .boxHome{
               display: none;
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
      <!-- /sidebar -->
        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h3 class="mb-5">MESSENGER</h3>

              <!-- Basic Layout -->
              <div class="row">
                <div class="col-xl1">
                  <div class="box1 card mb-4">
                    <div class="userBox card-header d-flex justify-content-between align-items-center">
                       <div class="userBox2">
                          <sec:authorize access="isAuthenticated()">
                          <sec:authentication property="principal" var="user"/>
                             <div id="proBox">
                                  <img id="userProfile" alt="" src="../file/employee/${user.proFile}">
                              </div>
                              <div class="ms-3" id="my" data-position="${user.position}" data-user="${user.username}" data-name="${user.name}">${user.name}
                              <img width="25" height="25" src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/external-exercise-lifestyles-flaticons-lineal-color-flat-icons-2.png" alt="external-exercise-lifestyles-flaticons-lineal-color-flat-icons-2"/>
                              <span id="pInner"></span></div>
                     </sec:authorize>
                       </div>
                    </div>
                    <div class="box2 card-body">
                       <div class="input-group mb-4">
                           <input
                             id="searchName"
                             type="text"
                             class="form-control"
                             aria-label="Recipient's username"
                             aria-describedby="button-addon2"
                           />
                           <button class="btn btn-outline-primary" type="button" id="search">조회</button>
                         </div>
                       <div id="listBox" class="border">
                          <c:forEach items="${list}" var="li">
                              <div>
                                 <i class='mx-1 bx bx-message-square'></i><a href="#" class="chatList" data-empNum="${li.employeeNum}" data-name="${li.name}" data-pos="${li.position}">${li.name} ${li.position}</a>
                              </div>                         
                          </c:forEach>
                       </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl">
                  <div class="box1 card mb-4">
                    <div id="userBox" style="margin: auto;" class="userBox card-header d-flex justify-content-between align-items-center">
                      <h5 id="someone" class="mb-0" data-name=""><i class='bx bxs-quote-alt-left'></i> 채팅하려는 대상을 선택해 주세요 <i class='bx bxs-quote-alt-right' ></i></h5>
                    </div>
                    <div id="box2" style="display: none;" class="box2 card-body">
                       <div id="msgArea" class="card mb-3" style="overflow-y: scroll"></div>
                         
                       <div class="input-group">
                           <input
                             id="msg"
                             type="text"
                             class="form-control"
                             aria-label="Recipient's username"
                             aria-describedby="button-addon2"
                           />
                           <button class="btn btn-outline-primary"
                                   type="button"
                                   id="button-send"
                                   data-room=""
                                   data-receiver=""
                                   >보내기</button>
                         </div>
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
    
    <!-- room js -->
    <script src="../js/room.js"></script>
    
  </body>
</html>