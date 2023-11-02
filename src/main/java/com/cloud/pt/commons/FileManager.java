package com.cloud.pt.commons;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;

import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.employee.EmployeeVO;

@Component
public class FileManager {
	
		
	// file 저장 후, 파일명 리턴
	public String save (String path, MultipartFile multipartFile)throws Exception{
		// 어떤 파일을 어디에 저장할지 설정!
		
		// 1. 파일 객체생성
		File file = new File(path);

		if(!file.exists()) {
			file.mkdirs();
		}
		

		// 2. 저장할 파일명
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		// 3. 파일 저장
		file = new File(file, fileName);

		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	
	// infoUpdate시 fileDelete
	public boolean fileDelete(String path, EmployeeVO employeeVO)throws Exception{
		// 1. file에 '삭제할 파일경로'(1)과 fileName 넣기
		File file = new File(path, employeeVO.getProFile());
				
		return file.delete();
	}

}

