package free.main.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import free.admin.service.FreelancerListService;
import free.admin.vo.FreelancerCareerVo;
import free.main.service.MainFreelnService;
import free.main.vo.ProjectListVo;

@Controller
public class MainFreelnController {
	
	@Autowired
	MainFreelnService mainFreelnService;
	
	@Autowired
	FreelancerListService freelancerListService;
	
	@RequestMapping("/Freelancer")
	public ModelAndView Freelancer(@RequestParam HashMap<String,Object> map)
	{
		ModelAndView mv = new ModelAndView();
		map.put("freeln_id", "FREE0001");
		List<ProjectListVo> projectList = mainFreelnService.projectList(map);
		List<FreelancerCareerVo> freelancerCareer = freelancerListService.freelancerCareerView(map);
		/*System.out.println("MainFreelnController"+freelancerCareer);*/
		/*System.out.println("MainFreelnController"+projectList);*/
		
		mv.addObject("projectList", projectList);
		mv.addObject("freelancerCareer", freelancerCareer);
		
		/*mv.addObject("result_val", map.get("result_val"));*/
		mv.setViewName("FREELNMAIN/freelnMain");
		return mv;
	}

	
	@RequestMapping("/ModifyMyInfo")
	public String modifyMyInfo()
	{
		return "FREELNMAIN/modifyMyInfo";
	}
}
