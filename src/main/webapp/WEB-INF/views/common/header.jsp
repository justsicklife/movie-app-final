<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<header>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark py-3 px-0">
			<div class="container-fluid">
				<a class="navbar-brand" href="/movie/list.do"><i class="fa-solid fa-film fa-lg" style="color: #ffd900;"></i></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#mynavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="mynavbar">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link" href="/movie/list.do">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/board/list.do">게시판</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/staff/list.do">인물</a>
						</li>
					</ul>
					<!-- 검색 -->
					<form action="/movie/list.do" method="get" role="search" class="d-flex">
						<div class="w-100 mx-3 d-flex flex-row-reverse">
							<input id="searchMovie" type="search" class="" placeholder="영화 검색" name="searchMovie">
						</div>
					</form>
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-regular fa-user fa-xl" style="color: #ffffff;"></i>
							<i class="fa-solid fa-sort-down fa-xl" style="color: #ffffff;"></i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="dropdownMenuButton1" id="headerDrop">
							<c:if test="${memberIdx != null }">
								<li class="dropdown-item">
									${memberEmail }
								</li>
							</c:if>
							<c:if test="${memberIdx == null }">
								<li><a class="dropdown-item" href="/member/loginIndex.do">로그인</a></li>
							</c:if>
							<c:if test="${memberIdx != null }">
								<c:choose>
									<c:when test="${memberId eq 'admin' }">
										<li><a class="dropdown-item" href="/member/detail.do?memberIdx=${memberIdx }">관리자 페이지</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="dropdown-item" href="/member/detail.do?memberIdx=${memberIdx }">마이페이지</a></li>
									</c:otherwise>
								</c:choose>								
								<li><a class="dropdown-item" href="/member/logout.do">로그아웃</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>