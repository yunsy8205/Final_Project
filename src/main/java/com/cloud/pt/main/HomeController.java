package com.cloud.pt.main;

import java.security.SecureRandom;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.pt.employee.EmployeeService;
import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.employee.PasswordVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@GetMapping("home")
	public String getIndex(Model model) throws Exception {
		
		SecurityContext context = SecurityContextHolder.getContext();
		
		Authentication a = context.getAuthentication();
		
		log.info("==>>> GetName :{}", a.getName());       // id
		log.info("==>>> GetPrincipal :{}", a.getPrincipal());  // 사용자 정보
		log.info("==>>> GetRole :{}", a.getAuthorities());// 사용자 권한s 
		log.info("==>>> STATE :{}", a.getPrincipal().toString());
		//int findIndex = a.getPrincipal().toString().indexOf("재직");
		
		
		log.info("==>>> index(재직) : {}", a.getPrincipal().toString().contains("재직"));
		boolean check = a.getPrincipal().toString().contains("재직");
		if(!check) {
			model.addAttribute("message", "퇴직처리 되었습니다. 그동안 수고 많으셨습니다!");
			model.addAttribute("url", "/");
			return "/commons/result";
		}
		
		return "home";
	}
	
	@GetMapping("/")
	public String getEmpLogin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		log.info("{}", passwordEncoder.encode("a12345678*"));
		return "/employee/login";
	}
	
	
	
	@GetMapping("findPw")
	public String getFindPw(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		Authentication con = SecurityContextHolder.getContext().getAuthentication();
		
		log.info("user >>>>>>>>>>>>>>>>> : {}", con.getPrincipal());
		
		return "/employee/findPw";
	}
	
	@PostMapping("/employee/findPw")
	public String getFindPw(EmployeeVO employeeVO,PasswordVO passwordVO, Model model)throws Exception{
		log.info("phone >>>> :{}", employeeVO.getPhone());
		log.info("name >>>> :{}", employeeVO.getName());
		log.info("num >>>> :{}", employeeVO.getEmployeeNum());
		model.addAttribute("phone", employeeVO.getPhone());
		model.addAttribute("employeeNum", employeeVO.getEmployeeNum());
		model.addAttribute("name", employeeVO.getName());
		
		employeeVO = employeeService.getFindPw(employeeVO);
		
		if(employeeVO == null) {
			model.addAttribute("check", 1);
			log.info("check null  : {}", model.getAttribute("check"));
			return "/employee/findPw";
		} else {
			model.addAttribute("check", 0);
			//model.addAttribute("pw", employeeVO.getPassword());
			model.addAttribute("phone", employeeVO.getPhone());
			model.addAttribute("employeeNum", employeeVO.getEmployeeNum());
			model.addAttribute("name", employeeVO.getName());
			log.info("check 0 : {}", model.getAttribute("check"));
		}
		
		log.info(">>>>>>>>>>>>>>>>>>>>> EMP findPw : {}", employeeVO.getPassword());
		
		return "/employee/findPw";
	}
	
	//비밀번호 변경시 랜덤비밀번호 문자전송
	@GetMapping("phonePw")
	public String phoneFw(@RequestParam("phone") String userPhoneNumber,String employeeNum,@RequestParam("name") String name, EmployeeVO employeeVO,Model model) throws Exception { // 휴대폰 문자보내기
		log.info("phonePw get 들어옴");
		Random random = new Random();
//		StringBuffer randomBuf = new StringBuffer(); // 문자열 생성할 빈 문자열
//		for (int i = 0; i < 8; i++) {
//			// Random.nextBoolean() : 랜덤으로 true, false 리턴(8자리) (true : 랜덤 소문자 영어, false : 랜덤 숫자)
//			if (random.nextBoolean()) {
//				// 26 : a-z 알파벳 개수
//				// 97 : letter 'a' 아스키코드
//				// (int)(random.nextInt(26)) + 97 : 랜덤 소문자 아스키코드
//				randomBuf.append((char)((int)(random.nextInt(26)) + 97));
//			} else {
//				randomBuf.append(random.nextInt(10));
//			}
//		}
		
		//String randomStr = randomBuf.toString();
		int length = 8;
		String randomStr = generateRandomString(length);
		
		employeeVO.setEmployeeNum(employeeVO.getEmployeeNum());
		employeeVO.setPassword(randomStr);
		employeeVO.setName(employeeVO.getName());
		//System.out.println(randomStr);
		employeeVO.setPassword(randomStr); employeeService.certifiedPhoneNumber(userPhoneNumber, randomStr);
		int result = employeeService.setFindPwUpdate(employeeVO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	public static String generateRandomString(int length) {
        String characters = "abcdefghijklmnopqrstuvwxyz0123456789*@#$%^&+=";
        StringBuilder randomString = new StringBuilder();
        SecureRandom random = new SecureRandom();
        
        // 무작위 숫자, 특수문자, 소문자 각각 1자리씩 미리 추가
        randomString.append(characters.charAt(random.nextInt(10))); // 무작위 숫자 10개
        randomString.append(characters.charAt(26 + random.nextInt(10))); // 무작위 특수문자 10개
        randomString.append(characters.charAt(36 + random.nextInt(26))); // 무작위 소문자 26개
        
        for (int i = 0; i < length - 3; i++) { // 특수+숫자+소문자 1자리씩 필수로 넣고 나머지 길이만큼 랜덤 선택.
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            randomString.append(randomChar);
        }

        return randomString.toString();
    }
	
}
