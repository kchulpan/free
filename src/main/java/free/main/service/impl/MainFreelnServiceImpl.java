package free.main.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.main.dao.MainFreelnDao;
import free.main.service.MainFreelnService;
import free.main.vo.ProjectListVo;

@Service("MainFreelnService")
public class MainFreelnServiceImpl implements MainFreelnService {

	@Autowired
	MainFreelnDao mainFreelnDao;
	
	@Override
	public List<ProjectListVo> projectList(HashMap<String, Object> map) {
		List<ProjectListVo> projectList = mainFreelnDao.projectList(map);	
		/*System.out.println("MainFreelnServiceImpl"+projectList);*/
		return projectList;
	}

	@Override
	public int projectSignUp(HashMap<String, Object> map) {
		int result_val = mainFreelnDao.projectSignUp(map);
		return result_val;
	}

}
