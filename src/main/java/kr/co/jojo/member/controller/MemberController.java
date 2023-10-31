package kr.co.jojo.member.controller;

import java.util.HashMap;
import java.util.Objects;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.util.StringUtils;

import kr.co.jojo.common.template.AlertMessage;
//import kr.co.jojo.ignore.SmsApi;
import kr.co.jojo.member.model.dto.Member;
import kr.co.jojo.member.model.service.MemberServiceImpl;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberServiceImpl memberService;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder; // 비밀번호 암호화 관련 객체 선언
	
	// admin_chat으로 이동
	@GetMapping("/adminChatIndex.do")
	public String adminChatIndex(Model model) {
		return "chat/admin_chat";
	}

	// user_chat으로 이동
	@GetMapping("/userChatIndex.do")
	public String userChatIndex(Model model) {
		return "chat/user_chat";
	}

	@GetMapping("/loginIndex.do")
	public String loginIndex(HttpSession session, Model model) {
		AlertMessage.getAlert(session, model);
		return "member/login";
	}
	
	// 로그아웃
	@GetMapping("/logout.do")
	public String logoutMember(HttpSession session, Model model) {
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/movie/list.do";
	}
	
	// 로그인
	@PostMapping("/login.do")
	public String loginMember(Member m, HttpSession session, Model model) {
		Member loginUser = memberService.loginMember(m);

		// Objects.isNull(loginUser) = null : true
		// ! null : false, notNull : true
		// getMemberPassword - 사용자 입력 패스워드 / getMemberPassword - db에 자정된 패스워드
		if (!Objects.isNull(loginUser)
				&& bcryptPasswordEncoder.matches(m.getMemberPassword(), loginUser.getMemberPassword())) {

			session.setAttribute("memberName", loginUser.getMemberName()); // 사용자 이름
			session.setAttribute("memberIdx", loginUser.getMemberIdx());
			session.setAttribute("memberEmail", loginUser.getMemberEmail());
			session.setAttribute("memberId", loginUser.getMemberId());
						
			AlertMessage.setAlert(session, "로그인 되었습니다", loginUser.getMemberId(), "success");

			// redirect 붙는이유 컨트롤러에서 -> 컨트롤러로 보내기 때문에
			return "redirect:/movie/list.do";

		} else { // 로그인 실패시
			AlertMessage.setAlert(session, "아이디 또는 비밀번호를 확인해주세요", "ERROR", "error");
			return "redirect:/member/loginIndex.do";
		}
	}

	// 회원가입 페이지로 이동
	@GetMapping("/registerForm.do")
	public String registerForm(HttpSession session, Model model) {
		AlertMessage.getAlert(session, model);
		return "member/registerForm";
	}

	@PostMapping("/checkEmail.do")
	@ResponseBody // HTTP body에 return값을 응답으로 보냄
	public String checkEmail(String email) {
		// COUNT(*)
		// MemberService에 checkEmail 추상 메서드
		// MemberServiceImpl에 checkEmail 추상 메서드
		// MemberDao에 메서드
		int result = memberService.checkEmail(email);

		if (result > 0) {
			return "failed";
		} else {
			return "success";
		}

		// ResponseBody 쓰지 않을 경우 : /WEB-INF/views/success.jsp
		// ResponseBody 쓸 않을 경우 : 문자열 success를 클라이언트에게 반환
	}

	// 회원가입
	@PostMapping("/register.do")
	public String registerMember(Member member, HttpSession session) {

		System.out.println("member: " + member);
		String addr = member.getMemberAddr();
		String detailAddr = member.getMemberDetailAddr();
		System.out.println("memberAddr: " + addr);
		System.out.println("memberDetailAddr: " + detailAddr);
		member.setMemberAddr(addr+" "+detailAddr);

		// 유효성 검사
		String password = member.getMemberPassword();
		String passwordChk = member.getMemberPasswordChk();

		String email = member.getMemberEmail();

		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
		String passwordRegex = "^(?=.*[a-zA-Z])(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{6,20}$";

		// 이메일 검증
		String isEmailAvailable = checkEmail(email);

		System.out.println(password.matches(passwordRegex));
		System.out.println(password.equals(passwordChk));
		System.out.println(isEmailAvailable.equals("success"));
		System.out.println(email.matches(emailRegex));

		if (password.matches(passwordRegex) && password.equals(passwordChk) && isEmailAvailable.equals("success")
				&& email.matches(emailRegex)) {

			// 패스워드 암호화
			String bcryptPassword = bcryptPasswordEncoder.encode(member.getMemberPassword());
			member.setMemberPassword(bcryptPassword);

			// 회원가입
			int result = memberService.registerMember(member);

			if (result > 0) {
				AlertMessage.setAlert(session, "회원가입 성공", "Success", "success");
				return "member/login";
			} else {
				AlertMessage.setAlert(session, "회원가입 실패", "ERROR", "error");
				return "redirect:/member/registerForm.do";
			}
		} else {
			AlertMessage.setAlert(session, "회원가입 실패", "ERROR", "error");
			return "redirect:/member/registerForm.do";
		}
	}
	
//	@PostMapping("/sendSMS")
//	@ResponseBody
//	public String sendSMS(@RequestParam(value="phoneNum")String phoneNum) {
//		Random random = new Random();
//		
//		int min = 100000;
//		int max = 999999;
//		int randomNumber = random.nextInt(max - min + 1) + min;
//		
//		SmsApi api = new SmsApi();
//		
//		String api_key = api.getApiKey();
//	    String api_secret = api.getApiSecret();
//	    Message coolsms = new Message(api_key, api_secret);
//
//	    // 4 params(to, from, type, text) are mandatory. must be filled
//	    HashMap<String, String> params = new HashMap<String, String>();
//	    params.put("to", phoneNum);    // 수신전화번호
//	    params.put("from", api.getPhNum());    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
//	    params.put("type", "SMS");
//	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
//	    params.put("app_version", "test app 1.2"); // application name and version
//
//	    try {
//	        JSONObject obj = (JSONObject) coolsms.send(params);
//	        System.out.println(obj.toString());
//	      } catch (CoolsmsException e) {
//	        System.out.println(e.getMessage());
//	        System.out.println(e.getCode());
//	      }
//		System.out.println("랜덤숫자: " + randomNumber);
//		return Integer.toString(randomNumber);
//	}
	
	@GetMapping("detail.do")
	//http://localhost/member/detail.do?memberIdx=memberIdx값 넣어줘야함
	public String detailMember(@RequestParam(value = "memberIdx") int idx, Model model, HttpSession session) {
		//인터페이스 MemberService
		//MemberServiceImpl
		//MemberDao
		Member result = memberService.detailMypage(idx);
		
		if (!Objects.isNull(result)) {
			model.addAttribute("detail", result);
			// session.getAttribute("memberIdx") : 로그인한 memberIdx 가져옴
			model.addAttribute("user",session.getAttribute("memberIdx"));
			AlertMessage.getAlert(session, model);
			return "mypage/mypage";
		} else {
			AlertMessage.getAlert(session, model);
			return "redirect:/movie/list.do";
		}
	}
	
	@PostMapping("update.do")
	public String updateMypage(Member member, HttpSession session,
			HttpServletRequest request) {
		
		String addr = member.getMemberAddr();
		String detailAddr = member.getMemberDetailAddr();
		member.setMemberAddr(addr+" "+detailAddr);
		
		String name = member.getMemberName();
		
		// 유효성 검사
		String password = member.getMemberPassword();
		String passwordChk = member.getMemberPasswordChk();
		String passwordRegex = "^(?=.*[a-zA-Z])(?=.*[@$!%*?&#])[A-Za-z\\d@$!%*?&#]{6,20}$";
		
		if (password.matches(passwordRegex) && password.equals(passwordChk)
				&& StringUtils.hasText(name)) {
			
			// 패스워드 암호화
			String bcryptPassword = bcryptPasswordEncoder.encode(member.getMemberPassword());
			member.setMemberPassword(bcryptPassword);
			System.out.println(member);
			int result = memberService.updateMypage(member);
			
			if (result > 0) {
				AlertMessage.setAlert(session, "회원정보 수정 성공!!!", "Success", "success");
				return "redirect:/member/detail.do?memberIdx=" + member.getMemberIdx();
			} else {
				AlertMessage.setAlert(session, "회원정보 수정 실패", "ERROR", "error");
				return "redirect:/member/detail.do?memberIdx=" + member.getMemberIdx();
			}
		} else if(!password.matches(passwordRegex) && !password.equals(passwordChk)){
			AlertMessage.setAlert(session, "비밀번호를 확인해주세요.", "ERROR", "error");
			return "redirect:/member/detail.do?memberIdx=" + member.getMemberIdx();
			
		} else {
			AlertMessage.setAlert(session, "이름을 입력해주세요", "ERROR", "error");
			return "redirect:/member/detail.do?memberIdx=" + member.getMemberIdx();
		} 
	}
	
}
