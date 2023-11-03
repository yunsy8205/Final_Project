package com.cloud.pt.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.commons.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	//spEl
	@Value("${app.upload}")
	private String uploadPath;
	
	@Value("${app.upload.notice}")
	private String noticeName;
	
	
	public int setNoticeAdd(NoticeVO noticeVO, MultipartFile[] files)throws Exception{
		log.info("============uploadPath:{}============",uploadPath);
		int result = noticeDAO.setNoticeAdd(noticeVO);
		for(MultipartFile multipartFile : files) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			NoticeFileVO fileVO = new NoticeFileVO();
			String fileName = fileManager.save(this.uploadPath+this.noticeName, multipartFile);
			fileVO.setNoticeNum(noticeVO.getNoticeNum());
			fileVO.setFileName(fileName);
			fileVO.setOriName(multipartFile.getOriginalFilename());
			
			log.info("============oriName:{}============",fileVO.getOriName());
			result = noticeDAO.fileAdd(fileVO);
		}
		return result;
	}
	
	public NoticeVO getNoticeDetail(NoticeVO noticeVO)throws Exception{
		return noticeDAO.getNoticeDetail(noticeVO);
	}
	
	public List<NoticeVO> getNoticeList()throws Exception{
		return noticeDAO.getNoticeList();
	}

}
