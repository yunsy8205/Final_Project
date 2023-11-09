<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:forEach items="${career}" var="car">
      <input type="text" name="caTitle" value="${car.caTitle}" readonly="true">
      <input type="text" name="caPassDate" value="${car.caPassDate}" readonly="true">
    </c:forEach>
</body>
</html>