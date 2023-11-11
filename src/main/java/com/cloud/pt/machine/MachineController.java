package com.cloud.pt.machine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.employee.EmployeeVO;

@RequestMapping("/machine/*")
@Controller
public class MachineController {

	@Autowired
	private MachineService machineService;
	
	
	@GetMapping("list")
	public void getList(MachineVO machineVO, Model model)throws Exception{
	
		List<MachineVO> ar = machineService.getList(machineVO);
		model.addAttribute("list", ar);
	}
	
	
	@GetMapping("add")
	public void setMachineAdd(MachineVO machineVO)throws Exception{
		
	}	
	@PostMapping("add")
	public String setMachineAdd(MachineVO machineVO, MultipartFile file, Model model)throws Exception{
		
		int result = machineService.setMachineAdd(machineVO, file);
		
		return "redirect:/machine/list";
		
	}
	
	
	@PostMapping("delete")
	public String setMachineDelete(MachineVO machineVO)throws Exception{
		int result = machineService.setMachineDelete(machineVO);
		
		return "redirect:./list";
	}
}
