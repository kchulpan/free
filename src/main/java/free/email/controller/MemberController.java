package free.email.controller;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import free.email.vo.EmailSender;
import free.email.service.MemberService;
import free.email.vo.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class MemberController {
	@Autowired
	   private EmailSender emailSender;
	   @Autowired
	   private Email email;
	    @RequestMapping("/EmailSend")
	    public ModelAndView sendEmailAction (@RequestParam HashMap<String, Object> map, ModelMap model) throws Exception {
	        ModelAndView mav;
	        String freeln_phone=(String) map.get("freeln_phone");
	        String freeln_mail=(String) map.get("freeln_mail");
	        String pw=mainService.getPw(map);
	        System.out.println(pw);
	        if(pw!=null) {
	            email.setContent("비밀번호는 "+pw+" 입니다.");
	            email.setReceiver(freeln_mail);
	            email.setSubject(freeln_phone+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("redirect:/login.do");
	            return mav;
	        }else {
	            mav=new ModelAndView("redirect:/logout.do");
	            return mav;
	        }
	    }

 
}
 