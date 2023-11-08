package com.cloud.pt.registration;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegistrationDAO {
	public int setAdd(RegistrationVO registrationVO) throws Exception;
	public int setUpdate(RegistrationVO registrationVO) throws Exception;
}
