<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
<!-- smartEditor jQuery -->
<c:if test="${detail.boardMemberIdx == loginMemberIdx }">
	<%@ include file="../common/smarteditor.jsp"%>
</c:if>
<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="../common/header.jsp"%>

	<!-- 게시글 상세보기 화면 -->
	<main class="container py-5" style="min-height: 730px;">
		<input type="hidden" name="boardIdx" value="${detail.boardIdx }" />
		<input type="hidden" name="boardMemberIdx" value="${detail.boardMemberIdx }" />
		
		<h3>${detail.boardTitle }</h3>
		<span>${detail.boardWriter }</span>
		<span>&nbsp;•&nbsp;</span>
		<span>${detail.boardInDate }</span>
		<span>&nbsp;•&nbsp;</span>
		<i class="fa-regular fa-eye" style="color: #b3b3b3;"></i><span>&nbsp;${detail.boardViews }</span>
		<hr>
		<br/>
		
		<div style="min-height: 300px;">${detail.boardContent }</div>
		<hr>
		<div class="row">
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='/board/list.do'">목록</button>
				<c:if test="${detail.boardMemberIdx == loginMemberIdx }">
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='updateForm.do?boardIdx=${detail.boardIdx}'">수정</button>
				</c:if>
			</div>
		</div>
		<hr>
		<h5>댓글</h5>
		<c:forEach var="cmt" items="${commentList }">
			<form id="form-submit" method="post">
				<div class="row py-2 my-2 border-bottom">
					<div class="col-1 d-flex justify-content-center align-items-center">
						<i class="fa-solid fa-user fa-2xl" style="color: #ffd900;"></i>
					</div>
					<div class="col-10 container">
						<div class="row">
							<span class="p-0">${cmt.commentWriter }
								<c:if test="${cmt.memberIdx == detail.boardMemberIdx }">
									<span class="postEtc text-warning p-1 border border-warning rounded-3">작성자</span>
								</c:if>
								<!-- 댓글 작성 시간 -->
								<span class="postEtc">${cmt.commentInDate }</span>
							</span>
						</div>
						<div class="row"><p>${cmt.commentContent }</p></div>
					</div>
					<div class="col-1 d-flex justify-content-center align-items-center">
						<c:if test="${loginMemberIdx == cmt.memberIdx}">
							<div class="dropdown">
								<button class="btn" type="button"
									id="dropdownMenuButton${cmt.commentIdx }" data-bs-toggle="dropdown"
									aria-expanded="false">
									<i class="fa-solid fa-ellipsis-vertical" style="color: #ffd900;"></i>
								</button>
								<ul class="dropdown-menu dropdown-menu-end p-1 bg-dark" style="min-width:0px" 
									aria-labelledby="dropdownMenuButton${cmt.commentIdx }">
									<li class="dropdown-item p-0 pb-1 bg-dark">
										<button type="button" data-bs-toggle="modal"
										data-bs-target="#cmtUpdModal${cmt.commentIdx }"
										class="btn btn-outline-warning"><i class="fa-solid fa-pen" style="color: #ffd900;"> 수정</i></button>
									</li>
									<li class="dropdown-item p-0 bg-dark">
										<button type="button"
										onclick="submitForm('/comment/deleteComment.do')"
										class="btn btn-outline-danger"><i class="fa-solid fa-trash-can" style="color: #c70000;"> 삭제</i></button>
									</li>
								</ul>
							</div>
						</c:if>
					</div>
				</div>
				<!-- 댓글 수정 모달 -->
				<div class="modal fade" id="cmtUpdModal${cmt.commentIdx }"
					tabindex="-1" aria-labelledby="cmtUpdModalLabel${cmt.commentIdx }"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-body">
								<input type="hidden" name="boardIdx" value="${detail.boardIdx }" />
								<input type="hidden" name="commentIdx"
									value="${cmt.commentIdx }" /> <input type="hidden"
									name="commentMemberIdx" value="${cmt.memberIdx }" />
								<textarea name="commentContent" class="border rounded-3"
									placeholder="댓글을 작성해주세요." rows="3" cols="70"
									style="resize: none; border: none; width: 100%;">${cmt.commentContent }</textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-outline-warning"
									onclick="submitForm('/comment/updateComment.do')">수정</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</c:forEach>
		<!-- 댓글 작성 폼 -->
		<form action="../comment/insertComment.do" method="post">
			<c:choose>
				<c:when test="${loginMemberIdx != null }">
					<input type="hidden" name="boardIdx" value="${detail.boardIdx }" />
					<div>
						<textarea name="commentContent" class="rounded-3"
							placeholder="댓글을 작성해주세요." rows="3" cols="70"
							style="resize: none; border: none;"></textarea>
					</div>
					<div>
						<button type="submit" class="btn btn-light">댓글 작성</button>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<textarea name="commentContent" class="rounded-3"
							placeholder="로그인해주세요." rows="3" cols="70"
							style="resize: none; border: none;" disabled></textarea>
					</div>
					<div>
						<button type="submit" class="btn btn-light" disabled>댓글 작성</button>
					</div>
				</c:otherwise>
			</c:choose>
		</form>
	</main>

	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp"%>
	<!-- /푸터 -->
	<!-- script -->
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