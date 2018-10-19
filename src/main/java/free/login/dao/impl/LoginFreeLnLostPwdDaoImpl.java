package free.login.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import free.login.dao.LoginFreeLnLostPwdDao;

@Repository("loginFreeLnLostPwdDao")
public class LoginFreeLnLostPwdDaoImpl implements LoginFreeLnLostPwdDao
{
	@Autowired
	SqlSession sqlSession;
}
