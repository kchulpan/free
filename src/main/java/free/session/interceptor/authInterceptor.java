package free.session.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class authInterceptor extends HandlerInterceptorAdapter
{
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	// 컨트롤러보다 먼저 수행되는 Method
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 체크
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userid");
		
		System.out.println("현재경로:" + request.getRequestURI());
		
		// 두 컨트롤러를 체크에서 제외
		// case구문에 공백 넣지 말것
		switch(request.getRequestURI())
		{
		case"LOGIN/login":
		case"/LoginProcess":
			return true;
		}
		if(obj == null) //로그인 안된 상태임
		{
			response.sendRedirect("LOGIN/login");
			return false;
			//더이상 컨트롤러 요청으로 가지 않는다
		}
		else //로그인 된 상태
		{
			return true;
			//preHandler 의 return은 컨트롤러의 요청 uri로 가도 되는지 여부
		}
	}
	
	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 Method
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
