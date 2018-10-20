package free.email.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import free.email.dao.MemberDao;
import free.email.vo.EmailVo;
@Repository("memberDao")
public class MemberDaoImpl implements MemberDao
{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public EmailVo sendEmailAction(HashMap<String, Object> map) {
		sqlSession.selectOne("Email.EmailSendPwd", map);
		List<EmailVo> freeln_pwd = (List<EmailVo>) map.get("result");
		EmailVo emailVo = freeln_pwd.get(0);
		System.out.println("dao:" + emailVo.getFreeln_pwd());
		return emailVo;
	}

}
