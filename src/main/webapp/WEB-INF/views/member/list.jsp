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
                <h3>전체 회원 목록</h3>

                <!-- Modal -->
                <div class="modal fade" id="smallModal" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">이용권</h5>
                        <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <div class="row mb-3">
                          <label for="num" class="col-sm-2 col-form-label">회원번호</label>
                          <div class="col-sm-10">
                            <input type="text" id="num" name="memberNum" class="form-control" readonly>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label for="name" class="col-sm-2 col-form-label">회원이름</label>
                          <div class="col-sm-10">
                            <input type="text" id="name" name="memberName" class="form-control" readonly>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label for="num" class="col-sm-2 col-form-label">이용권</label>
                          <div class="col-sm-10">
                            <select id="inputState" class="form-select">
                              <option>Choose...</option>
                              <option>...</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary close" data-bs-dismiss="modal">
                          이전
                        </button>
                        <button type="button" class="btn btn-primary close" data-bs-dismiss="modal">
                          등록
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

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
                            <a href="#" class="membershipADDBtn btn btn-primary"
                            data-num="${vo.memberNum}"
                            data-name="${vo.memberName}"
                            ></a>
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
      
      $('a.membershipADDBtn').on('click', function(){
        const num = $('a.membershipADDBtn').attr('data-num');
        const name = $('a.membershipADDBtn').attr('data-name');

        $('#num').val(num);
        $('#name').val(name);
        $('#smallModal').modal('show'); //모달 활성화
      })

    </script>
  </body>
</html>