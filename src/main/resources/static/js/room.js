	const socket = new WebSocket("ws://localhost:82/ws/chat");
	
	socket.onopen = function (e) {
		console.log('open server!');
    };
    
	$('#button-send').click(function(){
		let roomNum = $('#button-send').attr("data-room");
		let num = $('#button-send').attr("data-receiver");
		send(roomNum, num);
	});
	
	$('.chatList').click(function(){
		
		//회원번호
		let employeeNum=$(this).attr("data-empNum");
		//db에서 방있는지 확인!
		roomCheck(employeeNum);	
	});
	
    
    socket.onclose=function(e){
        console.log('disconnet');
    };

    socket.onerror = function (e){
        console.log(e);
    };
	
	socket.onmessage=function(msg){
		let jsonObj = JSON.parse(msg.data);
		
		$('#msgArea').append(msg.data+"<br/>");
		
		// 보내온 값에서 방번호를 보내기 버튼의 속성에 저장해줌
		$('#button-send').attr("data-room",jsonObj.roomNum);
		$('#button-send').attr("data-receiver",jsonObj.receiver);
	};
	
	function roomCheck(employeeNum){
		
			$.ajax({
			type:"get",
			url:"./roomCheck",
			data:{
				"user2":employeeNum
			},
			success:function(response){
				r=response.trim();//방번호
	
	
				if(r>0){
					enterRoom(socket, employeeNum, r);
				}else{
					createRoom(employeeNum);
				}
			},
			error:function(){
				console.log("ajax 실패");
			}
			})	
	}
	
	function enterRoom(socket, num, roomNum){
		$('#msgArea').empty();
		let chatDate = getTodayDate();
	    let enterMsg={"type" : "ENTER","roomNum":roomNum,"receiver":num,"message":"","chatDate":chatDate};
	    socket.send(JSON.stringify(enterMsg));
	}
	
	function send(roomNum, num){
	    let content=document.querySelector('#msg').value;
        let chatDate = getTodayDate();
        let talkMsg={"type" : "TALK","roomNum":roomNum, "receiver":num,"message":content,"chatDate":chatDate};
        socket.send(JSON.stringify(talkMsg));
	    msg.value = '';
	   
	}
	
	//방나가기  function quit(){
	
	function createRoom(employeeNum){
		$.ajax({
			type:"post",
			url:"./createRoom",
			data:{
				"user2":employeeNum
			},
			success:function(response){
				r=response.trim();
				console.log(r);
				
				if(r>0){
					
				}else{
					createRoom(employeeNum);
				}
				
			},
			error:function(){
				console.log("ajax 실패");
			}
		})
	}
	
	function getTodayDate() {
	    let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)
	
	    let year = today.getFullYear(); // 2021
	    let month = ('0' + (today.getMonth() + 1)).slice(-2); // 12
	    let day = ('0' + today.getDate()).slice(-2); // 20
		let hours = ('0' + today.getHours()).slice(-2); 
 		let minutes = ('0' + today.getMinutes()).slice(-2);
		//let seconds = ('0' + today.getSeconds()).slice(-2); 
	    
	    let dateString = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes; // 2021.12.20
		
		console.log(dateString);

	    return dateString;
	}
