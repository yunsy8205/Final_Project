package com.cloud.pt.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/chat/*")
@Log4j2
public class ChatController {
	
	@GetMapping("chat")
	public String chatGet() {
		log.info("@ChatConroller, chat GET()");
		
		return "chat/chat";
	}

}
