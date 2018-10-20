package free.email.dao;

import java.util.HashMap;
import java.util.Map;

import free.email.vo.EmailVo;

public interface MemberDao 
{

	public EmailVo sendEmailAction(HashMap<String, Object> map);

}
