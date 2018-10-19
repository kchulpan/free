/*package free.client.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import free.client.dao.FreeLnDao;
import free.client.vo.FreeLnVo;

@Repository("freeLnDao")
public class FreeLnDaoImpl implements FreeLnDao {
	
	@Autowired
	private SqlSession sqlSession = null;
	
	@Override
	//아이디 중복검사
	public int check_id(String freeln_id) throws Exception{
		return sqlSession.selectOne("FreeLn.check_id", freeln_id);
	}
	
	@Override
	//이메일 중복검사
	public int check_email(String freeln_email) throws Exception{
		return sqlSession.selectOne("FreeLn.check_email", freeln_email);
	}
	
	@Override
	//회원가입
	public int freeLn(FreeLnVo freeLn) throws Exception{
		return sqlSession.insert("FreeLn.freeln", freeLn);
	}
	
	
	
	
	
}
*/