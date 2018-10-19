package free.login.controller;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import free.login.service.LoginFreeLnLostPwdService;

@Controller
public class LoginController {
	
	@RequestMapping("/")
	public String logIn()
	{
		return "./LOGIN/login";
	}
	@RequestMapping("/SubPage")
	public String subPage()
	{
		return "ADMIN/00_COMMON/sub_page";
	}
	@RequestMapping("/Register")
	public String register()
	{
		return "./LOGIN/register";
	}
	@RequestMapping("/Forgot-password")
	public String forgotpassword()
	{
		return "./LOGIN/forgot-password";
	}

	
	@Autowired
	LoginFreeLnLostPwdService loginChangeFreeLnPwdService;
	
	/*비밀번호 분실*/
	@RequestMapping("/freeLnLostPwd")
	public String freeLnLostPwd(@RequestParam HashMap<String, Object> map )
	{
		return null;
	}
	
}