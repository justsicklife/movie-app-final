package kr.co.jojo.member.model.service;

import kr.co.jojo.member.model.dto.Member;

public interface MemberService {
	
	// 로그인
	Member loginMember(Member m);

	// 이메일 확인
	int checkEmail(String email);

	// 회원가입
	int registerMember(Member member);
	
	// 0823 코드통합
	void makeRandomNumber();
	
	// 마이페이지 정보 호출
	Member detailMypage(int idx);
	
	// 회원 정보 수정
	int updateMypage(Member member);
}
