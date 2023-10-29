package com.cloud.pt.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

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
	
	
	
	
	
	// Login POST 처리 (SecurityConfig -> Service의 loadUserByUsername 메서드 실행)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO employeeVO = new EmployeeVO();
		log.info(">> 로그인 시도중 <<");
		log.info("num : {} ", username);
		employeeVO.setEmployeeNum(username);
		log.info("num : {} ",employeeVO.getEmployeeNum());
		
		// passwordEncoder.encode("비밀번호");
		System.out.println(passwordEncoder.encode("1234"));
		
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
		boolean check = false;
		
//		if(employeeVO.getName() == null) {
//			check = true;
//			bindingResult.rejectValue("name", "empJoin.name");
//		}
//		if(employeeVO.getPhone() == null) {
//			check =true;
//			bindingResult.rejectValue("phone", "empJoin.phone");
//		}
//		if(employeeVO.getAddress() == null) {
//			check =true;
//			bindingResult.rejectValue("address", "empJoin.address");
//		}
//		if(employeeVO.getBirth() == null) {
//			check =true;
//			bindingResult.rejectValue("birth", "empJoin.birth");
//		}

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
	
	
	
	@Transactional(rollbackFor = Exception.class)
	public int setJoin(EmployeeVO employeeVO)throws Exception{
		// 비밀번호 암호화
		employeeVO.setPassword(passwordEncoder.encode(employeeVO.getPassword()));
		
		int result = employeeDAO.setJoin(employeeVO);
		
		return result;
	}
	
	
	
	public List<EmployeeVO> getEmpList(Pager pager)throws Exception{
		return employeeDAO.getEmpList(pager);
	}
}
