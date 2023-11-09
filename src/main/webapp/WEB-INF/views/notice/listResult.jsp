<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input-group">
									  <select id="kind" name="kind" class="select2 form-select" style="width: 15%;">
									  	<option selected value="title">Title</option>
									  	<option value="contents">Contents</option>
									  	<option value="name">Name</option>
									  </select>
									  <input type="text" class="form-control" id="search" style="width: 15%;"/>
									  <button
									    class="btn btn-outline-primary"
									    id="searchBtn"
									    type="button"
									    >
									    조회
									  </button>
									</div>
									
									<div style="display: flex; justify-content: flex-end;">
										<a class="a1 btn btn-primary" href="./add">글쓰기</a>
									</div>
									<!-- Hoverable Table rows -->
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
						<c:forEach items="${pinList}" var="p">
							<tr class="table-primary pinFont">
								<td>${p.noticeNum}</td>
								<td><span class="badge bg-label-primary me-1">${p.category}</span>
									<a class="a3" href="./detail?noticeNum=${p.noticeNum}">${p.title}</a></td>
								<td>${p.name}</td>
								<td>${p.modDate}</td>
								<td>${p.hit}</td>
							</tr>
						</c:forEach>
						<c:forEach items="${list}" var="li">
							<tr>
								<td>${li.noticeNum}</td>
								<td><span class="badge bg-label-primary me-1">${li.category}</span>
									<a class="a2" href="./detail?noticeNum=${li.noticeNum}">${li.title}</a></td>
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
					<c:if test="${pager.lastNum==0}">
						<li class="page-item">
							<button class="page-link" data-p="1">1</button>
						</li>
					</c:if>
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