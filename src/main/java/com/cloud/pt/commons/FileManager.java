package com.cloud.pt.commons;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	// file 저장 후, 파일명 리턴
	public String save (String path,MultipartFile multipartFile)throws Exception{
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
}
