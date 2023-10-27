<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>회원조회</p>
<c:forEach items="${list}" var="vo">
<div>${vo.memberNum}</div>
<div>${vo.name}</div>
<div>${vo.phone}</div>
<div>${vo.gender}</div>
</c:forEach>


</body>
</html>