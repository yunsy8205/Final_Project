package com.cloud.pt.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.util.JSONPObject;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

//웹소캣 핸들러를 정의함
@Component
@Log4j2
public class ChatHandler extends TextWebSocketHandler{

  //private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
  private static Map<String,WebSocketSession> map = new HashMap<String,WebSocketSession>();

  @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String payload = message.getPayload();
      log.info("payload : " + payload);
      //클라이언트에 전달
      
      TextMessage msg=new TextMessage(session.getId()+">> "+message.getPayload());
     
      Set<String> keys = map.keySet();
      //값 전체출력 : entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용하고, keySet() 메서드는 key의 값만 필요한 경우 사용합니다.
     
      Iterator<String> ite = keys.iterator();//Iterator : 반복자
      while(ite.hasNext()) {
    	  map.get(ite.next()).sendMessage(msg);
      }
  }

  /* Client가 접속 시 호출되는 메서드 */
  @Override
  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      
	  map.put(session.getId(), session);
      log.info(session + " 클라이언트 접속");
  }

  /* Client가 접속 해제 시 호출되는 메서드드 */

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

      log.info(session + " 클라이언트 접속 해제");
      map.remove(session.getId(), session);
  }
}

