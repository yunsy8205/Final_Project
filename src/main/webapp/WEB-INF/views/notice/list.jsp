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
  <c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>

	<style>
    	h3 {
	    	margin-top: 40px !important;
	    	text-align: center;
	    }
	    .a1{
			color: white;
			margin: 10px 0;
			display: right;
		}
		.input-group{
			width: 50%;
			
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
			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				
				<!-- Content wrapper -->
				<div class="content-wrapper">
					 <!-- Content 내용 여기로 -->
					<div class="container-xxl flex-grow-1 container-p-y">
					<h3>공지사항</h3>
					
					<div class="row">
						<div class="nav-align-top mb-4">
							<ul class="nav nav-tabs nav-fill" role="tablist">
								<li class="nav-item">
									<button
									id="total"
									type="button"
									class="nav-link active"
									role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-justified-home"
									aria-controls="navs-justified-home"
									aria-selected="true"
									>
									<i class="tf-icons bx bx-home"></i> 전체
									</button>
								</li>
								<li class="nav-item">
									<button
									data-cat="인사"
									type="button"
									class="nav-link category"
									role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-justified-home"
									aria-controls="navs-justified-home"
									aria-selected="false"
									>
									<i class="tf-icons bx bx-user"></i> 인사
									</button>
								</li>
								<li class="nav-item">
									<button
									data-cat="시설"
									type="button"
									class="nav-link category"
									role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-justified-home"
									aria-controls="navs-justified-home"
									aria-selected="false"
									>
									<i class="fa-solid fa-dumbbell"></i> 시설
									</button>
								</li>
								<li class="nav-item">
									<button
									data-cat="휴무"
									type="button"
									class="nav-link category"
									role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-justified-home"
									aria-controls="navs-justified-home"
									aria-selected="false"
									>
									<i class="fa-solid fa-plane"></i> 휴무
									</button>
								</li>
								<li class="nav-item">
									<button
									data-cat="기타"
									type="button"
									class="nav-link category"
									role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-justified-home"
									aria-controls="navs-justified-home"
									aria-selected="false"
									>
									<i class="tf-icons bx bx-message-square"></i> 기타
									</button>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="navs-justified-home" role="tabpanel">
								
									<div class="input-group">
									  <select id="kind" name="kind" class="select2 form-select">
									  	<option selected value="title">Title</option>
									  	<option value="contents">Contents</option>
									  	<option value="name">Name</option>
									  </select>
									  <input type="text" class="form-control" id="search"/>
									  <button
									    class="btn btn-outline-primary"
									    id="searchBtn"
									    type="button"
									    >
									    조회
									  </button>
									</div>
									
									<div>
										<a class="a1 btn btn-primary" href="./add">등록</a>
									</div>
									<!-- Hoverable Table rows -->
									<div id="box">
										<div class="table-responsive text-nowrap">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>조회</th>
													</tr>
												</thead>
												<tbody class="table-border-bottom-0">
													<c:forEach items="${list}" var="li">
														<tr>
															<td>${li.noticeNum}</td>
															<td><span class="badge bg-label-primary me-1">${li.category}</span>
																<a href="./detail?noticeNum=${li.noticeNum}">${li.title}</a></td>
															<td>${li.name}</td>
															<td>${li.modDate}</td>
															<td>${li.hit}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<nav aria-label="Page navigation" style="background-color: white;">
											<ul id="pageBox" class="pagination justify-content-center">
												<li class="page-item prev ${pager.pre?'':'disabled'}">
													<button class="pageBtn page-link" data-p="${pager.startNum-1}">
														<i class="tf-icon bx bx-chevrons-left"></i>
													</button>
												</li>
												<c:forEach  begin="${pager.startNum}" end="${pager.lastNum}" var="i">
													<li class="page-item">
														<button class="pageBtn page-link" data-p="${i}">${i}</button>
													</li>
												</c:forEach>
												<li class="page-item next ${pager.next?'':'disabled'}">
													<button class="pageBtn page-link" data-p="${pager.lastNum+1}">
														<i class="tf-icon bx bx-chevrons-right"></i>
													</button>
												</li>
											</ul>
										</nav>
									</div>
									<!--/ Hoverable Table rows -->
								</div>
								<div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
								  
								</div>
								<div class="tab-pane fade" id="navs-justified-messages" role="tabpanel">
								  
								</div>
							</div>
						</div>
						<!-- /Account -->
						</div>
					</div>
				</div>
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
    <script>
    	$('#box').on("click",".pageBtn",function(){
    		console.log(this);
    		let page = $(this).attr("data-p");
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		
    		pager(page, search, kind);
    	});
    	
    	$('#searchBtn').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		console.log(kind);
    		let search = $('#search').val();
    		console.log(search);
    		console.log(page);
    		pager(page, search, kind);
    	});
    	
    	$('.category').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		let category = $(this).attr("data-cat");
    		console.log(category);
    		
    		catPager(page, search, kind, category);
    	});
    	
    	function pager(page, search, kind){
    		$.ajax({
    			type:"get",
    			url:"./totallist",
    			data:{
    				"page":page,
    				"search":search,
    				"kind":kind
    					
    			},
    			success:function(response){
    				// result 페이지를 하나 만들어 준다.
    				
    				if (response != null) {
	    				console.log(response);
	    				$('#box').empty();
	    				$('#box').append(response);

    					} else {
    					console.log("list 가져오기 실패");
    					}
    			},
    			error:function(){
    				console.log("ajax 실패");
    			}
    			})
    	}
    	
    	function catPager(page, search, kind, category){
    		$.ajax({
    			type:"get",
    			url:"./categorylist",
    			data:{
    				"page":page,
    				"search":search,
    				"kind":kind,
    				"category":category
    					
    			},
    			success:function(response){
    				// result 페이지를 하나 만들어 준다.
    				
    				if (response != null) {
	    				console.log(response);
	    				$('#box').empty();
	    				$('#box').append(response);

    					} else {
    					console.log("list 가져오기 실패");
    					}
    			},
    			error:function(){
    				console.log("ajax 실패");
    			}
    			})
    	}
    </script>
    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
  </body>
</html>