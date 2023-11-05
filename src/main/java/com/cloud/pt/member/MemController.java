package com.cloud.pt.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemController {

	@Autowired
	private MemService memService;
	
	
	
	@GetMapping("list")
	public String getMemberList(MemVO memVO,Pager pager , Model model)throws Exception{
		List<MemVO> ar = memService.getMemberList(memVO, pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "/member/list";
	}
	
	
	
	@GetMapping("add")
	public void setMemberAdd(MemVO memVO)throws Exception {
		
	}
	
	@PostMapping("add")
	public String setMemberAdd(MemVO memVO,Model model)throws Exception{
		int result = memService.setMemberAdd(memVO);
		
		return "redirect:/member/list";
	}
	
	
	@GetMapping("detail")
	public void getMemberDetail(MemVO memVO, Model model)throws Exception{
		memVO = memService.getMemberDetail(memVO);
		model.addAttribute("member", memVO);
	}
	
	
	@GetMapping("update")
	public void setMemberUpdate(MemVO memVO, Model model)throws Exception{
		memVO = memService.getMemberDetail(memVO);
		model.addAttribute("member", memVO);
	}
	
	@PostMapping("update")
	public String setMemberUpdate(MemVO memVO, RedirectAttributes attributes)throws Exception {
		memVO.setMemberNum(memVO.getMemberNum());
		
		int result = memService.setMemberUpdate(memVO);
		attributes.addAttribute("memberNum", memVO.getMemberNum());
		
		return "redirect:/member/detail";
	}
	
	
	@PostMapping("delete")
	public String setMemberDelete(MemVO memVO)throws Exception{
		
		int result = memService.setMemberDelete(memVO);
		
		return "redirect:/member/list";
	}
}
