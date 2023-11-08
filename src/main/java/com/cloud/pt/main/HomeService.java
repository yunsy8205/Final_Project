package com.cloud.pt.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.notice.NoticeVO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;
	
	public List<NoticeVO> getNoticeList()throws Exception{
		return homeDAO.getNoticeList();
	}

}
