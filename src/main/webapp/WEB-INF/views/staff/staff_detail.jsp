<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
</head>

<body>

	<!-- 헤더 -->
	<%@ include file="../common/header.jsp"%>

	<!-- 메인 -->
	<main class="container py-5" style="min-height: 600px;">
		<p class="category d-inline-block"><a href="/staff/list.do">>배우목록</a></p>
		<div class="row mb-3 d-flex justify-content-center text-center" style="width: 560 px;">
			<div class="col-md-3">
				<img class="rounded" src="../../../resources/uploads/${staff.staffUploadOriginName}"
					alt="" width="100%" height="auto">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mt-3 mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block mb-2 text-warning">Info</strong>
						<!-- 배우 이름 -->
						<h3 class="mb-0">${staff.staffName }</h3>
						<!-- 배우 나이 -->
						<div class="mb-1 text-muted">${staff.staffBirth} (${age}세)</div>
						<!-- 배우 성별 -->
						<div class="mb-1 text-muted">${staff.staffSex }</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static text-start">
						<strong class="d-inline-block mb-2 text-warning">요약</strong>
						<p>${staff.staffSummary }</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-2"></div>

		<div class="row g-5">
			<div class="col-md-8">
				<h3 class="mt-4 titleMyFont">필모그래피</h3>
				<section class="">
					<!-- 출연 영화 목록 -->
					<c:forEach var="movie" items="${movieList }">
						<a href="/movie/detail.do?movieIdx=${movie.movieIdx}">
							<div class="like_box">
								<div class="p-2 pt-0" style="height: 250px;">
									<img width="185px" height="220px" style="overflow: hidden;"
										src="../../../resources/uploads/${movie.movieUploadOriginName}"
										alt="">
								</div>
								<div>
									<p>${movie.movieTitle }</p>
								</div>
							</div>
						</a>
					</c:forEach>
				</section>
			</div>
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
</body>
</html>