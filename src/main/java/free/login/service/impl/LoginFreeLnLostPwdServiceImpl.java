package free.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.login.dao.LoginFreeLnLostPwdDao;
import free.login.service.LoginFreeLnLostPwdService;

@Service("loginFreeLnLostPwdService ")
public class LoginFreeLnLostPwdServiceImpl implements LoginFreeLnLostPwdService
{
	@Autowired
	LoginFreeLnLostPwdDao loginChangeFreeLnPwdDao;
}
