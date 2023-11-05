package com.cloud.pt.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.commons.FileManager;
import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class EmployeeService implements UserDetailsService{
	
	@Autowired
	private EmployeeDAO employeeDAO;
	// 비밀번호 암호화
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private FileManager fileManager;
	
	// properties 값을 java 사용. (@Value("${properties 키}"))
	@Value("${app.upload}")
	private String uploadPath;
	@Value("${app.upload.employee}")
	private String empFileName;
	
	
	
	
	
	// Login POST 처리 (SecurityConfig -> Service의 loadUserByUsername 메서드 실행)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO employeeVO = new EmployeeVO();
		log.info(">> 로그인 시도중 <<");
		log.info("num : {} ", username);
		employeeVO.setEmployeeNum(username);
		log.info("num : {} ",employeeVO.getEmployeeNum());

		// passwordEncoder.encode("비밀번호");
		System.out.println(passwordEncoder.encode("0000"));
		
		try {
			
			employeeVO = employeeDAO.getEmpLogin(employeeVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			employeeVO = null;
		}
		return employeeVO;
	}
	 
	
	
	public boolean getEmpError(EmployeeVO employeeVO, BindingResult bindingResult)throws Exception{
		// false(오류없음) | true(오류있음)

		// annotation 검증
		boolean check = bindingResult.hasErrors();

		return check;
	}
	
	
	@Transactional(readOnly=true)
	public Map<String,String> validateHandling(Errors errors)throws Exception{
		Map<String, String> validatorResult = new HashMap<>();
		
		for(FieldError error : errors.getFieldErrors()) {
			String validKeyName = String.format("valid_%s", error.getField());
			validatorResult.put(validKeyName, error.getDefaultMessage());
		}
		return validatorResult;
	}
	
	
	public EmployeeVO getInfo(EmployeeVO employeeVO)throws Exception{
		return employeeDAO.getInfo(employeeVO);
	}
	
	public int setInfoUpdate(EmployeeVO employeeVO, MultipartFile proFile)throws Exception{
		
		String fileName = fileManager.save(this.uploadPath+this.empFileName, proFile);
		
		employeeVO.setProFile(fileName);
		employeeVO.setProOriginal(proFile.getOriginalFilename());
		
		return employeeDAO.setInfoUpdate(employeeVO);
		
	}
	
	
	
	// -------------------------------------------------
	
	public int setPwUpdate(EmployeeVO employeeVO)throws Exception{
		// 비밀번호 암호화
		employeeVO.setPassword(passwordEncoder.encode(employeeVO.getNewPw()));
				
		return employeeDAO.setPwUpdate(employeeVO);
	}
	
	public boolean getNewPwCheck(EmployeeVO employeeVO, BindingResult bindingResult)throws Exception{
		// false(오류없음) | true(오류있음)
		boolean check = false;
		
		// 1. password 일치 검증
		if(!employeeVO.getNewPw().equals(employeeVO.getPwCheck())) {
			check = true;  //check=!check;
			
			// reject ("VO명", "properties에 적힐 키이름")
			bindingResult.rejectValue("pwCheck", "employeeVO.password.equalCheck");
		}
		
		return check;
	}
	
	
	
	
	
	@Transactional(rollbackFor = Exception.class)
	public int setJoin(EmployeeVO employeeVO, MultipartFile proFile)throws Exception{
		// 비밀번호 암호화
		employeeVO.setPassword(passwordEncoder.encode(employeeVO.getPassword()));
		
		// file 등록
		String fileName = fileManager.save(this.uploadPath+this.empFileName, proFile);
		
		employeeVO.setProFile(fileName);
		employeeVO.setProOriginal(proFile.getOriginalFilename());
		
		int result = employeeDAO.setJoin(employeeVO);

			

		return result;
	}
	
	
	
	public List<EmployeeVO> getEmpList(EmployeeVO employeeVO, Pager pager)throws Exception{
		Map<String, Object> map = new HashMap<>();
		pager.makeRowNum();
		Long total = employeeDAO.getEmpTotal(pager);
		pager.makePageNum(total);
		
		map.put("pager", pager);
		map.put("emp", employeeVO);
		
		return employeeDAO.getEmpList(map);
	}
	
	
	public EmployeeVO getEmpDetail (EmployeeVO employeeVO)throws Exception{
		return employeeDAO.getEmpDetail(employeeVO);
	}
	
	public int setEmpUpdate (EmployeeVO employeeVO)throws Exception{
		return employeeDAO.setEmpUpdate(employeeVO);
	}
	
	public int setEmpDelete (EmployeeVO employeeVO)throws Exception{
		return employeeDAO.setEmpDelete(employeeVO);
	}
}
