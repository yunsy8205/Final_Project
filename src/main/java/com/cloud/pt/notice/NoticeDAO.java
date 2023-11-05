package com.cloud.pt.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	
	public int setNoticeAdd(NoticeVO noticeVO)throws Exception;
	
	public int fileAdd(NoticeFileVO noticefileVO)throws Exception;
	
	public NoticeVO getNoticeDetail(NoticeVO noticeVO)throws Exception;
	
	public List<NoticeVO> getNoticeList()throws Exception;
	
	public NoticeFileVO getFile(NoticeFileVO noticeFileVO)throws Exception;
	
	public int setNoticeDelete(NoticeVO noticeVO)throws Exception;
	
	public List<NoticeFileVO> getFileDelete(NoticeVO noticeVO)throws Exception;
	

}
