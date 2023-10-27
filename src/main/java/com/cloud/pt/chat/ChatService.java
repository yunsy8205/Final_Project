package com.cloud.pt.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Getter
public class ChatService {
	
	private final ObjectMapper objectMapper = new ObjectMapper();
    private Map<String, RoomVO> chatRooms = new HashMap<>();
    private Map<String, Set<String>> memers = new HashMap<>();

//    @PostConstruct
//    private void init() {
//        chatRooms = new LinkedHashMap<>();
//    }

    public List<RoomVO> findAllRoom() throws Exception{

    	return new ArrayList<>(chatRooms.values());
    	
    }

    public RoomVO findRoomById(String roomId) {
        
    	List<RoomVO> a = new ArrayList<>(chatRooms.values());
    	for(RoomVO c:a) {
    		
    		log.info(c.getRoomId());
    		
    	}
    	return chatRooms.get(roomId);
    }

    public RoomVO createRoom(String name) {
        String randomId = UUID.randomUUID().toString();
        RoomVO roomVO = new RoomVO();
        roomVO.setRoomId(randomId);
        roomVO.setName(name);
        
        chatRooms.put(randomId, roomVO);
        log.info("============="+(chatRooms.get(randomId)).getRoomId());
        return roomVO;
    }

}
