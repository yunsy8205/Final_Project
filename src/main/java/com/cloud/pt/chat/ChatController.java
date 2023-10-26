package com.cloud.pt.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/chat/*")
@Log4j2
public class ChatController {
	
	
	private final ChatService chatService = new ChatService();
	
	@GetMapping("chat")
    public String chatRoom(Model model, @RequestParam String roomId){
        RoomVO room = chatService.findRoomById(roomId);
        model.addAttribute("room",room);   //현재 방에 들어오기위해서 필요한데...... 접속자 수 등등은 실시간으로 보여줘야 돼서 여기서는 못함
        return "chat/chat";
    }
	
	@GetMapping("room")
	public String chatList(Model model) throws Exception{
		log.info("@ChatConroller, chatList()");
		List<RoomVO> roomList = chatService.findAllRoom();
		log.info("chatList()끝");
		model.addAttribute("list", roomList);
		return "chat/room";
	}
	
	@PostMapping("createRoom")  //방을 만들었으면 해당 방으로 가야지.
    public String createRoom(Model model, @RequestParam String name, String username) {
		log.info("@ChatConroller, createRoom()");
		//방생성
		RoomVO room = chatService.createRoom(name);
		log.info(username);
		log.info("createRoom()끝");
        model.addAttribute("room",room);
        model.addAttribute("username",username);
        return "chat/chat";  //만든사람이 채팅방 1빠로 들어가게 됩니다
    }
}
