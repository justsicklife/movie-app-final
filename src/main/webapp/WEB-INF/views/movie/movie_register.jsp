<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
<!-- 하형 스타일 -->
<link href="/resources/css/movie/movie_register.css" rel="stylesheet" />
<link href="/resources/css/movie/autoComplate.css" rel="stylesheet">
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="../common/header.jsp"%>

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
						<a href="/member/detail.do?memberIdx=${memberIdx }" class="nav-link text-white">
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
							<a href="/movie/registerForm.do" class="nav-link active" aria-current="page">
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
			<div class="col-lg-1"></div>
			<div class="col-lg-7 mx-auto">
				<h3 class="titleMyFont d-inline-block m-0">영화 추가</h3>
				<hr class="text-warning mb-5">
				<div class="card mt-2 mb-5 mx-auto p-4 bg-light">
					<div class="card-body bg-light">
						<div class="container">
							<form id="contact-form" action="/movie/register.do" method="post"
								role="form" enctype="multipart/form-data">
								<div class="controls">
									<div class="row">
										<div class="col-md-6">
											<div class="form-floating">
												<input id="movieTitle" type="text" name="movieTitle"
													class="form-control" required="required"
													data-error="Firstname is required."> <label
													for="movieTitle">영화 제목</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-floating">
												<input id="movieDirector" type="text" name="movieDirector"
													class="form-control" required="required"
													data-error="Lastname is required."> <label
													for="movieDirector">감독 이름</label>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-12">
											<div class="form-group">
												<label for="movieSummary">줄거리</label>
												<textarea id="movieSummary" name="movieSummary"
													class="form-control" rows="4" required="required"
													data-error="Please, leave us a message."></textarea>
											</div>
										</div>
										<div class="autocomplete_parent my-3" autocomplete="off">
											<div class="autocomplete">
												<input id="myInput" type="text" name="staff"
													placeholder="영화 관계자 검색">
											</div>
										</div>

										<div id="result"></div>
										<div id="input_result"></div>

										<div class="col-md-12 overflow-scroll">
											<div class="genre_box_parent" id="genre_box_parent">
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/thriller.svg" alt="">
													<div class="genre_name">스릴러</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/adventure.svg" alt="">
													<div class="genre_name">어드벤쳐</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/romance.svg" alt="">
													<div class="genre_name">로맨스</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/sports.svg" alt="">
													<div class="genre_name">스포츠</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/action.svg" alt="">
													<div class="genre_name">액션</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/mystery.svg" alt="">
													<div class="genre_name">미스터리</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/fantasy.svg" alt="">
													<div class="genre_name">판타지</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/war.svg" alt="">
													<div class="genre_name">전쟁</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/comedy.svg" alt="">
													<div class="genre_name">코미디</div>
												</div>
												<div class="genre_box">
													<img class="genre_icon"
														src="../../../resources/svg/hero.svg" alt="">
													<div class="genre_name">히어로</div>
												</div>
											</div>
											<div id="genre_input_box"></div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="formFileDisabled" class="form-label">영화
													포스터</label> <input class="form-control" type="file"
													id="formFileDisabled" name="upload" required="required"
													onChange="readURL(this);" />
											</div>
											<img id="preview" class="poster_preview" />
										</div>
										<div class="col-md-12 mt-3">
											<label for="movieTrailer" class="form-label">영화 예고편</label><br>
											<input id="movieTrailer" type="text" name="movieTrailer" required="required"/>
										</div>
										<!-- 영화 등급 / 영화 가격 -->
										<div class="col-md-12 container mt-3">
											<h4 class="text-dark">영화 등급</h4>
											<div class="row">
												<div class="col-md-3 text-center">
													<label class="form-check-label" for="radio1">
														<img src="../../../resources/mimg/movieRating/12.svg"
															height="50px" width="50px">
													</label>
													<div class="form-check p-0">
														<input type="radio" id="radio1"
															name="movieRating" value="12세 관람가" checked>
													</div>
												</div>
												
												<div class="col-md-3 text-center">
													<label class="form-check-label" for="radio2">
														<img src="../../../resources/mimg/movieRating/15.svg"
															height="50px" width="50px">
													</label>
													<div class="form-check p-0">
														<input type="radio" id="radio2"
															name="movieRating" value="15세 관람가">
													</div>
												</div>
												
												<div class="col-md-3 text-center">
													<label class="form-check-label" for="radio3">
														<img src="../../../resources/mimg/movieRating/18.svg"
															height="50px" width="50px">
													</label>
													<div class="form-check p-0">
														<input type="radio" id="radio3"
															name="movieRating" value="18세 관람가">
													</div>
												</div>
												
												<div class="col-md-3 text-center">
													<label class="form-check-label" for="radio4">
														<img src="../../../resources/mimg/movieRating/all.svg"
															height="50px" width="50px">
													</label>
													<div class="form-check p-0">
														<input type="radio" id="radio4"
															name="movieRating" value="전체 관람가">
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6 mt-3">
													<label for="moviePrice" class="form-label">영화 가격</label><br>
													<input id="moviePrice" type="number" name="moviePrice" required="required"/>
												</div>
	
												<div class="col-md-6 mt-3">
													<label for="movieOpenDate" class="form-label">개봉일</label><br>
													<input id="movieOpenDate" type="date" name="movieOpenDate" required="required"/>
												</div>
											</div>

											<div class="col-md-12">
												<input type="submit" class="btn btn-secondary btn-send w-100 mt-3 pt-2 btn-block">
												<!-- id="submit" value="Send Message"> -->
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /.8 -->
			</div>
			<div class="col-lg-2"></div>
			<!-- /.row-->
		</div>
	</main>
	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp"%>
	<!-- script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/js/register/autoTemplate.js"></script>
	<script src="/resources/js/register/genre.js"></script>
	<script src="/resources/js/register/poster.js"></script>
</body>
</html>