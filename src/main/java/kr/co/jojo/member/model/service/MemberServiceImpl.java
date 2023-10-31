package kr.co.jojo.member.model.service;

import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.member.model.dao.MemberDao;
import kr.co.jojo.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao memberDao;

	private int authNumber;

	// 로그인
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	// 이메일 확인
	@Override
	public int checkEmail(String memberEmail) {
		return memberDao.checkEmail(sqlSession, memberEmail);
	}

	// 회원가입
	@Override
	public int registerMember(Member member) {
		return memberDao.registerMember(sqlSession, member);
	}

	@Override
	public void makeRandomNumber() {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
//        log.info("checkNum : " + checkNum);
		authNumber = checkNum;
	}

//  @Override
//  public String joinEmail(String email) {
//      makeRandomNumber();
//
//      String toMail = email;
//      String title = "회원가입을 위한 인증메일입니다.";
//      String message =
//              "홈페이지를 방문해주셔서 감사합니다." +
//              "<br><br>" +
//              "인증번호는 " + authNumber + " 입니다." +
//              "<br><br>" +
//              "해당 인증번호를 인증번호 확인한에 기입하여 주시기바랍니다.";
//      mailSend(message,toMail, title);
//      return Integer.toString(authNumber);
//  }
	
	// 마이페이지 정보 호출
	@Override
	public Member detailMypage(int idx) {
		return memberDao.detailMypage(sqlSession, idx);
	}

	// 회원 정보 수정
	@Override
	public int updateMypage(Member member) {
		return memberDao.updateMypage(sqlSession, member);
	}
}
