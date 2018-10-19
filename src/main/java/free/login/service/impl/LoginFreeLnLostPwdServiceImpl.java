package free.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.login.dao.LoginFreeLnLostPwdDao;

@Service("loginChangeFreeLnPwdService ")
public class LoginFreeLnLostPwdServiceImpl implements LoginFreeLnLostPwdDao
{
	@Autowired
	LoginFreeLnLostPwdDao loginChangeFreeLnPwdDao;
}
