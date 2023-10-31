package kr.co.jojo.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Integer memberIdx = (Integer) session.getAttribute("memberIdx");
		
		if (memberIdx == null) {
			// 로그인되지 않은 사용자이므로 다른 페이지로 리다이렉트
			response.sendRedirect(request.getContextPath() + "/member/loginIndex.do");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
		// 이후 처리가 필요한 경우 작성
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
		// 이후 처리가 필요한 경우 작성
	}
}
