package com.cloud.pt.myPtMember;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ptClass/*")
@Slf4j
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("myPtList")
	public void getPtList(Model model,MemberVO memberVO) throws Exception{
		
		List<MemberVO> ar = memberService.getPtList(memberVO);
		model.addAttribute("list", ar);
		
	}
}
