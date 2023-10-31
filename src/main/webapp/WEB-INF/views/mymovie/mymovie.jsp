<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
<!-- MyMovie css -->
<link rel="stylesheet" href="/resources/css/myMovie.css">
<!-- <link rel="stylesheet" href="/resources/css/my_MyMovie_main.css"> -->

<style>
table {
	width: 100%;
	border-top: 2px solid lime;
	border-bottom: 2px solid lime;
}

td {
	text-align: right;
}

.movie_img {
	width: 200px !important;
	height: 250px !important;
	position: relative;
}

.movie_img>img {
	width: inherit;
	height: inherit;
}
</style>

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
						<a href="/mymovie/list.do" class="nav-link active" aria-current="page">
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
			<div class="col-lg-1"></div>
			
			<c:choose>
				<c:when test="${empty mymovieList}">
					<div class="col-lg-9 container">
						<h3 class="titleMyFont m-0">소장한 영화</h3>
						<hr class="text-warning mb-5">
						<div class="row">
							<div class="col-lg-9">
								<div class="row"></div>
								<div class="container">
									<h3>구매목록이 존재하지 않습니다.</h3>
								</div>
							</div>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div class="col-lg-8">
						<h3 class="titleMyFont d-inline-block m-0">소장한 영화</h3><span class="float-end">전체 영화(총 ${mymovieList.size()}개)</span>
						<hr class="text-warning mb-5">
						<div class="row">
<%-- 							<c:forEach var="item" items="${detailMyMovie}"> --%>
<%-- 								<div class="movie_index" style="display: none;">${item.movie_index}</div> --%>
<!-- 								<div class="col-lg-4 m-3 movie_img"> -->
<%-- 									<img src="/resources/uploads/${item.movie_upload_origin_name}" alt="" /> --%>
<!-- 									<p> -->
<%-- 										<a href="/movie/detail.do?movieIdx=${item.movie_index }"> --%>
<%-- 											${item.movie_title } --%>
<!-- 										</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<%-- 							</c:forEach> --%>
							<c:forEach var="item" items="${detailMyMovie }">
									<div class="like_box">
										<a href="/movie/detail.do?movieIdx=${item.movie_index }">
											<div class="p-2 pt-0" style="height: 250px;">
												<img src="/resources/uploads/${item.movie_upload_origin_name }"
													width="100%" height="100%" style="overflow: hidden;" alt="" />
											</div>
											<p>${item.movie_title }</p>
										</a>
									</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-lg-1"></div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- end MyMovie section -->
	</main>
	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp"%>

	<!-- script -->
	<!-- ajax -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script src="https://kit.fontawesome.com/0cf27f7ac1.js"
		crossorigin="anonymous"></script>
	<!-- <script src="/resources/js/myMovie.js"></script> -->

</body>

</html>