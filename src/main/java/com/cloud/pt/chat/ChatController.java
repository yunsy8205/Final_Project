package com.cloud.pt.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/chat/*")
@Log4j2
public class ChatController {
	
	@GetMapping("chat")
	public String chatGet(Model model) {
		log.info("@ChatConroller, chat GET()");
		
		List<String> list = new ArrayList<>();
		list.add("ADMIN");
		list.add("USER");
		
		model.addAttribute("list", list);
		
		return "chat/chat";
	}
}
