package com.cloud.pt.locker;

import java.util.List;

public interface LockerDAO {

	public List<LockerVO> getLockerList(LockerVO lockerVO) throws Exception;
	
}
