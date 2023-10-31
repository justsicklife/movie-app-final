package kr.co.jojo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.member.model.dto.Member;

@Repository
public class MemberDao {

	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	// 이메일 확인
	// selectOne : 하나만가져옴
	public int checkEmail(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("memberMapper.checkEmail", memberEmail);
	}

	// 회원가입
	// insert : 데이터 전송
	public int registerMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.registerMember", member);
	}

	// mypage 불러오기
	public Member detailMypage(SqlSessionTemplate sqlseesion, int idx) {
		return sqlseesion.selectOne("memberMapper.detailMypage", idx);
	}

	// mypage 수정
	public int updateMypage(SqlSessionTemplate sqlseesion, Member member) {
		return sqlseesion.update("memberMapper.updateMypage", member);
	}
}
