package free.main.service;

import java.util.HashMap;
import java.util.List;

import free.main.vo.ProjectListVo;

public interface MainFreelnService {

	List<ProjectListVo> projectList(HashMap<String, Object> map);

	int projectSignUp(HashMap<String, Object> map);

}
