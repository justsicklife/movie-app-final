<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
<!-- cart.css -->
<link rel="stylesheet" href="/resources/css/cart/cart.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>
	<div id="user_id" style="display: none;">${userId}</div>
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
						<a href="/cart/myCart.do" class="nav-link active" aria-current="page">
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
			<div class="col-lg-1"></div>

			<c:choose>
				<c:when test="${empty cartList}">
					<div class="col-lg-9">
						<h3 class="titleMyFont mb-0">장바구니</h3>
						<hr class="text-warning mb-5">
						<div class="row">
							<div class="col-lg-9">								
								<div class="container">
									<h3>장바구니가 비어있습니다.</h3>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="col-lg-5">
						<div class="container p-0">
							<div class="row">
								<div class="col-12 p-0">
									<h3 class="titleMyFont d-inline-block m-0">장바구니</h3>
<!-- 									<input type="button" value="선택삭제" class="btn btn-outline-danger d-inline-block float-end" -->
<!-- 										onclick="deleteValue();"> -->
<!-- 									<i class="fa-regular fa-trash-can" style="color: #ff3856;"></i> -->
									<button type="button" class="btn float-end" onclick="deleteValue();"><i class="fa-regular fa-trash-can fa-xl" style="color: #ff3856;"></i></button>
									<hr class="text-warning mb-5">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-7">
								<label>전체상품(총 ${cartList.size()}개)</label>
							</div>
							<div class="col-lg-4">결제금액</div>
							<div class="col-lg-1 text-center pe-0">
								<div class="col-lg-12">
									<input type="checkbox" id="" name="selectall" class="form-check-input"
										onclick="selectAll(this)" />
								</div>
							</div>
						</div>
						<div class="row"
							style="border-top: 3px solid gray;">
							<c:forEach var="item" items="${detailCart}">
								<!-- <div class="row"> -->
								<div class="col-lg-3">
									<a href="/movie/detail.do?movieIdx=${item.movie_index}">
										<img src="/resources/uploads/${item.movie_upload_origin_name}"
											alt="" width="100px;" height="100px;" style="margin: 5px 0px;">
									</a>
								</div>
								<div class="col-lg-4">
									<a href="/movie/detail.do?movieIdx=${item.movie_index}">
										<p class="movie_title">${item.movie_title}</p>
									</a>
									<p class="movie_time">
										<i class="fa-solid fa-video"></i>&nbsp;&nbsp;|&nbsp;무제한 시청
									</p>
								</div>
								<div class="col-lg-4">
									<fmt:formatNumber value="${item.movie_price}" type="number" />
									원
								</div>
								
								<div class="col-lg-1 text-center pe-0">
									<input type="checkbox" id="checkbox_value" class="form-check-input"
										data-price="${item.movie_price}" name='chk'
										value="${item.movie_index}" onclick="checkSelectAll()" />
								</div>
								<!-- </div> -->
							</c:forEach>
						</div>
					</div>
					
					<div class="col-lg-1"></div>
					
					<div class="col-lg-3">
						<div class="p-2 pt-0">
<!-- 							<div class="buyer_info_title ">구매자 정보</div> -->
							<h3 class="titleMyFont d-inline-block m-0">구매자 정보</h3>
							<hr class="text-warning">
							
							<div class="buyer_info_box">
								<div class="buyer_name_box">
									<span class="buyer_label">이름</span> <span class="buyer_name">${memberName }</span>
								</div>
								<div class="buyer_email_box">
									<span class="buyer_label">이메일</span> <span class="buyer_email">${memberEmail }</span>
								</div>
								<hr class="text-warning mb-0">
<!-- 								<div class="buyer_phone_box"> -->
<!-- 									<span class="buyer_label">휴대폰 번호</span> <span -->
<!-- 										class="buyer_phone">01012345678</span> -->
<!-- 								</div> -->
							</div>
						</div>
						<table>
							<tbody>
								<tr>
									<th class="me-5" style="width: 80px;">결제 금액</th>
									<td>
										<input type="text" style="width: 200px; text-align: right;" name="total"
										id="total" value="0원" readonly="readonly">
									</td>
								</tr>
							</tbody>
							<tfoot>
							</tfoot>
						</table>
						<button onclick="requestPay()"
							class="btn btn-outline-warning mt-2 text-center w-100">주문하기</button>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
			<!-- end cart section -->
	</main>

	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp"%>

	<!-- script -->
	<!-- ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/0cf27f7ac1.js" crossorigin="anonymous"></script>
	<!-- cart.js -->
	<script src="/resources/js/cart/cart.js"></script>

</body>

</html>