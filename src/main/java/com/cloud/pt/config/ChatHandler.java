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

  //private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();  
  private static Map<String, WebSocketSession> sessions = new HashMap<>();
  
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String payload = message.getPayload();
      log.info("payload : " + payload);
      log.info(session);
      //************************
//      chatService.getMemers().get("roomId").forEach(n -> {
//    	 sessions.get(n).sendMessage(message)
//    	  
//      });
      
      
      
      //**********************
      
      ChatMessageVO chatMessage = objectMapper.readValue(payload, ChatMessageVO.class);
      RoomVO room = chatService.findRoomById(chatMessage.getRoomId());
      log.info("꺼내온 방 아이디 : "+ room.getRoomId());

      //클라이언트에 전달
      //TextMessage msg=new TextMessage(session.getId()+">> "+message.getPayload());
      //Set<String> keys = map.keySet();
      //값 전체출력 : entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용하고, keySet() 메서드는 key의 값만 필요한 경우 사용합니다.
      
      String name = session.getPrincipal().getName();
      if (chatMessage.getType().equals(ChatMessageVO.MessageType.ENTER)) {
          //사용자가 방에 입장하면  Enter메세지를 보내도록 해놓음.  이건 새로운사용자가 socket 연결한 것이랑은 다름.
          //socket연결은 이 메세지 보내기전에 이미 되어있는 상태
//    	  if(room.getSessions().size() < 3) {
//        	  
//          }
    	  log.info(name);
    	  if(room.getUser1()==null) {
    		  
    		  room.setUser1(name);
    		  log.info("user1:"+room.getUser1());
    		  sessions.put(name, session);
    		  log.info("맵에 잘 들어갔나?:"+sessions.get(name));
    	  }else {
    		  if(room.getUser2()==null) {
    			  room.setUser2(name);
    			  log.info("user2:"+room.getUser2());
    			  sessions.put(name, session);
    		  }else {
    			  log.info("채팅방에 들어올 수 없습니다.");
    		  }
    	  }
    	  
    	  Set<WebSocketSession> chatMember = new HashSet<>();
    	  chatMember.add(sessions.get(room.getUser1()));
    	  log.info(sessions.get(room.getUser1()));
    	  chatMember.add(sessions.get(room.getUser2()));
    	  log.info(sessions.get(room.getUser2()));
    	  
          chatMessage.setMessage(chatMessage.getSender() + "님이 입장했습니다.");  //TALK일 경우 msg가 있을 거고, ENTER일 경우 메세지 없으니까 message set
          chatMember.parallelStream().forEach(roomSession -> {
    		  try {
    			roomSession.sendMessage(message);
    			log.info("받는 세션" + roomSession);
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	  });
          //sendToEachSocket(chatMember, new TextMessage(objectMapper.writeValueAsString(chatMessage)), room);
          
        
          
      }else if (chatMessage.getType().equals(ChatMessageVO.MessageType.QUIT)) {
          sessions.remove(session.getPrincipal().getName());
          
          Set<WebSocketSession> chatMember = new HashSet<>();
    	  chatMember.add(sessions.get(room.getUser1()));
    	  log.info(sessions.get(room.getUser1()));
    	  chatMember.add(sessions.get(room.getUser2()));
    	  log.info(sessions.get(room.getUser2()));
          chatMessage.setMessage(chatMessage.getSender() + "님이 퇴장했습니다..");
          sendToEachSocket(chatMember, new TextMessage(objectMapper.writeValueAsString(chatMessage)), room);
      
      }else {
    	  Set<WebSocketSession> chatMember = new HashSet<>();
    	  chatMember.add(sessions.get(room.getUser1()));
    	  log.info(sessions.get(room.getUser1()));
    	  chatMember.add(sessions.get(room.getUser2()));
    	  log.info(sessions.get(room.getUser2()));
          sendToEachSocket(chatMember, message, room); //입장,퇴장 아닐 때는 클라이언트로부터 온 메세지 그대로 전달.
      }
      
      
      //여러명 있을 때 반복자를 사용해 메세지를 뿌려주는 코드
      //Iterator<String> ite = keys.iterator();//Iterator : 반복자
      //while(ite.hasNext()) {
      //map.get(ite.next()).sendMessage(msg);
      //}
  }

  private void sendToEachSocket(Set<WebSocketSession> chatMember, TextMessage textMessage,RoomVO roomVO) throws IOException {
	  
	  chatMember.parallelStream().forEach(roomSession -> {
		  try {
			roomSession.sendMessage(textMessage);
			log.info("받는 세션" + roomSession);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  });

//	  sessions.parallelStream().forEach( roomSession -> {
//          try {
//              roomSession.sendMessage(message);
//          } catch (IOException e) {
//              throw new RuntimeException(e);
//          }
//      });

//          try {
//          } catch (IOException e) {
//              throw new RuntimeException(e);
//          };
	
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

