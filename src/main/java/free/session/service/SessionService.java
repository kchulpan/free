package free.session.service;

import java.util.HashMap;

import free.session.vo.SessionVo;

public interface SessionService 
{
	SessionVo login(HashMap<String, Object> map);
}
