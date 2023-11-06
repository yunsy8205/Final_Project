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
    #membership {
      text-align: right;
      margin: 30px;
    }
    #pt_block {
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
          <!-- Layout container -->
          <div class="layout-page">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y">
                <h3>이용권 등록</h3>

                <form id="frm" method="post" action="/membership/add">
                  <div class="col-12">
                    <label for="name" class="form-label">이용권 이름</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="이용권 이름을 입력하세요">
                  </div>
                  <div class="row g-3">
                    <div class="col-md">
                      <label class="form-label">종류</label>
                      <div class="form-check form-check-inline mt-3">
                        <input class="form-check-input" type="radio" name="type" id="health" value="h" checked>
                        <label class="form-check-label" for="health">헬스</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="pt" value="p">
                        <label class="form-check-label" for="pt">PT</label>
                      </div>
                    </div>
                  </div>
                  <div class="col-12" id="month_block">
                    <label for="month" class="form-label">이용개월</label>
                    <input type="text" id="month" name="month" class="form-control" placeholder="이용개월을 입력하세요">
                  </div>
                  <div class="col-12" id="pt_block">
                    <label for="ptCount" class="form-label">피티횟수</label>
                    <input type="text" id="ptCount" name="ptCount" class="form-control" placeholder="피티횟수를 입력하세요요">
                  </div>
                  <div class="col-12">
                    <label for="price" class="form-label">가격</label>
                    <input type="text" id="price" name="price" class="form-control" placeholder="가격을 입력하세요">
                  </div>
                  <button type="button" id="before_btn" class="btn btn-primary">이전</button>
                  <button type="button" id="submit_btn" class="btn btn-primary">제출</button>
                </form>
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
  
  <script>

    //이전버튼
    $('#before_btn').on('click', function(){
      $(location).attr('href', '/membership/list');
    })
    
    //등록버튼
    $('#submit_btn').on('click', function(){
      $('#frm').submit();
    })


    //PT(라디오버튼) 클릭 시 
    $('#pt').on('click', function(){
      $('#month_block').css('display', 'none');
      $('#pt_block').css('display', 'block');
    })

    //헬스(라디오버튼) 클릭 시 
    $('#health').on('click', function(){
      $('#pt_block').css('display', 'none');
      $('#month_block').css('display', 'block');
    })
  </script>

</body>
</html>