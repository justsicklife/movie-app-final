<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
</head>

<body>
	<div class="member_index" style="display: none;">${memberIdx}</div>
	<div class="movie_index" style="display: none;">${detail.movieIdx}</div>
	

	<!-- 헤더 -->
	<%@ include file="../common/header.jsp"%>
  
	<!-- 메인 -->
	<main class="container py-5" style="min-height: 600px;">
		<div class="row mb-3 justify-content-center">${detail.movieTrailer }</div>
		<div class="row mb-2">
			<div class="col-md-6">
				<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<!-- 영화 제목 -->
						<div class="d-flex align-items-center">
							<h3 class="mb-0">
								${detail.movieTitle } &nbsp;
							</h3>
							<c:if test="${detail.movieRating eq '전체 관람가' }">
								<img src="../../../resources/mimg/movieRating/all.svg" width="30px" height="30px" alt="전체 관람가">
							</c:if>
							<c:if test="${detail.movieRating eq '12세 관람가' }">
								<img src="../../../resources/mimg/movieRating/12.svg" width="30px" height="30px" alt="12세 관람가">
							</c:if>
							<c:if test="${detail.movieRating eq '15세 관람가' }">
								<img src="../../../resources/mimg/movieRating/15.svg" width="30px" height="30px" alt="15세 관람가">
							</c:if>
							<c:if test="${detail.movieRating eq '18세 관람가' }">
								<img src="../../../resources/mimg/movieRating/18.svg" width="30px" height="30px" alt="18세 관람가">
							</c:if>
						</div>
						<!-- 개봉일 및 구매가 -->
						<div class="my-3 text-muted">
							<span class="category text-warning">개봉</span>
							<span class="postTitle">${detail.movieOpenDate }</span>
							<span class="category text-warning">구매가</span>
							<span class="postTitle">￦ ${priceNew }</span>
						</div>
						<!-- 감독 및 출연 -->
						<strong class="d-inline-block text-warning">감독</strong>
						<p class="card-text mb-auto">${detail.movieDirector }</p>
						<strong class="d-inline-block text-warning mt-3">출연</strong>
						<p class="card-text mb-auto">
							<c:forEach var="staff" items="${staffList}" varStatus="status">
								<a href="/staff/detail.do?id=${staff.staffIdx}">
									${staff.staffName } </a>
								<c:if test="${!status.last }">, </c:if>
							</c:forEach>
						</p>
					</div>
					<div class="col-auto d-none d-lg-block text-right">
						<img width="auto" height="250px"
							src="/resources/uploads/${detail.movieUploadOriginName}">
					</div>
				</div>
				<div class="">
					<c:choose>
						<c:when test="${memberIdx != null }">
							<span>
								<span data-id="${detail.movieIdx}" class="like_off">
									<i class="fa-regular fa-hand-point-down" style="color: #ffffff;"><span>&nbsp;찜하기&nbsp;</span></i>
								</span>
								<span data-id="${detail.movieIdx}" class="like_on">
									<i class="fa-solid fa-hand-point-down" style="color: #ffd900;"><span>&nbsp;찜취소&nbsp;</span></i>
								</span>
							</span>
							<span class="movie_like">${detail.movieLike }</span>
							<span>
								<span data-id="${detail.movieIdx}" class="cart_off">
									<i class="fa-solid fa-basket-shopping" style="color: #ffffff;"><span>&nbsp;장바구니 추가&nbsp;</span></i>
								</span>
								<span data-id="${detail.movieIdx}" class="cart_on">
									<i class="fa-solid fa-basket-shopping" style="color: #ffd900;"><span>&nbsp;장바구니 삭제&nbsp;</span></i>
								</span>
							</span>
						</c:when>
					</c:choose>
					<a href="javascript:show();">
						<i class="fa-solid fa-arrow-up-from-bracket" style="color: #ffd900;"></i><span>&nbsp;공유&nbsp;</span>
					</a>
					<div id="share" class="container border rounded p-1 mt-2"
						style="display: none;">
						<div class="row">
							<h6>공유하기</h6>
						</div>
						<div class="row">
							<div class="input-group">
								<input id="targetURL" type="text" class="form-control"
									value="${url }" aria-describedby="urlCopy" disabled readonly>
								<button class="btn btn-outline-secondary" type="button"
									id="urlCopy" onclick="copy();">URL 복사</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block text-warning">장르</strong>
						<p>${detail.movieGenre}</p>
						<strong class="d-inline-block text-warning">줄거리</strong>
						<p>${detail.movieSummary}</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- 리뷰 목록 -->
			<h3 class="titleMyFont mt-4">리뷰 목록</h3>
			<div class="d-flex overflow-auto text-light"
				style="width: 100%; height: 350px; border-radius: 15px; background-color: #3d3d3d;">
				<c:choose>
					<c:when test="${empty reviewList}">
						<div class="mx-auto d-flex justify-content-center align-items-center text-center">					
							<h1 class="titleMyFont">작성된 리뷰가 없습니다.</h1>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="rvw" items="${reviewList }">
							<!-- 리뷰 하나 -->
							<div type="button" data-bs-toggle="modal"
								data-bs-target="#reviewModal${rvw.reviewIdx }"
								class="container m-3 d-inline-block"
								style="width: 300px; height: 300px; flex: 0 0 30%; border-radius: 15px; background-image: url('/resources/mimg/random/1.jpg'); background-size: cover; background-repeat: no-repeat;">
								<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${rvw.reviewTitle}</h2>
								<div class="d-flex list-unstyled mt-auto">
									<div class="me-auto">
										<span class="titleMyFont">${rvw.reviewWriter}</span>
									</div>
								</div>
							</div>
							<!-- 리뷰 모달 -->
							<div class="modal fade text-dark" id="reviewModal${rvw.reviewIdx }"
								tabindex="-1" aria-labelledby="reviewModalLabel${rvw.reviewIdx }"
								aria-hidden="true">
								<form id="form-submit" method="post">
								<input type="hidden" name="movieIdx" value="${rvw.movieIdx }" />
								<input type="hidden" name="reviewIdx" value="${rvw.reviewIdx }" />
								<input type="hidden" name="reviewMemberIdx" value="${rvw.memberIdx }" />
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="reviewModalLabel${rvw.reviewIdx }">
												<c:choose>
													<c:when test="${rvw.memberIdx == memberIdx }">
														<textarea name="reviewTitle" class="border rounded-3" rows="1" cols="30"
															style="resize: none; border: none; width: 100%;">${rvw.reviewTitle }</textarea>
													</c:when>
													<c:otherwise>
														${rvw.reviewTitle}
													</c:otherwise>
												</c:choose>
											</h4>
											<span>${rvw.reviewWriter}</span>
										</div>
										<div class="modal-body" style="height: 300px;">
											<c:choose>
												<c:when test="${rvw.memberIdx == memberIdx }">
													<textarea name="reviewContent" class="border rounded-3" rows="3" cols="70"
														style="resize: none; border: none; width: 100%;">${rvw.reviewContent }</textarea>
												</c:when>
												<c:otherwise>
													${rvw.reviewContent}
												</c:otherwise>
											</c:choose>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-secondary"
												data-bs-dismiss="modal">닫기</button>
											<c:if test="${rvw.memberIdx == memberIdx }">
												<button type="button" class="btn btn-outline-warning"
													onclick="submitForm('/review/updateReview.do')">수정</button>
												<button type="button" class="btn btn-outline-danger"
													onclick="submitForm('/review/deleteReview.do')">삭제</button>
											</c:if>
										</div>
									</div>
								</div>
								</form>
							</div>
						</c:forEach>
						
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<!-- 리뷰 작성 폼 -->
				<h3 class="titleMyFont mt-4">리뷰 작성</h3>
				<form action="../review/insertReview.do" method="post">
					<c:choose>
						<c:when test="${memberIdx != null }">
							<input type="hidden" name="movieIdx" value="${detail.movieIdx }" />
							<div class="">
								<div>
									<input type="text" name="reviewTitle" class="rounded-3"
										placeholder="제목" style="border: none;" />
								</div>
								<div class="my-1">
									<textarea name="reviewContent" class="rounded-3"
										placeholder="리뷰를 작성해주세요." rows="3" cols="70"
										style="resize: none; border: none;"></textarea>
								</div>
							</div>
							<div>
								<button type="submit" class="btn btn-light">리뷰 작성</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="">
								<div>
									<input type="text" name="reviewTitle" class="rounded-3"
										placeholder="제목" style="border: none;" disabled />
								</div>
								<div class="my-1">
									<textarea name="reviewContent" class="rounded-3"
										placeholder="로그인해주세요." rows="3" cols="70"
										style="resize: none; border: none;" disabled></textarea>
								</div>
							</div>
							<div>
								<button type="submit" class="btn btn-light" disabled>리뷰
									작성</button>
							</div>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
			<div class="mt-5">
				<h3 class="titleMyFont">관련 영화 추천</h3>
				<c:forEach var="item" items="${rankMovie }">
					<a href="/movie/detail.do?movieIdx=${item.movieIdx }">
						<div class="like_box">
							<div class="p-2 pt-0" style="height: 250px;">
								<img src="/resources/uploads/${item.movieUploadOriginName }"
									width="185px" height="220px" style="overflow: hidden;" alt="" />
							</div>
							<div>
								<p class="m-0">${item.movieTitle }</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</main>


	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- script -->
	<!-- copyURL.js -->
	<script src="/resources/js/common/movie.js"></script>

	<script src="/resources/js/wish/cart_button.js"></script>
	<script src="/resources/js/wish/like.js"></script>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
	<!-- submitForm2.js -->
	<script type="text/javascript"
		src="/resources/js/common/submitForm2.js"></script>
</body>
</html>