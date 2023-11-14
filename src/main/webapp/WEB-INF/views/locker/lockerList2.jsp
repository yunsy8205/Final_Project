<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.cloud.pt.locker.LockerVO"%>
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
<style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
           
        }

        .row {
            display: flex;
            gap: 20px; /* 좌우 간격 조절 */
            margin-bottom: 20px; /* 각 행의 아래 간격 조절 */
            width: 100%; /* 행의 너비를 100%로 설정 */
        }

        .locker {
            flex: 1; /* 각 라커의 비율을 동일하게 설정 */
            max-width: calc(12.5% - 5px); /* 최대 너비를 12.5%로 설정하고 좌우 간격을 제외한 값으로 설정 */
            height: 120px; /* 세로 크기 조절 */
            background-color: #bfbfbf;
            border: 1px solid #999;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        .lockerPadding{
        	padding: 50px;
        }

        @media (max-width: 768px) {
            /* 브라우저 너비가 768px 이하인 경우 */
            .locker {
                max-width: calc(25% - 20px); /* 최대 너비를 25%로 설정하고 좌우 간격을 제외한 값으로 설정 */
                height: 80px; /* 세로 크기를 작게 조절 */
            }
        }
    </style>
        
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
                
                
                	<table class="pull-right">
                    <tr>
                        <td>
                          <h3>🔐 락커 관리</h3>
                        </td>
                    </tr>        
                  </table>

                  <br>
                  
  <div class="lockerPadding">
    <%
    List<LockerVO> ar = (List<LockerVO>) request.getAttribute("ar");

    for (int row = 1; row <= 4; row++) {
    %>
    <div class="row">
        <%
        for (int col = 1; col <= 8; col++) {
            int lockerNumber = (row - 1) * 8 + col;
            LockerVO lockerVO = null;

            // ar에서 해당 lockerNumber에 대한 정보를 찾기
            for (LockerVO locker : ar) {
                if (locker.getLockerNum() == lockerNumber) {
                    lockerVO = locker;
                    break;
                }
            }
            
            // state 값이 null인 경우 "정상"으로 설정
            if (lockerVO != null && lockerVO.getState() == null) {
            	lockerVO.setState("정상");
            }
        %>
        <div class="locker" data-lockerNum="<%= lockerNumber %>">
            <!-- lockerInfo가 null이 아닌 경우에만 정보 출력 -->
            <% if (lockerVO != null) { %>
                <div class="lockerInfo" style="font-size: 12px">
                    <% 
                    // lockerInfo의 STATE 값이 "고장"이거나 null이 아닌 경우
                    String state = lockerVO.getState();
                    if (state != null && state.equals("고장")) {
                    %>
                        <div style="color: red;">고장</div><br>
                    <% } else { %>
                    	<%= lockerVO.getLockerNum() %> <br>
                        <%= lockerVO.getMemberName() %><br>
                        <%= lockerVO.getStartDate() %><br>
                        <%= lockerVO.getFinishDate() %><br>
                       
                    <% } %>
                </div>
            <% } else { %>
                <%= lockerNumber %>
            <% } %>
        </div>
        <%
        }
        %>
    </div>
    <%
    }
    %>
</div>



    
     <!-- Modal -->
                <div class="modal fade" id="enrollModal" tabindex="-1" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <form id="postForm2" action="" method="post" >
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">락커 No.<span id="sp-lkNo"></span></h5>
                        <input type="hidden" id="sm-lkNo" name="lockerNum" >
						                        
						<button
                          type="button"
                          class="btn-close"
                          data-bs-dismiss="modal"
                          aria-label="Close"
                        ></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <div class="mb-3">
                              <label for="defaultSelect" class="form-label">회원 목록</label>
                              
                              
                              <select id="defaultSelect" class="form-select" name="memberNum">
                              
                              	<option selected disabled>회원을 선택하세요.</option>
                                <c:forEach var="member" items="${memberList}">
							        <option value="${member.memberNum}"> ${member.memberName}</option>
							       
							    </c:forEach>
                              </select>
                              
                            </div>
                          </div>
                        </div>
                        <div class="row g-2">
                          <div class="col mb-0">
                            <label for="emailBasic" class="form-label">시작일</label>
                            <input class="form-control" type="date" name="startDate" value="${ today }" id="html5-date-input" />
                          </div>
                          <div class="col mb-0">
                            <label for="dobBasic" class="form-label">종료일</label>
                            <input class="form-control" type="date" name="finishDate" value="${ today }" id="html5-date-input" />
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        
					        <button type="button" class="btn btn-primary" onclick="postFormSubmit2('delUser'),;">라커회수</button>
					    
					    
					    <!-- memberNum이 없을 경우에만 락커등록과 고장등록 버튼 표시 -->
					   
					        <button type="button" class="btn btn-primary" onclick="postFormSubmit2('addUser',$('#modalMemberNum').val());">락커등록</button>
					        <button type="button" class="btn btn-warning" onclick="postFormSubmit2('setRepair');">고장등록</button>
					    
                      </div>
                    </form>
                    
                    <script>
                    	function postFormSubmit2(url){
                    		 if (url === 'setRepair') {
                    		        var lockerNumber = document.getElementById('sm-lkNo').value;

                    		        // 기존의 데이터를 초기화
                    		        $("#postForm2").empty();

                    		        // 필요한 데이터를 추가
                    		        $("<input />").attr("type", "hidden")
                    		            .attr("name", "lockerNum")
                    		            .attr("value", lockerNumber)
                    		            .appendTo("#postForm2");
                    		    }
                    		$("#postForm2").attr("action", url).submit();
                    	}
                    </script>
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
  

<script>
    // 페이지가 로드된 후 실행될 함수
    document.addEventListener('DOMContentLoaded', function () {
        // 모든 락커 엘리먼트를 선택
        var lockerElements = document.querySelectorAll('.locker');

        // 각 락커 엘리먼트에 클릭 이벤트 핸들러 추가
        lockerElements.forEach(function (locker) {
            locker.addEventListener('click', function () {
                // 락커 번호 가져오기
                var lockerNumber = locker.innerText;
               /*  var memberNum = locker.dataset.memberNum; */
                // 모달 타이틀 업데이트
                document.getElementById('sp-lkNo').innerText = lockerNumber;

                // 락커 번호를 모달 폼의 hidden 필드에 설정
                document.getElementById('sm-lkNo').value = lockerNumber;
/*                 document.getElementById('modalMemberNum').value = memberNum;
 */                // 모달 열기
                
                $('#enrollModal').modal('show');
            });
        });
    });
</script>

<script>
    $('#enrollModal').on('show.bs.modal', function (event) {
        var modal = $(this);
        var selectedMemberNum = modal.find('#defaultSelect').val();
        modal.find('#modalMemberNum').val(selectedMemberNum);
    });
</script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>