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
	height: 500px;
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
</style>
</head>
<body>
	<main class="login_box container text-center shadow-lg">
		<!-- 로고 -->
		<div class="row">
			<div class="col py-3 my-5">
				<img src="/resources/mimg/movieRating/18.svg" alt="로그인 로고"
					width="auto" height="50px">
			</div>
		</div>
		<!-- 로그인 정보 입력 -->
		<form action="/member/login.do" method="post">
			<div class="row">
				<div class="col">
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="floatingInput" name="memberEmail"
							placeholder="name@example.com"> <label
							for="floatingInput"><span>이메일</span></label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword" name="memberPassword"
							placeholder="Password"> <label for="floatingPassword"><span>비밀번호</span></label>
					</div>
				</div>
				<!-- 로그인 버튼 -->
				<div class="row my-3">
					<div class="col">
						<button type="submit" class="btn btn-warning">
							<span>로그인</span>
						</button>
					</div>
				</div>
				<!-- 회원가입 -->
				<div class="row">
					<div class="col">
						<a href="/member/registerForm.do"><span class="text-warning">회원가입</span></a>
					</div>
				</div>
			</div>
		</form>
		<div class="row"></div>
		<div class="row"></div>
		<main>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
</body>
</html>