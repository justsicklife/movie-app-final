<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!-- JSTL length를 계산하기 위한 taglib -->
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
				<!-- head 공통 include -->
				<%@ include file="../common/head.jsp" %>
					<!-- staff.css -->
					<link rel="stylesheet" href="/resources/css/staff/staff.css" />

					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
						integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
						crossorigin="anonymous" referrerpolicy="no-referrer"></script>
					<link rel="stylesheet"
						href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
						integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
						crossorigin="anonymous" referrerpolicy="no-referrer" />
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
						integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
						crossorigin="anonymous" referrerpolicy="no-referrer"></script>


					</head>

					<body>
						<!-- 헤더 -->
						<%@ include file="../common/header.jsp" %>

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
											<li class="nav-item"><a href="/member/detail.do?memberIdx=${memberIdx }"
													class="nav-link text-white"> 계정정보 </a></li>
											<li class="nav-item"><a href="/wish/myWish.do" class="nav-link text-white">
													찜 목록 </a></li>
											<li class="nav-item"><a href="/cart/myCart.do" class="nav-link text-white">
													장바구니 </a></li>
											<li class="nav-item"><a href="/mymovie/list.do" class="nav-link text-white">
													소장한 영화 </a></li>
											<c:if test="${memberId eq 'admin' }">
												<li class="nav-item"><a href="/movie/registerForm.do"
														class="nav-link text-white"> 영화 추가 </a></li>
												<li class="nav-item"><a href="/staff/registerForm.do"
														class="nav-link active" aria-current="page"> 영화 관계자추가 </a></li>
											</c:if>
										</ul>
									</aside>
									<div class="col-lg-1"></div>
									<div class="col-lg-7 mx-auto">
										<h3 class="titleMyFont d-inline-block m-0">영화 관계자 추가</h3>
										<hr class="text-warning mb-5">
										<div class="card mt-2 mx-auto p-4 bg-light">
											<div class="card-body bg-light">
												<div class="container">
													<form id="contact-form" action="/staff/register.do" method="post"
														enctype="multipart/form-data" role="form">
														<div class="controls">
															<div class="row">
																<div class="col-md-6">
																	<div class="form-floating">
																		<input id="staffName" type="text"
																			name="staffName" class="form-control"
																			required="required"
																			data-error="Firstname is required."> <label
																			class="text-dark" for="staffName">관계자
																			이름</label>
																	</div>
																</div>
																<div class="col-md-6 d-flex align-items-center">
																		<div class="form-check form-check-inline">
																			<input class="form-check-input" type="radio"
																				name="staffSex" id="inlineRadio1"
																				value="남성" checked>
																			<label class="form-check-label text-dark"
																				for="inlineRadio1">남성</label>
																		</div>
																		<div class="form-check form-check-inline">
																			<input class="form-check-input" type="radio"
																				name="staffSex" id="inlineRadio2"
																				value="여성">
																			<label class="form-check-label text-dark"
																				for="inlineRadio2">여성</label>
																		</div>
																</div>
																<div class="col-md-6">
																	<div class="form-floating">
																		<input required="required" type="date" class="form-control" name="staffBirth"/> <label
																			class="text-dark" for="staffBirth">관계자
																			생년월일</label>
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-floating">
																		<select id="staffRole" class="form-select" name="staffRole"
																			aria-label="Default select example">
																			<option selected value="배우">배우</option>
																			<option value="감독">감독</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-md-12">
																	<div class="form-group text-dark my-3">
																		<label for="staffSummary">소개</label>
																		<textarea id="staffSummary" name="staffSummary"
																			class="form-control" rows="4"
																			required="required"
																			data-error="Please, leave us a message."></textarea>
																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-md-12">
																	<div class="form-group">
																		<label for="formFileDisabled"
																			class="form-label text-dark">
																			배우 프로필</label> <input class="form-control"
																			type="file" id="formFileDisabled"
																			name="upload" onChange="readURL(this);" />
																	</div>
																	<div class="text-center">
																		<img id="preview" class="poster_preview" />
																	</div>
																</div>
																<div class="col-md-12">
																	<input type="submit"
																		class="btn btn-secondary btn-send w-100 mt-3 pt-2 btn-block">
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
							<%@ include file="../common/footer.jsp" %>
								<!-- script -->
								<script
									src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
									integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
									crossorigin="anonymous"></script>
								<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
								<script src="/resources/js/register/poster.js"></script>
					</body>

					</html>