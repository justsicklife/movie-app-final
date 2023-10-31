<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/resources/mimg/movieRating/18.svg" type="">
<title>Movivimvap</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/0cf27f7ac1.js" crossorigin="anonymous"></script>

<!-- sweetAlert2 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- Alert Script -->	
<script src="../../../resources/js/common/alert.js"></script>
<script>
	const msg = '<%=request.getAttribute("msg")%>'
	const title = '<%=request.getAttribute("title")%>'
	const status = '<%=request.getAttribute("status")%>'
	console.log("msg: " + msg);
	console.log("title: " + title);
	console.log("status: " + status);
	if (msg !== null && msg !== "null" && 
			title !== null && title !== "null" && 
			status !== null && status !== "null") {
		$(document).ready(function() {
			alertFunction(msg, title, status);
		});
	}
</script>

<style>
html {
	height: 100%;
}

body {
/* 	background: radial-gradient(51.39% 511.66% at 47.68% -217.91%, #ff9900 0%, #e50914 */
/* 		17.27%, #0e1b4f 79.44%, #000413 100%); */
	background-image: url('/resources/mimg/aaa.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: top;
	background-attachment: fixed;
}

.login_box {
	margin: 0 auto;
	margin-top: 200px;
	width: 400px;
/* 	height: 500px; */
	border-radius: 5%;
/*  	background-color: #ffffff60; */
  	background-color: #414141;
 	opacity:0.9;
}

a {
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration: none;
/* 	font-size:larger; */
	color: #ffd900;
}

.rounded-table {
	border-radius: 5px;
	/* 원하는 반지름 값으로 조정 가능 */
	overflow: hidden;
	/* 내용이 모서리를 벗어나지 않도록 설정 */
}

/* 아이콘 버튼의 스타일 조정 */
.rounded-table .input-group .btn {
	border-radius: 0 5px 5px 0;
}

</style>

</head>

<body>
	<main class="login_box container text-center shadow-lg">
		<!-- 로고 -->
		<div class="row">
			<div class="col py-3 mt-5 mb-1">
				<img src="/resources/mimg/movieRating/18.svg" alt="로그인 로고"
					width="auto" height="50px">
			</div>
		</div>
		<!-- 로그인 정보 입력 -->
		<form action="/member/register.do" method="post" class="needs-validation" novalidate="">
			<div class="col">
				<div class="form-floating my-3">
					<input type="email" class="form-control" id="email"
						name="memberEmail" onkeyup="checkEmail()" required="required"
						placeholder="name@example.com"> <label for="floatingInput"><span>이메일</span></label>
					<span id="emailMsg"></span>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="password"
						name="memberPassword" onkeyup="validatePassword()" required="required"
						placeholder="Password"> <label for="floatingPassword"><span>비밀번호</span></label>
					<span id="pwdMsg" class="text-light">대소문자 1개 이상, 특수문자 1개 이상, 6~20자리</span>

				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="passwordChk" required="required"
						name="memberPasswordChk" onkeyup="validatePassword()"
						placeholder="Password"> <label for="floatingPassword"><span>비밀번호
							확인</span></label> <span id="pwdChkMsg"></span>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingPassword" required="required"
						name="memberName" placeholder="Password"> <label
						for="floatingPassword"><span>이름</span></label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingPassword" required="required"
						name="memberId" placeholder="id"> <label
						for="floatingPassword"><span>아이디</span></label>
				</div>
				<!-- ========================================================================================================================== -->
				<!--인혁의 위대함-->
				<table class="w-100 mb-3 rounded-table">
					<tbody class="bg-light">
						<tr>
							<td rowspan="2" class="border-end" style="width: 43px;">
								<!-- <div style="width: 30px; height: 50px;"> -->
								<div class="d-flex justify-content-center">
									<i class="fa-solid fa-location-dot fa-2xl"
										style="color: #272626e8;"></i>
								</div>
							</td>
							<td>
								<div class="input-group">
									<input type="text" class="form-control border-0"
										id="sample6_postcode" placeholder="우편번호" aria-label="우편번호"
										aria-describedby="sample6_detailAddress" name="memberAddr">
									<button class="btn" type="button"
										onclick="sample6_execDaumPostcode()"
										id="sample6_detailAddress">
										<i class="fa-solid fa-magnifying-glass fa-xl"></i>
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="text"
								class="form-control border-0 border-top" name="memberDetailAddr"
								id="sample6_extraAddress" placeholder="상세주소"></td>

						</tr>
					</tbody>
				</table>

				<!-- 핸드폰 인증번호 발송 -->
				<input type="hidden" id="phoneChk2" name="phoneChk2" value="false">

				<div class="input-group mb-3">
					<input type="text" class="form-control" id="phoneNum"
						name="phoneNum" placeholder="핸드폰번호"
						aria-label="Recipient's username" maxlength="11"> <label
						for="floatingPassword"> </label>

					<button type="button" class="input-group-text" id="sendButton"
						name="sendButton" placeholder="id">인증</button>
				</div>
				<!-- 핸드폰 인증번호 발송 끝 -->

				<!-- 핸드폰 인증 -->
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="sendNum" name="sendNum"
						placeholder="인증번호" aria-label="Recipient's username"> <label
						for="floatingPassword" disabled required> </label>

					<button type="button" class="input-group-text" id="phoneChk"
						name="phoneChk" placeholder="id">확인</button>
				</div>

				<div>
					<span id="chkText"></span>
				</div>
				<!-- 핸드폰 인증 끝 -->
			</div>
			<!-- 취소, 제출 버튼 -->
			<div class="row my-3">
				<div class="col">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/member/loginIndex.do'">
						<span>취소</span>
					</button>
					<button type="submit" id="submit" class="btn btn-warning" disabled>
						<span>제출</span>
					</button>
				</div>
			</div>
		</form>
		<div class="row"></div>
		<div class="row"></div>
	</main>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
										+ data.buildingName : data.buildingName);
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
						console
								.log(document
										.getElementById("sample6_postcode").value);
						document.getElementById("sample6_postcode").value += addr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();

					}
				}).open();
	}
</script>
<script>
	var code2 = "";

	//비밀번호 유효성 검사
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

	$('#sendButton').click(
			function() {
				const regex = /^[0-9]{11}$/;
				if ($("#phoneNum").val() === "") {
					alert('핸드폰 번호를 입력하세요!');
				} else if (!regex.test($('#phoneNum').val())) {
					alert("핸드폰 번호를 11자리를 입력하세요!");
				} else if (regex.test($('#phoneNum').val())) {
					let phoneNum = $('#phoneNum').val();
					alert('인증번호 발송 완료!');
					$("#sendButton").attr("disabled", true);

					$
							.ajax({
								type : "POST",
								url : "/member/sendSMS",
								data : {
									"phoneNum" : phoneNum
								},
								success : function(res) {
									console.log(res)

									if (res == "error") {
										alert("휴대폰 번호가 올바르지 않습니다.")
										$(".successPhoneChk").text(
												"유효한 번호를 입력해주세요.");
										$(".successPhoneChk").css("color",
												"red");
										$("#phone").attr("autofocus", true);
									} else {
										$("#sendNum").attr("disabled", false);
										$("#sendButton").css("display",
												"inline-block");
										$(".successPhoneChk").text(
												"인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
										$(".successPhoneChk").css("color",
												"green");
										$("#phoneNum").attr("readonly", true);
										console.log(res);
										code2 = res;
									}

								}
							})
				}
			});

	//휴대폰 인증번호 대조
	$("#phoneChk").click(function() {
		console.log(code2)
		$("#submit").attr("disabled", false);
		$("#chkText").html("인증번호가 일치합니다.");
		$("#chkText").css("color", "green");
		$("#phoneChk").val("true");
		$("#sendNum").attr("disabled", true);
		// if ($("#sendNum").val() != code2 && code2 === "") {
		// 	console.log("틀림1.인증번호 전송버튼을 눌러주세요.")
		// 	$("#chkText").html("인증번호를 받아주세요.");
		// 	$("#chkText").css("color", "red");
		// 	$("#phoneChk").val("false");
		// 	$(this).attr("autofocus", true);
		// } else if ($("#sendNum").val() != code2) {
		// 	console.log("틀림2.인증번호 틀림")
		// 	$("#chkText").html("인증번호가 일치하지 않습니다.");
		// 	$("#chkText").css("color", "red");
		// 	$("#phoneChk").val("false");
		// 	$(this).attr("autofocus", true);
		// } else if (code2 === "") {
		// 	console.log("틀림3.인증번호 공백")
		// 	$("#chkText").html("인증번호를 입력하지 않았습니다. <br> 확인해주시기 바랍니다.");
		// 	$("#chkText").css("color", "red");
		// 	$("#phoneChk").val("false");
		// 	$(this).attr("autofocus", true);
		// } else if ($("#sendNum").val() == code2) {
		// 	$("#submit").attr("disabled", false);
		// 	$("#chkText").html("인증번호가 일치합니다.");
		// 	$("#chkText").css("color", "green");
		// 	$("#phoneChk").val("true");
		// 	$("#sendNum").attr("disabled", true);
		// }
	});
</script>

</html>