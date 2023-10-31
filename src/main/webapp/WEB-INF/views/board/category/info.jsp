<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../../common/head.jsp"%>
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="../../common/header.jsp"%>

	<!-- main section -->
	<main class="container py-5" style="min-height: 730px;">
		<!-- 게시물 카테고리 -->
		<nav class="nav d-flex justify-content-center">
			<a class="p-2 link-secondary" href="/board/list.do">전체</a> <a
				class="p-2 link-secondary" href="/board/list.do?category=공지사항">공지사항</a>
			<a class="p-2 link-secondary" href="/board/list.do?category=잡담">잡담</a>
			<a class="p-2 link-secondary text-warning border-bottom border-warning" href="/board/list.do?category=정보">정보</a>
			<a class="p-2 link-secondary" href="/board/list.do?category=공유">공유</a>
		</nav>
		<!-- 게시물 목록 -->
		<section class="container">
			<!-- 게시물 -->
			<c:forEach var="ntc" items="${notice }">
				<a href="detail.do?boardIdx=${ntc.boardIdx}">
					<div class="row py-2 my-2 border-bottom bg-dark">
						<div class="col-1 text-center">공지</div>
						<div class="col-7">
							<div style="margin-bottom: 5px;">
								<div class="d-inline-block">
									<span class="category">${ntc.boardCategory }</span> <span
										class="postTitle">${ntc.boardTitle }</span>
								</div>
							</div>
						</div>
						<div class="col-4 text-end">
							<div class="d-inline-block">
								<div class="postEtc">${ntc.boardWriter }</div>
								<div class="postEtc">&nbsp;•&nbsp;</div>
								<div class="postEtc">${ntc.boardInDate }</div>
								<div class="postEtc">&nbsp;•&nbsp;</div>
								<div class="postEtc">
									<i class="fa-regular fa-eye" style="color: #b3b3b3;"></i>
									${ntc.boardViews }
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
			<c:choose>
				<c:when test="${empty list}">
					<div class="row py-5 my-2 border-bottom">
						<div class="text-center">
							<h3 class="d-inline-block">등록된 글이 없습니다.</h3>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${list }">
						<a href="detail.do?boardIdx=${item.boardIdx}">
							<div class="row py-2 my-2 border-bottom">
								<div class="col-1 text-center">${row }</div>
								<div class="col-11">
									<div class="container">
										<div style="margin-bottom: 5px;">
											<span class="category">${item.boardCategory }</span> <span
												class="postTitle">${item.boardTitle }</span>
											<c:if test="${item.boardCommentCnt != 0 }">
												<span class="text-warning">${item.boardCommentCnt }</span>
											</c:if>
										</div>
										<div>
											<div class="postEtc">${item.boardWriter }</div>
											<div class="postEtc">&nbsp;•&nbsp;</div>
											<div class="postEtc">${item.boardInDate }</div>
											<div class="postEtc">&nbsp;•&nbsp;</div>
											<div class="postEtc">
												<i class="fa-regular fa-eye" style="color: #b3b3b3;"></i>
												${item.boardViews }
											</div>
										</div>
									</div>
								</div>
							</div>
						</a>
						<c:set var="row" value="${row - 1 }" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</section>
		<!-- 페이징 버튼 -->
		<nav class="mt-3 mb-5">
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true"><i
									class="fa-solid fa-angles-left" style="color: #ffd900;"></i></span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true"><i
									class="fa-solid fa-angle-left" style="color: #ffd900;"></i></span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<!-- 1, 11, 21, 31, 41, .......... --> <a class="page-link"
							href="list.do?category=${category }&cpage=${ pi.startPage -1 }" aria-label="Previous">
								<span aria-hidden="true"><i
									class="fa-solid fa-angles-left" style="color: #ffd900;"></i></span>
						</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="list.do?category=${category }&cpage=${ pi.currentPage - 1}" aria-label="Previous">
								<span aria-hidden="true"><i
									class="fa-solid fa-angle-left" style="color: #ffd900;"></i></span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item"><a class="page-link ${pi.currentPage == page ? 'text-danger' : '' }"
						href="list.do?category=${category }&cpage=${page}">${page}</a></li>
				</c:forEach>

				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage}">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true"><i
									class="fa-solid fa-angle-right" style="color: #ffd900;"></i></span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true"><i
									class="fa-solid fa-angles-right" style="color: #ffd900;"></i></span>
						</a></li>
					</c:when>
					<c:when test="${pi.endPage eq pi.maxPage}">
						<li class="page-item"><a class="page-link"
							href="list.do?category=${category }&cpage=${pi.maxPage}" aria-label="Next"> <span
								aria-hidden="true"><i class="fa-solid fa-angles-right"
									style="color: #ffd900;"></i></span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="list.do?category=${category }&cpage=${pi.currentPage + 1}" aria-label="Next">
								<span aria-hidden="true"><i
									class="fa-solid fa-angle-right" style="color: #ffd900;"></i></span>
						</a></li>
						<li class="page-item">
							<!-- 10, 20, 30, 40, .... --> <a class="page-link"
							href="list.do?category=${category }&cpage=${pi.endPage+1}" aria-label="Next"> <span
								aria-hidden="true"><i class="fa-solid fa-angles-right"
									style="color: #ffd900;"></i></span>
						</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<!-- 게시글 검색 & 글쓰기 -->
		<div class="container">
			<div class="row">
				<div class="col-3"></div>
				<!-- 게시글 검색창 -->
				<div class="col-6">
					<form action="/board/list.do" method="get" role="search"
						class="d-flex align-items-center">
						<input type="search" class="form-control w-50 d-inline-block me-3"
							name="searchText" placeholder="게시글 검색">
						<button type="submit" class="btn btn-outline-warning">검색</button>
					</form>
				</div>
				<!-- 글쓰기 버튼 -->
				<div class="col-3 text-end">
					<c:if test="${isLog != null }">
						<button type="button" class="btn btn-outline-success"
							onclick="location.href='enrollForm.do'">글쓰기</button>
					</c:if>
				</div>
			</div>
		</div>
	</main>
	<!-- end main section -->
	<!-- 푸터 -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- /푸터 -->
	<!-- script -->
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>