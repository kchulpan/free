package free.session.dao;

import java.util.HashMap;

import free.session.vo.SessionVo;

public interface SessionDao {

	SessionVo login(HashMap<String, Object> map);

}
