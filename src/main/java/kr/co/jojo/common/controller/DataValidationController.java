package kr.co.jojo.common.controller;

import org.springframework.stereotype.Controller;

@Controller
public class DataValidationController {
	
	// 게시판 글쓰기 시 글자 수 제한
	public Boolean languageCheck(String data) {
		int byteLength = 0;
		
		for (char c : data.toCharArray()) {
			if (Character.toString(c).matches("[a-zA-Z]")) {
				byteLength += 1; // 영어는 1바이트로 계산
			} else if (Character.toString(c).matches("[ㄱ-ㅎㅏ-ㅣ가-힣]")) {
				byteLength += 3; // 한글은 3바이트로 계산
			}
		}
		
		if (byteLength > 50) {
			return false;
		} else {
			return true;
		}
	}

	// 전달받은 값이 비어 있는지 확인
	public Boolean nullCheck(String data) {
		if (data.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}
	
}
