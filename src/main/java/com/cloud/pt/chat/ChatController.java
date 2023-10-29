package com.cloud.pt.chat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.WebSocketSession;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/chat/*")
@Log4j2
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("chat")
    public String chatRoom(Model model, @RequestParam String roomId){
        RoomVO room = chatService.findRoomById(roomId);
        model.addAttribute("room",room);   //현재 방에 들어오기위해서 필요한데...... 접속자 수 등등은 실시간으로 보여줘야 돼서 여기서는 못함
        return "chat/chat";
    }
	
	@GetMapping("room")
	public String chatList(Model model) throws Exception{
		log.info("@ChatConroller, chatList()");
		
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		
		//직원 테이블에서 이름과 직급을 리스트로 가져옴 (자신 제외)
		List<EmployeeVO> list = chatService.getChatList(b.getName());
		
		model.addAttribute("list", list);
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
	
	@GetMapping("roomCheck")
	public String roomCheck(Model model, RoomVO roomVO)throws Exception{
		//자신의 아이디도 넣어줌
		//RoomVO roomVO = new RoomVO();
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		roomVO.setUser1(Long.valueOf(b.getName()));
		//roomVO.setUser2(Long.valueOf(user2));
		roomVO=chatService.roomCheck(roomVO);
		
		//방이 있을때 없을때(1,0 으로 결과)
		if(roomVO.getRoomNum()!= null) {
			
			model.addAttribute("result",1);
		}else {
			model.addAttribute("result",0);
		}
		
		return "commons/ajaxResult";
	}
}
