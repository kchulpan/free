package free.resist.service;

import java.util.HashMap;

public interface ResistService {

	void NewFreeLnRegist(HashMap<String, Object> map);

	// 아이디 중복체크
	int idcheck(String userid);

}
