package com.cloud.pt.config;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.cloud.pt.chat.ChatMessageVO;
import com.cloud.pt.chat.ChatService;
import com.cloud.pt.chat.RoomVO;
import com.fasterxml.jackson.core.sym.Name;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

//웹소캣 핸들러를 정의함
@Component
@Log4j2
public class ChatHandler extends TextWebSocketHandler{
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
    private ChatService chatService;

	private static Map<String, WebSocketSession> sessions = new HashMap<>();
  
	//private static Set<WebSocketSession> chatMember = new HashSet<>();
  
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String payload = message.getPayload();
      log.info("payload : " + payload);
      log.info(session);
      
      ChatMessageVO chatMessage = objectMapper.readValue(payload, ChatMessageVO.class);
      RoomVO room = chatService.findRoomById(chatMessage.getRoomId());
      log.info("꺼내온 방 아이디 : "+ room.getRoomNum());
      
      String name = session.getPrincipal().getName();
      if (chatMessage.getType().equals(ChatMessageVO.MessageType.ENTER)) {
  	  

    	  log.info(name);
    	  if(room.getUser1()==null) {
    		  
    		  room.setUser1(Long.valueOf(name));
    		  log.info("user1:"+room.getUser1());
    		  sessions.put(name, session);
    		  log.info("맵에 잘 들어갔나?:"+sessions.get(name));
    	  }else {
    		  if(room.getUser2()==null) {
    			  room.setUser2(Long.valueOf(name));
    			  log.info("user2:"+room.getUser2());
    			  sessions.put(name, session);
    		  }else {
    			  log.info("채팅방에 들어올 수 없습니다.");
    		  }
    	  }
	  
    	  
          chatMessage.setMessage(chatMessage.getSender() + "님이 입장했습니다.");  //TALK일 경우 msg가 있을 거고, ENTER일 경우 메세지 없으니까 message set

          
          sendToEachSocket(new TextMessage(objectMapper.writeValueAsString(chatMessage)), room);
          
        
          
      }else if (chatMessage.getType().equals(ChatMessageVO.MessageType.QUIT)) {
          sessions.remove(session.getPrincipal().getName());
          
          Set<WebSocketSession> chatMember = new HashSet<>();
    	  chatMember.add(sessions.get(room.getUser1()));
    	  log.info(sessions.get(room.getUser1()));
    	  chatMember.add(sessions.get(room.getUser2()));
    	  log.info(sessions.get(room.getUser2()));
          chatMessage.setMessage(chatMessage.getSender() + "님이 퇴장했습니다..");
          sendToEachSocket(new TextMessage(objectMapper.writeValueAsString(chatMessage)), room);
      
      }else {
    	  Set<WebSocketSession> chatMember = new HashSet<>();
    	  chatMember.add(sessions.get(room.getUser1()));
    	  log.info(sessions.get(room.getUser1()));
    	  chatMember.add(sessions.get(room.getUser2()));
    	  log.info(sessions.get(room.getUser2()));
          sendToEachSocket(message, room); //입장,퇴장 아닐 때는 클라이언트로부터 온 메세지 그대로 전달.
      }
      
  }

	private void sendToEachSocket(TextMessage textMessage,RoomVO room) throws IOException {
		Set<WebSocketSession> chatMember = new HashSet<>();
		
		chatMember.add(sessions.get(room.getUser1()));
        log.info("User1:"+sessions.get(room.getUser1()));
        if(sessions.get(room.getUser2())!= null) {
      	  
      	  chatMember.add(sessions.get(room.getUser2()));
      	  log.info("User2:"+sessions.get(room.getUser2()));
        }
        chatMember.parallelStream().forEach(a -> {
  		  try {
  			a.sendMessage(textMessage);

  			log.info("받는 세션" + a);
  		} catch (IOException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  	  });

}

/* Client가 접속 시 호출되는 메서드 */
  @Override
  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	  log.info(session + " 클라이언트 접속");
      String name = session.getPrincipal().getName();// config에 써준 코드 때문에 http세션을 가져옴
      log.info(session + name + " 클라이언트 접속");
      sessions.put(name, session);
  }

  /* Client가 접속 해제 시 호출되는 메서드드 */

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	  String name = session.getPrincipal().getName();
      log.info(session + name + " 클라이언트 접속 해제");
      sessions.remove(name);
  }
}

