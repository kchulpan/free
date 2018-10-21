package free.session.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.session.dao.SessionDao;
import free.session.vo.SessionVo;

@Service("sessionService")
public class SessionServiceImpl implements SessionService
{

	@Autowired
	SessionDao sessionDao;

	@Override
	public SessionVo login(HashMap<String, Object> map) {
		SessionVo vo = sessionDao.login(map);
		return vo;
	}



}
