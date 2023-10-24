<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/css.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/topScript.jsp"></c:import>
<link rel="stylesheet" href="/css/main.css" />

</head>
<body>
  <div id="wrap">
    <div>
      <h1>logo</h1>
      <form:form modelAttribute="employeeVO" method="post">
      	<form:label path="employeeNum">직원 아이디</form:label>
      	<form:input path="employeeNum"/>
      	<form:label path="password">비밀번호</form:label>
      	<form:password path="password"/>
      	<div>
          <input type="checkbox" id="rememberId" name="rememberId">
          <label for="rememberId">아이디저장</label>
        </div>
      	<button type="submit">로그인</button>
      </form:form>
    </div>
  </div>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
</html>