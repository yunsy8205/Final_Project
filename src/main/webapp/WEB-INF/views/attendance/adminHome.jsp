<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    h3 {
      margin-top: 40px !important;
      text-align: center;
    }
    #req_btn {
      text-align: right;
      margin: 30px;
    }
     /* 아이콘 버튼에 대한 스타일 */
    .icon_btn {
      background-color: rgba(255, 255, 255, 0); /* 버튼 배경색 설정 */
      color: #000000; /* 버튼 텍스트 색상 설정 */
      border: none;
      padding: 10px 20px;
      cursor: pointer;
    }
  </style>

  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
    
  <!-- moment lib -->
  <script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>
  
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

                <div class="nav-align-top mb-4">
                  <ul class="nav nav-tabs nav-fill" role="tablist">
                    <li class="nav-item">
                      <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="true">
                        전체 트레이너 근태 조회 
                      </button>
                    </li>
                    <li class="nav-item">
                      <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="false">
                        근태 수정 요청 목록
                      </button>
                    </li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane fade show active" id="navs-justified-home" role="tabpanel">
                      <h3>
                        <button class="icon_btn" id="pre_month"><i class="fa-solid fa-chevron-left fa-xs"></i></button>
                          <span id="work" data-date="${date}-01">${date}</span>
                        <button class="icon_btn" id="next_month"><i class="fa-solid fa-chevron-right fa-xs"></i></button>
                      </h3>
                      
                      <div>
                        <form id="frm" method="get" action="./month">
                            <input type="hidden" value="1" name="page" id="page">
                            <select name="kind" class="form-select" id="k" data-kind="${pager.kind}" aria-label="Default select example">
                                <option class="kind" value="name">이름</option>
                                <option class="kind" value="state">상태</option>
                            </select>
                            <input type="text" name="search" value="${pager.search}" placeholder="검색어를 입력하세요" class="form-control" aria-label="Search">
                            <button type="button" id="submit_btn" class="btn btn-primary">조회</button>
                        </form>
                      </div>
        
                      <button id="day_btn" class="btn btn-primary">당일 근태 확인</button>
                      
                      <c:if test="${not empty list}">   
                      <div class="card">
                        <div id="attendance_day" class="table-responsive text-nowrap">
                          <table class="table table-hover">
                            <thead>
                              <tr>
                                <th>번호</th>
                                <th>이름</th>
                                <th>출근시간</th>
                                <th>퇴근시간</th>
                                <th>상태</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${list}" var="vo" varStatus="i">
                                <tr>
                                  <td>${i.index+1}</a></td>
                                  <td>${vo.employeeVO.name}</td>
                                  <td>${vo.onTime}</td>
                                  <td>${vo.offTime}</td>
                                  <td>${vo.state}</td>
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
                            <a class="page-link move" data-num="${i}" href="#">${i}</a>
                          </li>
                        </c:forEach>
                        <li class="page-item next ${pager.next?'':'disabled'}">
                          <a class="page-link move" data-num="${pager.lastNum+1}" href="#"><i class="tf-icon bx bx-chevrons-right"></i></a>
                        </li>
                      </ul>
                      </c:if>
                    </div>
                    <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
                      <p>
                        Donut dragée jelly pie halvah. Danish gingerbread bonbon cookie wafer candy oat cake ice
                        cream. Gummies halvah tootsie roll muffin biscuit icing dessert gingerbread. Pastry ice cream
                        cheesecake fruitcake.
                      </p>
                      <p class="mb-0">
                        Jelly-o jelly beans icing pastry cake cake lemon drops. Muffin muffin pie tiramisu halvah
                        cotton candy liquorice caramels.
                      </p>
                    </div>
                   
                  </div>
                </div>

              </div>
                         

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
  
  <script src="/js/list.js"></script>
  <script src="/js/attendance/date.js"></script>

</body>
</html>