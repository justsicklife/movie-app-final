<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="col-lg-2">
  <ul class="nav nav-pills flex-column mb-auto">
    <li class="nav-item">
      <a href="/member/detail.do?memberIdx=${memberIdx }" class="nav-link active" aria-current="page">
        <svg class="bi me-2" width="16" height="16">
          <use xlink:href="#home"></use>
        </svg> 계정정보
      </a>
    </li>
    <li>
      <a href="/wish/myWish.do" class="nav-link text-white">
        <svg class="bi me-2" width="16" height="16">
          <use xlink:href="#speedometer2"></use>
        </svg> 찜 목록
      </a>
    </li>
    <li>
      <a href="/cart/myCart.do" class="nav-link text-white">
        <svg class="bi me-2" width="16" height="16">
          <use xlink:href="#table"></use>
        </svg> 장바구니
      </a>
    </li>
    <li>
      <a href="/member/adminChatIndex.do" class="nav-link text-white">
        <svg class="bi me-2" width="16" height="16">
          <use xlink:href="#table"></use>
        </svg> admin_chat
      </a>
    </li>
    <li>
      <a href="/member/userChatIndex.do" class="nav-link text-white">
        <svg class="bi me-2" width="16" height="16">
          <use xlink:href="#table"></use>
        </svg> user_chat
      </a>
    </li>
  </ul>
</aside>