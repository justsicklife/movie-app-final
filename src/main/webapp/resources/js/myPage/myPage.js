
//비밀번호 유효성 검사
function validatePassword() {
	// 비밀번호 정책
	// 소문자 또는 대문자 1개이상, 특수문자 1개 이상, 6자리 이상 20자리 이하
	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{6,20}$/;
	// 입력한 비밀번호 값을 가져옴
	const password = document.getElementById("user_pw").value;
	// 비밀번호 정책 메시지 출력하는 id 불러옴
	const msg = document.getElementById("pwdMsg");

	//비밀번호 == 비밀번호 확인 검사
	const passwordChk = document.getElementById("user_pw_check").value;
	const pwdChkMsg = document.getElementById("pwdChkMsg");

	//test : 자바스크립트에 내장 된 함수. 정규식이 맞는지 검사
	if (passwordRegex.test(password)) {
		msg.innerHTML = "사용 가능한 비밀번호 입니다.";
		msg.style.color = "green";
	} else if( password.trim() === '' ){
		msg.innerHTML = null;
	} else if(!passwordRegex.test(password)){
		msg.innerHTML = "패스워드 정책에 맞지 않습니다.";
		msg.style.color = "red";
	} 

	if (password === passwordChk && passwordRegex.test(password)) {
		pwdChkMsg.innerHTML = "패스워드가 동일합니다.";
		pwdChkMsg.style.color = "green";
	} else if (passwordChk.trim() === '' || !passwordRegex.test(password)){
		pwdChkMsg.innerHTML = null;
	} else if (password !== passwordChk && passwordRegex.test(password) && passwordChk.trim() !== '' ){
		pwdChkMsg.innerHTML = "패스워드가 동일하지 않습니다.";
		pwdChkMsg.style.color = "red";
	} 
}

// 이메일 중복 확인 AJAX
// function checkEmail() {
// 	// const email = document.getElementById("email").value;
// 	const email = $("#email").val();
// 	const emailMsg = $("#emailMsg");
// 	//test@test 가능
// 	const emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
// 	// test = 자바스크립트에서 제공하는 함수
// 	if (emailRegex.test(email)) {
// 		$.ajax({
// 			type : "POST",
// 			url : "/member/checkEmail.do",
// 			data : {
// 				email : email
// 			// 컨트롤러 email : 자바스크립트 email 
// 			},
// 			//컨트롤러에서 반환하는 값이 response로 들어옴
// 			success : function(response) {
// 				if (response == "success") {
// 					emailMsg.html("사용 가능한 이메일 입니다.").css("color",
// 							"green");
// 				} else {
// 					emailMsg.html("이미 사용중인 이메일입니다.")
// 							.css("color", "red");
// 				}
// 			},
// 			error : function() {
// 				console.log("error");
// 			}
// 		});

// 	} else {
// 		emailMsg.html("이메일 형식이 맞지 않습니다.").css("color", "red");
// 	}
// }

// 우편번호 검색
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					// document.getElementById('sample6_postcode').value = data.zonecode;
					// document.getElementById("sample6_address").value = addr;
					document.getElementById('sample6_postcode').value = "["
							+ data.zonecode + "] ";
					console.log(document
							.getElementById("sample6_postcode").value);
					document.getElementById("sample6_postcode").value += addr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress")
							.focus();

				}
			}).open();
}