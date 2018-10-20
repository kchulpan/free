package free.email.controller;
import java.util.HashMap;


import free.email.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class MemberController 
{
	
	@Autowired
	private MemberService memberService;
	
	
	// 비밀번호 분실시 이메일로 전송
    @RequestMapping("/EmailSend")
    
    public ModelAndView sendEmailAction (@RequestParam HashMap<String, Object> map) throws Exception 
    {
    	ModelAndView mav = new ModelAndView();
	       String sendMail = memberService.sendEmailAction(map);
	       
	       if(sendMail == "Y")
	       {
	    	   mav.setViewName("./LOGIN/sendMail_Ok");
	       }else {
	    	   mav.setViewName("./LOGIN/sendMail_False");
	       }
		return mav;
	        
	}
}
 