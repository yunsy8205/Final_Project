<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
    /* Remove default bullets */
ul, #myUL {
  list-style-type: none;
}

/* Remove margins and padding from the parent ul */
#myUL {
  margin: 0;
  padding: 0;
}

/* Style the caret/arrow */
.caret {
  cursor: pointer;
  user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret::before {
  content: "\25B6";
  color: black;
  display: inline-block;
  margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down::before {
  transform: rotate(90deg);
}

/* Hide the nested list */
.nested {
  display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active {
  display: block;
}
</style>
</head>

<body>
  
    <h3>결재선 선택</h3>
	<ul id="myUL">
		<li><span class="caret">대표</span>
			<ul class="nested">
                <c:forEach items="${employeeVO}" var="vo">
                    <c:if test="${vo.position=='대표'}">
                        <li id="ceo" class="ceo" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
                    </c:if>
                </c:forEach>
			</ul>
		</li>
        <li><span class="caret">총괄매니저</span>
			<ul class="nested">
                <c:forEach items="${employeeVO}" var="vo">
                    <c:if test="${vo.position=='총괄매니저'}">
                        <li id="general" class="general" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
                    </c:if>
                </c:forEach>
			</ul>
		</li>
        <li><span class="caret">인사매니저</span>
			<ul class="nested">
                <c:forEach items="${employeeVO}" var="vo">
                    <c:if test="${vo.position=='인사매니저'}">
                        <li id="personnel"class="personnel" data-empnum="${vo.employeeNum}" data-name="${vo.name}" data-position="${vo.position}">${vo.name}</li>
                    </c:if>
                </c:forEach>
			</ul>
		</li>
        <li><span class="caret">트레이너</span>
			<ul class="nested">
                <c:forEach items="${employeeVO}" var="vo" varStatus="i">
                    <c:if test="${vo.position=='트레이너'}">
                        <li id="trainer${i.index}" class="trainer">${vo.name}</li>
                    </c:if>
                </c:forEach>
			</ul>
		</li>
    </ul>
    <h3>선택한 사원</h3>
    <div id="middle" data-empnum=""  data-name="" data-position=""></div>
    <div id="last" data-empnum="" data-name="" data-position=""></div>
    <button type="button" id="okBtn">확인</button>
	<script src="/js/approval/line.js"></script>
</body>

</html>