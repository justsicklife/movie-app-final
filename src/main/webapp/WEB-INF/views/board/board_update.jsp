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
	<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="/resources/js/common/smarteditor.js" charset="utf-8"></script>
</c:if>
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="../common/header.jsp"%>

	<!-- main section -->
	<main class="container py-5" style="min-height: 730px;">
		<!-- 작성 -->
		<h3>게시물 수정</h3>
		<hr>
		<br/>
		<form id="form-submit" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boardIdx" value="${detail.boardIdx }" />
			<input type="hidden" name="boardMemberIdx"
				value="${detail.boardMemberIdx }" />
			<div class="row">
				<div class="col-2 mb-3">
					<select class="form-select" id="category" name="boardCategory"
						${detail.boardMemberIdx != loginMemberIdx ? 'disabled' : ''}>
						<option disabled>카테고리</option>
						<c:if test="${memberId eq 'admin' }">
							<option value="공지사항" ${detail.boardCategory == '공지사항' ? 'selected' : ''}>공지사항</option>
						</c:if>
						<option value="잡담" ${detail.boardCategory == '잡담' ? 'selected' : ''}>잡담</option>
						<option value="정보" ${detail.boardCategory == '정보' ? 'selected' : ''}>정보</option>
						<option value="공유" ${detail.boardCategory == '공유' ? 'selected' : ''}>공유</option>
					</select>
				</div>
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="boardTitle"
					maxlength="33" id="title" value="${detail.boardTitle }"
					placeholder="제목을 입력하세요"
					${detail.boardMemberIdx != loginMemberIdx ? 'readonly' : ''}>
			</div>
			<div id="smarteditor" class="mb-3 justify-content-center"
				style="background-color: #fff;">
				<c:choose>
					<c:when test="${detail.boardMemberIdx == loginMemberIdx }">
						<textarea name="boardContent" id="editorTxt" class="form-control"
							rows="13" cols="10" placeholder="내용을 입력하세요">${detail.boardContent }
              </textarea>
					</c:when>
					<c:otherwise>
						<div id="editorTxt" class="form-control" style="height: 300px;">${detail.boardContent }</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="row">
				<div class="col text-center">
					<button type="button" class="btn btn-outline-secondary"
						onclick="history.back()">취소</button>
					<c:if test="${detail.boardMemberIdx == loginMemberIdx }">
						<button type="button" class="btn btn-outline-warning"
							onclick="submitForm('/board/update.do')">수정</button>
						<button type="button" class="btn btn-outline-danger"
							onclick="submitForm('/board/delete.do')">삭제</button>
					</c:if>
				</div>
			</div>
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
	<!-- submitForm.js -->
	<script type="text/javascript"
		src="../../../resources/js/common/submitForm.js"></script>
</body>
</html>