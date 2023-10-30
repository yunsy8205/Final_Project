package com.cloud.pt.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

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
		

		return check;
	}
	
	
	
	@Transactional(rollbackFor = Exception.class)
	public int setJoin(EmployeeVO employeeVO)throws Exception{
		// 비밀번호 암호화
		employeeVO.setPassword(passwordEncoder.encode(employeeVO.getPassword()));
		
		int result = employeeDAO.setJoin(employeeVO);
		
		return result;
	}
	
}