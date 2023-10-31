<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- myPage.css -->
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="../common/header.jsp"%>

	<!-- 메인 -->
   <main class="container-fluid m-0 px-0" style="min-height: 730px;">
      <div class="row mt-5 mx-0">
			<!-- 사이드바 -->
			<aside class="col-lg-2 p-0 text-center">
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item text-center mb-5">
						<c:choose>
							<c:when test="${memberId eq 'admin' }">
								<h3 class="titleMyFont">관리자 페이지</h3>
								<hr class="text-warning">
							</c:when>
							<c:otherwise>								
								<h3 class="titleMyFont">마이페이지</h3>
								<hr class="text-warning">
							</c:otherwise>
						</c:choose>
					</li>
					<li class="nav-item">
						<a href="/member/detail.do?memberIdx=${memberIdx }" class="nav-link active" aria-current="page">
							계정정보
						</a>
					</li>
					<li class="nav-item">
						<a href="/wish/myWish.do" class="nav-link text-white">
							찜 목록
						</a>
					</li>
					<li class="nav-item">
						<a href="/cart/myCart.do" class="nav-link text-white">
							장바구니
						</a>
					</li>
					<li class="nav-item">
						<a href="/mymovie/list.do" class="nav-link text-white">
							소장한 영화
						</a>
					</li>
					<c:if test="${memberId eq 'admin' }">
						<li class="nav-item">
							<a href="/movie/registerForm.do" class="nav-link text-white">
								영화 추가
							</a>
						</li>
						<li class="nav-item">
							<a href="/staff/registerForm.do" class="nav-link text-white">
								영화 관계자추가
							</a>
						</li>
					</c:if>
				</ul>
			</aside>
			<!-- 프로필 영역 -->
			<section class="col-lg-10 container">
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4 text-center bg-secondary bg-opacity-50 shadow rounded">
						<!-- 계정 정보 입력 -->
						<form action="/member/update.do" method="post">
							<c:choose>
								<c:when test="${detail.memberIdx == user}">
									<div class="mt-5 text-success">
										<input type="hidden" name="memberIdx" value="${detail.memberIdx}">
										<div class="form-floating mb-2">
										  <input type="text" class="form-control" id="user_id" name="memberId" value="${detail.memberId }" readonly>
										  <label for="user_id" class="form-label">아이디</label>
										</div>
										
										<div class="form-floating mb-2">
											<input type="email" class="form-control" id="user_email" name="memberEmail" value="${detail.memberEmail}" readonly
											 		onkeyup="checkEmail()">
											<label for="user_email" class="form-label">이메일</label>
										</div>

										<div class="form-floating mb-2">
											<input type="text" class="form-control" id="user_name" name="memberName" value="${detail.memberName}">
											<label for="user_name" class="form-label">이름</label>
										</div>

										<div class="form-floating mb-2">
											<input type="password" class="form-control" id="user_pw" name="memberPassword" onkeyup="validatePassword()">
											<label for="user_pw" class="form-label">비밀번호 <span style="font-size: 0.5rem;">(대소문자 1개 이상, 특수문자 1개 이상, 6~20자리)</span></label>
											<span id="pwdMsg" class="" style="font-size: 0.8rem;">
												
											</span>
										</div>

										<div class="form-floating mb-2">
											<input type="password" class="form-control" id="user_pw_check" name="memberPasswordChk" onkeyup="validatePassword()">
											<label for="user_pw_check" class="form-label">비밀번호 확인</label>
												<span id="pwdChkMsg" style="font-size: 0.8rem;"></span>
										</div>
										
										<div class="mb-3">
											<table class="w-100 mb-3 rounded-table">
												<tbody class="bg-light">
													<tr>
														<td>
															<div class="form-floating input-group">
																<input type="text" class="form-control"
																	id="sample6_postcode" placeholder="우편번호"
																	aria-label="우편번호"
																	aria-describedby="sample6_detailAddress"
																	name="memberAddr">
																<label for="sample6_postcode" class="form-label">주소</label>
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
															class="form-control d-inline border-top"
															name="memberDetailAddr" id="sample6_extraAddress"
															value="${detail.memberAddr}">
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="mb-3">
											<button type="button" class="btn btn-outline-danger"
												onclick="history.back()">취소</button>
											<button type="submit" class="btn btn-outline-warning"
												onclick="save()">수정</button>
										</div>
									</div>
								</c:when>

								<c:otherwise>
				                    없어 돌아가
				                  </c:otherwise>
							</c:choose>
						</form>
					</div>
					<div class="col-4"></div>
				</div>
			</section>
		</div>
	</main>

	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp"%>

	<!-- script -->
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 우편번호 검색 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- myPage.js -->
	<script src="/resources/js/myPage/myPage.js"></script>
</body>
</html>