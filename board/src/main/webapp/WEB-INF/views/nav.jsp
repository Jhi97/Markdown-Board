<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <ul class="nav col-9 col-lg-auto me-lg-auto mb-2 mb-md-0 custom-font1" style="font-size: 25px; font-weight: bold">
            <%=session.getAttribute("memberId")%>'s Board
        </ul>
        <ul class="nav col-2 custom-font2" style="font-size: 19px;">
            <li><a href="/board/main" class="nav-link px-3">홈</a></li>
            <li><a href="/board/write" class="nav-link px-3">글쓰기</a></li>
        </ul>

        <div class="dropdown text-end">
            <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="../../../resources/upload/member_Img/${profile.member_img}" alt="mdo" width="32" height="32" class="rounded-circle">
            </a>
            <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                <li><a class="dropdown-item" href="/board/write">글쓰기</a></li>
                <li><a class="dropdown-item" href="/member/profile">프로필</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/logout">로그아웃</a></li>
            </ul>
        </div>
    </div>
    <hr/>
</div>