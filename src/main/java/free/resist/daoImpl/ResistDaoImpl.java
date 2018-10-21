package free.resist.daoImpl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import free.resist.dao.ResistDao;

@Repository("resistDao")
public class ResistDaoImpl implements ResistDao {

	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void NewFreeLnRegist(HashMap<String, Object> map) 
	{
		System.out.println("던지는 값:" + map);
		sqlSession.insert("Client_Reg.ClientReginsert", map);
		
	}

	@Override
	public int idcheck(String userid) 
	{
		int count = sqlSession.selectOne("Client_Reg.idDoubleCheck",userid);
		return count;
	}





}
