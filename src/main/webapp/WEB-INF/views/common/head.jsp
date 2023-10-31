<!DOCTYPE html>
<html lang="ko-kr">
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="/resources/mimg/movieRating/18.svg" type="">
<title>Movivimvap</title>
<!-- CSS -->
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/0cf27f7ac1.js"
	crossorigin="anonymous"></script>
<!-- common (인혁) -->
<link rel="stylesheet" href="/resources/css/common.css">
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