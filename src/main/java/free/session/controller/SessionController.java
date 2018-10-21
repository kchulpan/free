package free.session.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import free.session.service.SessionService;
import free.session.vo.SessionVo;


@Controller
public class SessionController 
{
	//로그인 정보를 보관할 session 설정
	private HttpSession session;
	
	@Autowired
	private SessionService sessionService;
	
	@RequestMapping("/LoginProcess")
	public ModelAndView loginProcess(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request)
	{
		//map{userid, userpass}
		ModelAndView mav = new ModelAndView();
		
		SessionVo vo  = sessionService.login(map);
		String check_id = (String)(vo.getUserid().substring(0, 1));
		if(check_id.equals("0"))//로그인 성공
		{
			System.out.println("프리랜서 로그인 성공");
			String userid = vo.getUserid();
			
			session = request.getSession();
			session.setAttribute("userid", userid);
			//프리랜서 메인 페이지로 가야함
			mav.setViewName("FREELNMAIN/freelnMain");
			mav.addObject("vo",vo);
		}
		else if(check_id.equals("A"))//로그인 성공
		{
			System.out.println("관리자 로그인 성공");
			String userid = vo.getUserid();
			
			session = request.getSession();
			session.setAttribute("userid", userid);
			mav.setViewName("ADMIN/00_COMMON/sub_page");
			mav.addObject("vo",vo);
		}
		else //로그인 실패
		{
			System.out.println("로그인 실패");
			mav.setViewName("LOGIN/login");
		}
		return mav;
	}
	
	@RequestMapping("/Logout")
	public ModelAndView logout(HttpSession session)
	{
		session.invalidate(); // 세션 전체 초기화
		//session.removeAttribute("userid"); 세션해당키만 지움
		
		ModelAndView mav = new ModelAndView("LOGIN/login");
		
		return mav;
	}
	
/*	@RequestMapping
	public ModelAndView openLogin(HttpServletRequest request, HttpServletResponse response, CommandMap commanMap)
	throws Exception
	{
		ModelAndView mav = new ModelAndView();
		// 세션정보가 null 이 아닐때
		if(request.getSession().getAttribute("loginInfo")!=null)
		{
			String msg = "이미 로그인 되었습니다.";
			mav.addObject("msg", msg);
			mav.setViewName("프리랜서or관리자 페이지");
		}
		else
		{
			mav.setViewName("LOGIN/login");
		}
		return mav;
		
	}
	
	@RequestMapping("/LoginCheck")
	public ModelAndView login(HttpServletRequest request, Map<String,Object> commandMap)
	throws Exception
	{
		ModelAndView mav = new ModelAndView();
		System.out.println(commandMap);
		Map<String, Object> map = SessionService.selectUserInfo(commandMap);
		
		//로그인 정보가 있다면 로그인
		if(map == null)
		{
			mav.addObject("msg", "로그인에 실패하였습니다");
		}
		else
		{
			request.getSession().setAttribute("loginInfo", map);
			request.getSession().setMaxInactiveInterval(60*30);
			
			mav.addObject("msg", "로그인에 성공하였습니다");
		}
		return mav;
		
		
	}*/
}
