<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
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
        <div>
        	<c:forEach items="${list}" var="f">
        		<div>${f}</div>
        	</c:forEach>
        </div>
        
         
        	<h1>채팅방</h1>
        	<div>
		        <div id="msgArea" class="col"></div>
			        <div class="col-6">
					    <div class="input-group mb-3">
					    	<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
							</div>
				    </div>
		        </div>
            </div>
        </section>
        
      </div>
    </div>
<script>
	//let sock = new SockJS("/ws/chat");
		let sock = new WebSocket("ws://localhost:82/ws/chat");
	
	sock.onmessage=function(msg){
		console.log(msg.data);
		$('#msgArea').append(msg.data+"<br/>");
	}
	
	$('#button-send').click(function(){
		send();
	})
	
	function send(){
	
	    let msg = document.getElementById("msg");
	
	    console.log(msg.value);
	    sock.send(msg.value);
	    msg.value = '';
	   
	}
    
</script>
</body>
<c:import url="/WEB-INF/views/layout/btmScript.jsp"></c:import>
</html>