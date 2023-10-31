package kr.co.jojo.common.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.board.model.service.BoardServiceImpl;

@Controller
public class UploadFileController {

	// 업로드된 파일이 저장될 경로
	public static final String UPLOAD_PATH = "C:\\Users\\Largrand\\git\\movivimvap\\final\\src\\main\\webapp\\resources\\uploads\\";
	
	@Autowired
	private BoardServiceImpl boardService;
	
	// 이전에 만들어둔 detailBoard 메서드를 이용하여 boardIdx를 기준으로 정보 가져오기 (파일 경로, 파일 이름을 가져오기 위함)
	public boolean deleteFile(MultipartFile upload, Board board) {
		board = boardService.detailBoard(board.getBoardIdx());
		if (!Objects.isNull(board)) {
			File deleteFile = new File(board.getUploadPath() + board.getFileName());
			// 서버에 저장된 파일 삭제
			deleteFile.delete();
			
			return true;
			
		} else {
			return false;
		}
	}
	
	public Board uploadMethod(MultipartFile upload, Board board, HttpSession session) {
		
		if (!upload.isEmpty()) {
			// 원본 파일명
			String originalName = upload.getOriginalFilename();
			
			// 확장자 구하기
			String extension = originalName.substring(originalName.lastIndexOf("."));
			
			// 현재 년-월-일-시-분-초
			// 2023-07-31: 11:22:15
			LocalDateTime now = LocalDateTime.now();
			// 년월일시분초 형식으로 데이터 가공
			// 230731112215
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmss");
			String output = now.format(formatter);
			
			// 랜덤 문자열 생성
			int length = 8; // 생성할 문자열의 길이
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&"; // 사용 가능한 문자들
			
			Random random = new Random();
			String randomString = random.ints(length, 0, characters.length())
									.mapToObj(characters::charAt)
									.map(Object::toString)
									.collect(Collectors.joining());
			
			// DB에 저장할 파일명
			//			날짜			_		랜덤 문자열		확장자
			//			230731112215	_		akw@%!wn		.png
			//			230731112215_akw@%!wn.png
			String fileName = (output + "_" + randomString + extension);
			String filePathName = UPLOAD_PATH + fileName;
			
			// import java.nio.file.Path;
			Path filePath = Paths.get(filePathName);
			
			try {
				upload.transferTo(filePath);				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 경로, 원본 파일명, 수정된 파일명 저장
			board.setUploadPath(UPLOAD_PATH);
			board.setOriginalName(originalName);
			board.setFileName(fileName);
		}
		System.out.println("UploadFileController: " + board.getFileName());
		return board;
	}
}
