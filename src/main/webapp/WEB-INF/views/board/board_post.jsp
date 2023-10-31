<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- head 공통 include -->
<%@ include file="../common/head.jsp"%>
<!-- smartEditor jQuery -->
<%@ include file="../common/smarteditor.jsp" %>
<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/common/smarteditor.js" charset="utf-8"></script>
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="../common/header.jsp" %>

	<!-- main section -->
	<main class="container py-5" style="min-height: 730px;">
		<!-- 작성 -->
		<h3>글쓰기</h3>
		<hr>
		<br />
		<form action="/board/insert.do" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-2 mb-3">
					<select class="form-select" id="category" name="boardCategory">
						<option disabled>카테고리</option>
						<c:if test="${memberId eq 'admin' }">
							<option value="공지사항">공지사항</option>
						</c:if>
						<option value="잡담">잡담</option>
						<option value="정보">정보</option>
						<option value="공유">공유</option>
					</select>
				</div>
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="boardTitle" maxlength="33"
					id="title" placeholder="제목을 입력하세요">
			</div>
			<div id="smarteditor" class="mb-3 justify-content-center" style="background-color:#fff;">
				<textarea name="boardContent" id="editorTxt" class="form-control" rows="13"
					cols="10" placeholder="내용을 입력하세요"></textarea>
			</div>
			<div class="row">
				<div class="col text-center">
					<button type="button" class="btn btn-outline-secondary"
						onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-outline-warning" onclick="save()">작성</button>
				</div>
			</div>
		</form>

	</main>
	<!-- end main section -->

	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- /푸터 -->
	<!-- script -->
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>