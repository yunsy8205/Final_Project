package com.cloud.pt.chat;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RoomVO {

	private String roomId;
    private String name;
    private Set<String> sessions = new HashSet<>();//아이디
    
}
