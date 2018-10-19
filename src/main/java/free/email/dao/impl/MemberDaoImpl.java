package free.email.dao.impl;

import java.util.Map;
import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;

import free.email.dao.MemberDao;
@Repository("memberDao")
public class MemberDaoImpl implements MemberDao
{
	/*Logger log = Logger.getLogger(this.getClass());*/
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String getPw(Map<String, Object> paramMap) {
		sqlSession.selectOne("emailSendPw", paramMap);
		return null;
	}

}
