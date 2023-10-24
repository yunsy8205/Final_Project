<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title he</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body id="page-top">
<section class="container mt-5">
	<table>
		<thead>
			<tr>
				<th>기안일</th>
				<th>결재양식</th>
				<th>제목</th>
				<th>문서번호</th>
				<th>결재상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.regDate}</td>
					<td>${vo.category}</td>
					<td>${vo.title}</td>
					<td>${vo.approvalNum}</td>
					<td>${vo.state}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
</body>
</html>