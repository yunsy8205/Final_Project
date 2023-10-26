<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
      <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
      <div id="right">
        <header>
          <div class="header_wrap">
            <div class="header_message">
              <p>이재혁 님 환영합니다</p>
            </div>
            <div class="header_navi">
              <a href="#">조직도</a>
              <a href="#">로그인</a>
              <a href="#">로그아웃</a>
              <a href="#">마이페이지</a>
            </div>
          </div>
        </header>
        <!-- main내용  -->
        <section id="mainContents">
        <h1>채팅방 생성</h1>
        	<div>
	       	<form action="/chat/createRoom" method="post">
		    	<input type="text" name="name" placeholder="채팅방 이름">
		    	<button type="submit" >방 만들기</button>
			</form>
	
			<table>
		    	<tr>
		    		<c:if test="${list ne null}">
			    		<c:forEach items="${list}" var="li">
					        <td>
						        <a>${li.roomId} ${li.name}</a>
					        </td>
			    		</c:forEach>
		    		</c:if>
		    	</tr>
			</table>
        </div>
        </section>
        
      </div>
    </div>
<script>
//let sock = new SockJS("/ws/chat");
const socket = new WebSocket("ws://localhost:82/ws/chat");

socket.onmessage=function(msg){
	console.log(msg.data);
	$('#msgArea').append(msg.data+"<br/>");
}

$('#button-send').click(function(){
	send();
})

function send(){
    
    let content=document.querySelector('#msg').value;
    var talkMsg={"type" : "TALK","roomId":"${room.roomId}" ,"sender":"chee","message":content};
    socket.send(JSON.stringify(talkMsg));
    msg.value = '';
   
}
    
</script>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
</html>