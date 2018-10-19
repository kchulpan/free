package free.email.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.email.dao.MemberDao;
import free.email.service.MemberService;
@Service("memberService")
public class MemberServiceImpl implements MemberService
{
	//Logger log = Logger.getLogger(this.getClass());
	
	 @Autowired
	 MemberDao memberDao;
	
	
	@Override
	public String getPw(Map<String, Object> paramMap) {
		return memberDao.getPw(paramMap);
	}

}
