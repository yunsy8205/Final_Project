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
              <h3>전체 회원 목록</h3>
              <div class="container-xxl flex-grow-1 container-p-y">
                <div>
                  <div>
                    <form action="./list" method="get" id="frm">
                      <input type="hidden" value="${pager.page}" id="page" name="page">
                      <!-- 파라미터 이름 kind -->
                      <select name="kind" id="k" class="search" data-kind="${pager.kind}" >
                        <option class="kind" value="name">이름</option>
                      </select> 
                      <input type="text" name="search" value="${pager.search}" class="search" placeholder="검색어를 입력하세요.">
                      <button type="submit" class="btn btn-primary">검색</button>
                    </form>
                  </div>
                </div>
                <a href="/member/add">등록</a>
                <div id="req_list" class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>헬스 가입일</th>
                        <th>헬스 만료일</th>
                        <th>피티 등록일</th>
                        <th>피티횟수</th>
                        <th>담당 트레이너</th>
                        <th>등록여부</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${list}" var="vo" varStatus="i">
                        <tr>
                          <td>${i.index+1}</td>
                          <td><a href="./detail?memberNum=${vo.memberNum}">${vo.memberName}</a></td>
                          <td>${vo.phone}</td>
                          <td>${vo.joinDate}</td>
                          <td>${vo.expirationDate}</td>
                          <td>${vo.registrationVO.regDate}</td>
                          <td class="ptCount" data-ptcount="${vo.ptCount}">${vo.ptCount}</td>
                          <td>${member.employeeVO.name}</td>
                          <td id="ptAdd" value="">
                            <a href="#" class="membershipADDBtn" class="btn btn-primary" value=""></a>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                
              </div>
              <ul class="pagination justify-content-center">
                <li class="page-item prev ${pager.pre?'':'disabled'}">
                  <a class="page-link move" data-num="${pager.startNum-1}" href="#"><i class="tf-icon bx bx-chevrons-left"></i></a>
                </li>
                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                   <li class="page-item">
                     <a class="page-link move b1" value="1" data-num="${i}" href="#">${i}</a>
                   </li>
                </c:forEach>
                <li class="page-item next ${pager.next?'':'disabled'}">
                  <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
                </li>
              </ul>
              <!-- 페이징 -->
							<!-- <nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pager.pre}">
									<li class="page-item ${pager.pre?'':'disabled'}"><a class="page-link"
										href="./list?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous"> 
                      <span aria-hidden="true">&laquo;</span>
									</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<li class="page-item"><a class="page-link"
											href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									</c:forEach>
									<c:if test="${pager.next}">
										<li class="page-item"><a class="page-link"
											href="./list?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav> -->
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
    <script type="text/javascript" src="/js/employee/list.js"></script>
    <script>
      
      document.addEventListener("DOMContentLoaded", function(){
        const ptCount = document.getElementsByClassName("ptCount");
        const membershipAdd = document.getElementsByClassName("membershipADDBtn");
        
        for(let i =0; i<ptCount.length; i++){
          const ptCountValue = ptCount[i].getAttribute("data-ptcount");
          console.log("Value: " + ptCountValue);

          if(ptCountValue == ''){
            membershipAdd[i].style.display='block';
            membershipAdd[i].style.backgroud='blue';
            membershipAdd[i].textContent="등록";
          }else{
            membershipAdd[i].textContent="등록완료";
            membershipAdd[i].style.background='black';
          }
        }
      })
      // $(document).ready(function() {
      //   if($("#ptCount").val() == ''){
      //     $("#membershipADDBtn").css("display","block");
      //     $("#membershipADDBtn").text('등록');
      //   }else if(!$("#ptCount").val() == ''){
      //     $("#membershipADDBtn").text('등록완료');
      //     $("#membershipADDBtn").css("background-color","black");
      //   }
      // })
      
    </script>
  </body>
</html>