<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title he</title>
</head>
<body>
	<h1>approval 메인</h1>
	
	<a href="./select">새 결재 작성</a>
	<table>
		<thead>
			<tr>
				<th>기안일</th>
				<th>결재양식</th>
				<th>제목</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${wating}" var="wl">
				<tr>
					<td>${wl.regDate}
					<td>${wl.kind}
					<td>${wl.title}
					<td>${wl.state}
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>