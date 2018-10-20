package free.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LoginController {
	
	@RequestMapping("/")
	public String logIn()
	{
		return "./LOGIN/login";
	}
	
	@RequestMapping("/LoginCheck")
	public String loginCheck(HttpServletRequest request, HttpServletResponse response) 
	{
		String freeln_phone =request.getParameter("freeln_phone");
		String userPassword =request.getParameter("userPassword");
		if(freeln_phone == null || freeln_phone.equals("")||userPassword == null || userPassword.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력해주세요");
			return "login.jsp";
		}
		int result = new ResistDao().login(freeln_phone, userPassword);
		if(result == 1 ) {
			request.getSession().setAttribute("freeln_phone", freeln_phone);
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "로그인에 성공했습니다.");
			return "index.jsp";
			
		} else if(result == 2) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "비밀번호를 확인하세요.");
			return "index.jsp";
			
		} else if(result == 0) {
		request.getSession().setAttribute("messageType", "오류메시지");
		request.getSession().setAttribute("messageContent", "아이디가 존재하지 않습니다.");
		return "index.jsp";
		
		} else if(result == -1) {
		request.getSession().setAttribute("messageType", "오류메시지");
		request.getSession().setAttribute("messageContent", "데이터베이스 오류가 발생했습니다.");
		return "index.jsp";
		
	}
		return "";
		
	}
	
	@RequestMapping("/RegisterCheck")
	public String registerCheck(HttpServletRequest request, HttpServletResponse response)
	{
		String userID = request.getParameter("userID");
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		String userProfile = request.getParameter("userProfile");
		
		if(userID == null || userID.equals("") || userPassword1 == null || userPassword1.equals("") ||
			userPassword2 == null || userPassword2.equals("") || userName == null || userName.equals("") ||
			userAge == null || userAge.equals("") || userGender == null || userGender.equals("") ||
			userEmail == null || userEmail.equals("")) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요");
			return "join.jsp";
			
	}
			if(!userPassword1.equals(userPassword2)) {
				request.getSession().setAttribute("messageType", "오류메시지");
				request.getSession().setAttribute("messageContent", "비밀번호가 서로 다릅니다.");
				return "join.jsp";
				
			}
			
			/*int result = new ResistDAO().register(userID, userPassword1, userName, userAge, userGender, userEmail, userProfile);
			if(result ==1 ) {
				request.getSession().setAttribute("userID", userID);
				request.getSession().setAttribute("messageType", "성공 메시지");
				request.getSession().setAttribute("messageContent", "회원 가입에 성공했습니다.");
				return "join.jsp";;
				
			} else {
				request.getSession().setAttribute("messageType", "오류메시지");
				request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
				return "join.jsp";;
				
			}*/return "";
	
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
	
	@RequestMapping("/sendMail_Ok")
	public String sendMailOk()
	{
		return "./LOGIN/login";
	}
	
	@RequestMapping("/sendMail_False")
	public String sendMailFalse()
	{
		return "./LOGIN/forgot-password";
	}
	
	

	

	
}