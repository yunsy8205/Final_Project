package com.cloud.pt.locker;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/locker/*")
@Controller
public class LockerController {
	
	@GetMapping("lockerList")
	public String getLockerList(LockerVO lockerVO) throws Exception{
		
		
		return "locker/lockerList2";
	}
}
