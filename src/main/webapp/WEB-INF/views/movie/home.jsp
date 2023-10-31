<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="/resources/mimg/movieRating/18.svg" type="">
<title>Movivimvap</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- nice select  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
	integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
	crossorigin="anonymous" />
<!-- font awesome style -->
<link href="../../../resources/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="../../../resources/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="../../../resources/css/responsive.css" rel="stylesheet" />

<!-- font awesome -->
<script src="https://kit.fontawesome.com/0cf27f7ac1.js"
	crossorigin="anonymous"></script>
<!-- common (인혁) -->
<link rel="stylesheet" href="../../../resources/css/common.css">

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

</head>

<body id="homeBack" style="background-image:url('../../../resources/mimg/10.jpg')">
	<div class="hero_area">
<!-- 		<div class="bg-box"> -->
<!-- 			<img src="../../../resources/mimg/10.jpg" alt=""> -->
<!-- 		</div> -->
		<!-- 헤더 -->
		<%@ include file="../common/header.jsp"%>

		<!-- slider section -->
		<section class="slider_section ">
			<div id="customCarousel1" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container ">
							<div class="row">
								<div class="col-md-7 col-lg-6">
									<div class="detail-box">
										<h1>Oppenheimer</h1>
										<p>Nuclear Launch Detected</p>
										<div class="btn-box">
											<a href="detail.do?movieIdx=15" class="btn1"> Watch Now </a>
										</div>
									</div>
								</div>
								<div class="col-md-5 col-lg-6 ">
									<img class="rounded-3" src="../../../resources/mimg/11.jpg" width="100%" height="auto">							
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container">
							<div class="row">
								<div class="col-md-7 col-lg-6">
									<div class="detail-box">
										<h1>Game of Thrones</h1>
										<p>winter is coming winter is coming winter is coming winter is coming winter is coming winter is coming </p>
										<div class="btn-box">
											<a href="detail.do?movieIdx=37" class="btn1"> Watch Now </a>
										</div>
									</div>
								</div>
								<div class="col-md-5 col-lg-6">
									<img class="rounded-3" src="../../../resources/mimg/got.jpg" width="100%" height="auto">						
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container">
							<div class="row">
								<div class="col-md-7 col-lg-6 ">
									<div class="detail-box">
										<h1>John Wick 4</h1>
										<p>Doloremque, itaque aperiam facilis rerum, commodi,
											temporibus sapiente ad mollitia laborum quam quisquam esse
											error unde. Tempora ex doloremque, labore, sunt repellat
											dolore, iste magni quos nihil ducimus libero ipsam.</p>
										<div class="btn-box">
											<a href="detail.do?movieIdx=38" class="btn1"> Watch Now </a>
										</div>
									</div>
								</div>
								<div class="col-md-5 col-lg-6 ">
									<img class="rounded-3" src="../../../resources/mimg/wick.jpg" width="100%" height="auto">							
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<ol class="carousel-indicators">
						<li data-target="#customCarousel1" data-slide-to="0"
							class="active"></li>
						<li data-target="#customCarousel1" data-slide-to="1"></li>
						<li data-target="#customCarousel1" data-slide-to="2"></li>
					</ol>
				</div>
			</div>

		</section>
		<!-- end slider section -->
		
	</div>
	<!-- 메인 -->
	<main class="album py-5 bg-dark">
		<div class="container">
			<!-- 영화 전체 목록 -->
			<div class="row mb-4">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<div class="col-lg-3 mb-3">
							<div class="card"
								style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
								<div
									style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
								<div class="card-body">
									<a href="detail.do?movieIdx=${item.movieIdx}">
										<h6>${item.movieTitle }</h6>
									</a>
									<p class="card-text"></p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 장르별로 -->
			<!-- 스릴러 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">스릴러</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('스릴러') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 어드벤쳐 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">어드벤쳐</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('어드벤쳐') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 로맨스 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">로맨스</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('로맨스') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 스포츠 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">스포츠</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('스포츠') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 액션 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">액션</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('액션') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 미스터리 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">미스터리</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('미스터리') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 판타지 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">판타지</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('판타지') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 전쟁 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">전쟁</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('전쟁') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 코미디 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">코미디</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('코미디') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 히어로 -->
			<div class="row mb-4">
				<h4 class="titleMyFont">히어로</h4>
				<hr class="text-warning">
				<div class="d-flex overflow-auto">
					<c:forEach var="item" items='${movieList }'>
						<c:if test="${item.movieGenre.contains('히어로') }">
							<div class="col-lg-3 mb-3">
								<div class="card"
									style="height: 500px; color: #fff; background-color: #222831; box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
									<div
										style="height: 80%; border-radius: 0 0 0 40px; background-image: url('/resources/uploads/${item.movieUploadOriginName}'); background-size: cover; background-repeat: no-repeat; background-position: top center;"></div>
									<div class="card-body">
										<a href="detail.do?movieIdx=${item.movieIdx}">
											<h6>${item.movieTitle }</h6>
										</a>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>
	<!-- end main section -->

	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp"%>

	<!-- jQery -->
	<script src="../../../resources/js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script src="../../../resources/js/bootstrap.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<!-- owl slider -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
		
	</script>
	<!-- isotope js -->
	<script
		src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
	<!-- nice select -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
	<!-- custom js -->
	<script src="../../../resources/js/custom.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
		
	</script>
	<!-- End Google Map -->



</body>

</html>