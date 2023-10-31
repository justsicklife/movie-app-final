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
	<main class="container px-0">
		<div class="row mt-5">
		<h3 class="titleMyFont">배우 목록</h3>
		<hr class="text-warning">
			<div class="col-lg-1"></div>
			<section class="col-lg-10">
				<!-- 배우 목록 -->
				<c:forEach var="item" items="${staffList }">
					<a href="/staff/detail.do?id=${item.staffIdx }">
						<div class="like_box">
							<div class="p-2 pt-0" style="height: 250px;">
								<img src="/resources/uploads/${item.staffUploadOriginName}"
									width="185px" height="220px" style="overflow: hidden;" alt="" />
							</div>
							<div>
								<p class="m-0">${item.staffName }</p>
								<p>${item.staffRole }</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</section>
			<div class="col-lg-1"></div>
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