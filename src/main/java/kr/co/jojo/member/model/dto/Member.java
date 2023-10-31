package kr.co.jojo.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
	
	private int memberIdx;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	private String memberPasswordChk;
	private String memberId;
	private String memberAddr;
	private String memberDetailAddr;
}
