package com.cloud.pt.registration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/registration/*")
public class RegistrationController {
	@Autowired
	private RegistrationService registrationService;
	
	@PostMapping("form")
	public String setAdd(RegistrationVO registrationVO, Model model) throws Exception {
		int result = registrationService.setAdd(registrationVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
}
