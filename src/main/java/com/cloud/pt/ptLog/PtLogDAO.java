package com.cloud.pt.ptLog;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PtLogDAO {

	public ArrayList<PtLogVO> getTypeLog() throws Exception;
}
