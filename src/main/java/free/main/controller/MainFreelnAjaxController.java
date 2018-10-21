package free.main.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import free.main.service.MainFreelnService;

@RestController
public class MainFreelnAjaxController {
	
	@Autowired
	MainFreelnService mainFreelnService;
	
	/*프로젝트 신청 & 중복 확인*/
	@RequestMapping("/ProjectSignUp")
	public int projectSignUp(@RequestParam HashMap<String,Object> map)
	{
		/*ModelAndView mv = new ModelAndView();*/
		
		map.put("freeln_id", "FREE0001");
		/*System.out.println("ProjectSignUp"+map.get("freeln_id"));
		System.out.println(map.get("project_id"));*/
		
		int result_val = mainFreelnService.projectSignUp(map);
		System.out.println("result_val"+result_val);
		
		/*mv.addObject("result_val",result_val);
		mv.setViewName("redirect:/Freelancer");*/
	/*	return "redirect:/Freelancer?result_val="+result_val;*/
		return result_val;
	}
}
