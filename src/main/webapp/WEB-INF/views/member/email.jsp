<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
html {
	height: 100%;
}

body {
	background-size: cover;
	background-attachment: fixed;
	background: radial-gradient(51.39% 511.66% at 47.68% -217.91%, #ff9900 0%, #e50914
		17.27%, #0e1b4f 79.44%, #000413 100%);
}

.login_box {
	margin: 0 auto;
	margin-top: 100px;
	width: 400px;
	height: 700px;
	border-radius: 5%;
	background-color: #ffffff60;
	opacity: 0.8;
}

.login_box span {
	font-weight: bold;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<main class="login_box container text-center shadow-lg">
		<!-- 로고 -->
		<div class="row">
			<div class="col py-3 my-5">
				<img src="mimg/bootstrap-logo.svg" alt="로그인 로고" width="auto"
					height="50px">
			</div>
		</div>
		<!-- 로그인 정보 입력 -->
		<h5>
			<span>회원가입</span>
		</h5>
		<div class="form-group email-form">
			<label for="email">이메일</label>
			<div class="input-group">
				<input type="text" class="form-control" name="userEmail1"
					id="userEmail1" placeholder="이메일"> <select
					class="form-control" name="userEmail2" id="userEmail2">
					<option>@naver.com</option>
					<option>@daum.net</option>
					<option>@gmail.com</option>
					<option>@hanmail.com</option>
					<option>@yahoo.co.kr</option>
				</select> /div>
				<div class="input-group-addon">
					<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
				</div>
				<div class="mail-check-box">
					<input class="form-control mail-check-input"
						placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
				</div>
				<span id="mail-check-warn"></span>
			</div>
		</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//비밀번호 유혀성 검사
	function validatePassword() {
		// 비밀번호 정책
		// 소문자 또는 대문자 1개이상, 특수문자 1개 이상, 6자리 이상 20자리 이하
		const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{6,20}$/;
		// 입력한 비밀번호 값을 가져옴
		const password = document.getElementById("password").value;
		// 비밀번호 정책 메시지 출력하는 id 불러옴
		const msg = document.getElementById("pwdMsg");

		//비밀번호 == 비밀번호 확인 검사
		const passwordChk = document.getElementById("passwordChk").value;
		const pwdChkMsg = document.getElementById("pwdChkMsg");

		//test : 자바스크립트에 내장 된 함수. 정규식이 맞는지 검사
		if (passwordRegex.test(password)) {
			msg.innerHTML = "사용 가능한 비밀번호 입니다.";
			msg.style.color = "green";
		} else {
			msg.innerHTML = "패스워드 정책에 맞지 않습니다.";
			msg.style.color = "red";
		}

		if (password === passwordChk) {
			pwdChkMsg.innerHTML = "패스워드가 동일합니다.";
			pwdChkMsg.style.color = "green";
		} else {
			pwdChkMsg.innerHTML = "패스워드가 동일하지 않습니다.";
			pwdChkMsg.style.color = "red";
		}
	}

	// 이메일 중복 확인 AJAX
	function checkEmail() {
		// const email = document.getElementById("email").value;
		const email = $("#email").val();
		const emailMsg = $("#emailMsg");
		//test@test 가능
		const emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
		// test = 자바스크립트에서 제공하는 함수
		if (emailRegex.test(email)) {
			$.ajax({
				type : "POST",
				url : "/member/checkEmail.do",
				data : {
					email : email
				// 컨트롤러 email : 자바스크립트 email 
				},
				//컨트롤러에서 반환하는 값이 response로 들어옴
				success : function(response) {
					if (response == "success") {
						emailMsg.html("사용 가능한 이메일 입니다.").css("color", "green");
					} else {
						emailMsg.html("이미 사용중인 이메일입니다.").css("color", "red");
					}
				},
				error : function() {
					console.log("error");
				}
			});

		} else {
			emailMsg.html("이메일 형식이 맞지 않습니다.").css("color", "red");
		}
	}
	
	$('#mail-Check-Btn').click(function() {
		const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/user/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil
</script>

</html>