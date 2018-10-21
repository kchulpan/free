package free.main.dao;

import java.util.HashMap;
import java.util.List;

import free.main.vo.ProjectListVo;

public interface MainFreelnDao {

	List<ProjectListVo> projectList(HashMap<String, Object> map);

	int projectSignUp(HashMap<String, Object> map);

}
