package free.main.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import free.main.dao.MainFreelnDao;
import free.main.vo.ProjectListVo;

@Repository("MainFreelnDao")
public class MainFreelnDaoImpl implements MainFreelnDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ProjectListVo> projectList(HashMap<String, Object> map) {
		sqlSession.selectList("FreelnMain.ProjectList",map);
		List<ProjectListVo> projectList = (List<ProjectListVo>) map.get("result");	
		/*System.out.println("MainFreelnDaoImpl"+projectList);*/
		return projectList;
	}

	@Override
	public int projectSignUp(HashMap<String, Object> map) {
		sqlSession.insert("FreelnMain.ProjectSignUp",map);	
		int result_val = (int) map.get("result_val");
		return result_val;
	}

}
