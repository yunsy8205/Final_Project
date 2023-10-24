package com.cloud.pt.config;

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
public class SocketHandler extends TextWebSocketHandler{
	// WebSocketSession : 연결될 때 생기는 연결정보를 담고있는 객체
    // => 핸들러에서 웹소켓 통신에대한 처리를 하기위해 이 세션들을 자바의 컬렉션으로 관리하는 경우가 많다.
    // 아래처럼 연결이 맺어질때 컬렉션에 WeSocketSession 을 추가하고, 연결이 끊어질때 제거하도록 구현을 해놓았다.
    // 이렇게 세션을 관히하면, 모든 클라이언트들에게 메시지를 보내는 것과 같은 처리를 할 수 있게됩니다.
    private final Set<WebSocketSession> sessions = ConcurrentHashMap.newKeySet();

    // afterConnectionEstablished : 웹소켓 연결 시
    @Override
    public void afterConnectionEstablished(WebSocketSession session){
        sessions.add(session); // 연결이 맺어질때 컬렉션에 WeSocketSession 을 추가
    }

    // handleTextMessage : 데이터 통신 시
    // 웹소켓 서버에 연결된 다른 사용자에게 나의 접속여부를 전달해주는 로직 구현
    // => 기존 접속 사용자의 웹소켓 세션을 전부 관리하고 있어야한다. 세션 아디이
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
        String payload = message.getPayload();
        log.info("payload : " + payload);
        JSONPObject jsonObject = new JSONPObject(payload, payload);
        for(WebSocketSession s : sessions){
            s.sendMessage(new TextMessage("Hi" + jsonObject));
        }
    }

    // afterConnectionClosed : 웹소켓 연결 종료시
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
        sessions.remove(session); // 연결이 끊어질때 WeSocketSession 을 제거
    }
}
