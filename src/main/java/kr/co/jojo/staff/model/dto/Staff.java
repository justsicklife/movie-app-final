package kr.co.jojo.staff.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

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
public class Staff {
	int staffIdx;
	String staffName;
	String staffSex;
//	int staffAge;
	// 나이를 생일로 변경
	Date staffBirth;
	String staffRole;
	String staffUploadPath;
	String staffUploadName;
	String staffUploadOriginName;
	
	String staffSummary;
}
