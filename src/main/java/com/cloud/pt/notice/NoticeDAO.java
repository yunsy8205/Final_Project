package com.cloud.pt.notice;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	
	public int setNoticeAdd(NoticeVO noticeVO)throws Exception;

}
