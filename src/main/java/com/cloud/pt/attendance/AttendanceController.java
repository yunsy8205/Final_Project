package com.cloud.pt.attendance;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttendanceController {
	@Autowired
	private AttendanceService attendanceService;

	
	@GetMapping("/attendance/month")
	public List<Map<String, Object>> monthAttendance(@AuthenticationPrincipal EmployeeVO employeeVO) throws Exception {
		List<Map<String, Object>> list = attendanceService.getList(employeeVO);
//		System.out.println(list);
		
		JSONObject jsonObj; 
		JSONArray jsonArr = new JSONArray(); //대괄호
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i<list.size(); i++) {
			map.put("title", list.get(i).get("STATE"));
			map.put("start", list.get(i).get("WORKDATE"));
			
			jsonObj = new JSONObject(map); //중괄호 {key:value, key:value}
			jsonArr.add(jsonObj); //대괄호 안에 넣어주기[{key:value, key:value},{key:value, key:value}]
		}
		
		log.info("jsonArr: {}", jsonArr);
		
		return jsonArr;
	}
	
	@GetMapping("/attendance/info")
	public String getInfo(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
//		log.info("vo: {}", employeeVO);
		AttendanceVO attendanceVO = attendanceService.getInfo(employeeVO);
		model.addAttribute("vo", attendanceVO);
//		List<AttendanceVO> ar = attendanceService.getList(employeeVO);
//		model.addAttribute("list", ar);
		
		return "attendance/info";
	}
	
	@GetMapping("/attendance/on")
	public String setOn(Principal principal, Model model) throws Exception {
		String employeeNum = principal.getName();
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmployeeNum(employeeNum);
		
		if(attendanceService.getInfo(employeeVO) == null) {
			model.addAttribute("result", 0);
		}else {
			model.addAttribute("result", 1);
		}
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/attendance/on")
	public String setOn(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
		int result = attendanceService.setOn(employeeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("/attendance/off")
	public String setOff(Principal principal, Model model) throws Exception {
		String employeeNum = principal.getName();
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmployeeNum(employeeNum);

		if(attendanceService.getInfo(employeeVO) != null) {
			if(attendanceService.getInfo(employeeVO).getOffTime() != null)
				model.addAttribute("result", 1);
		}else {
			model.addAttribute("result", 0);
		}
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/attendance/off")
	public String setOff(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
		int result = attendanceService.setOff(employeeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	//-----------------------------------------------------------
	@GetMapping("/admin/attendanceModify/detail")
	public String getDetail(AttendanceModifyVO attendanceModifyVO, Model model) throws Exception {
		AttendanceVO attendanceVO = attendanceService.getRequestDetail(attendanceModifyVO);
		model.addAttribute("vo", attendanceVO);
		
		return "attendance/adminDetail";
	}
	
	@GetMapping("/admin/attendanceModify/list")
	public String getList(Model model) throws Exception {
		List<AttendanceVO> ar = attendanceService.getRequestList();
		model.addAttribute("list", ar);
		
		return "attendance/adminList";
	}
	
	@PostMapping("/admin/attendanceModify/update")
	public String setUpdate(AttendanceVO attendanceVO, AttendanceModifyVO attendanceModifyVO) throws Exception {
		log.info("attendanceVO: {}", attendanceVO);
		log.info("attendanceModifyVO: {}", attendanceModifyVO);
		
		int result = attendanceService.setUpdate(attendanceVO, attendanceModifyVO);
		
		return "redirect:./list";
	}
	
	@GetMapping("/admin/attendanceMonth")
	public String getAdminMonth() {
		
		return "attendance/adminMonth";
	}
	
	@GetMapping("/admin/attendanceDay")
	public String getAdminDay() {
		
		return "attendance/adminDay";
	}
	
	//-----------------------------------------------------------
	@GetMapping("/attendanceModify/detail")
	public String getModifyDetail(AttendanceModifyVO attendanceModifyVO, Model model) throws Exception {
		attendanceModifyVO = attendanceService.getModifyDetail(attendanceModifyVO);
		model.addAttribute("vo", attendanceModifyVO);
		
		return "attendance/detail";
	}
	
	@GetMapping("/attendanceModify/list")
	public String getModifyList(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
		List<AttendanceVO> ar = attendanceService.getModifyList(employeeVO);
		model.addAttribute("list", ar);
		
		return "attendance/list";
	}

	@GetMapping("/attendanceModify/add")
	public String setModifyAdd() throws Exception {
		
		return "attendance/form";
	}
	
	@PostMapping("/attendanceModify/add")
	public String setModifyAdd(AttendanceModifyVO attendanceModifyVO, EmployeeVO employeeVO, RedirectAttributes attributes) throws Exception {
		int result = attendanceService.setModifyAdd(attendanceModifyVO, employeeVO);
		
		//파라미터 추가
		attributes.addAttribute("employeeNum", employeeVO.getEmployeeNum());
		
		return "redirect:./list";
	}
	
}
