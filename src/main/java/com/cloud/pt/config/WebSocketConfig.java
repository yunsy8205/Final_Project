package com.cloud.pt.config;

import java.util.logging.SocketHandler;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(signalSocketHandler(), "room")  // 웹소켓 서버의 엔드포인트는 url:/port/room 으로 정의하였다.
        .setAllowedOriginPatterns("*") // 큻라이언트에서 웹소켓 서버에 요청시 모든 요청을 수용한다.
        .withSockJS(); // 웹소켓을 지원하지 않는 브라우저에서도 비슷한 환경을 제공하도록 SockJS 라이브러리 활용
		
	}
	
	@Bean
    public TextWebSocketHandler signalSocketHandler(){ // TextWebSocketHandler 클래스를 웹소켓 핸들러로 정의
        return new com.cloud.pt.config.SocketHandler();
    }
	
}
