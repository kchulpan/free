package free.login.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import free.login.service.LoginFreeLnLostPwdService;

@Controller
public class LoginController {
	

	
	@Autowired
	LoginFreeLnLostPwdService loginChangeFreeLnPwdService;
	
	/*비밀번호 분실*/
	@RequestMapping("/freeLnLostPwd")
	public String freeLnLostPwd(@RequestParam HashMap<String, Object> map )
	{
		return "/";
		
	}
	
}