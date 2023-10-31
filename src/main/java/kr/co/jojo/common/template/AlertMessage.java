package kr.co.jojo.common.template;

import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;

public class AlertMessage {
	public static void getAlert(HttpSession session, Model model) {
		// 세션에서 알럿 메시지 가져와서 model로 전달
		String msg = (String) session.getAttribute("msg");
		String title = (String) session.getAttribute("title");
		String status = (String) session.getAttribute("status");
		
		model.addAttribute("msg", msg);
		model.addAttribute("title", title);
		model.addAttribute("status", status);
		
		System.out.println("msg: " + msg);
		System.out.println("title: " + title);
		System.out.println("status: " + status);
		
		session.removeAttribute("msg");
		session.removeAttribute("title");			
		session.removeAttribute("status");		
	}
	
	public static void setAlert(HttpSession session, String msg, String title, String status) {
		// session에 알럿 메시지 작성
		session.setAttribute("msg", msg);
		session.setAttribute("title", title);
		session.setAttribute("status", status);
	}
}
