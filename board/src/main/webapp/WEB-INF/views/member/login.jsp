<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
<%--    <link href="/resources/static/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 560px;
            padding-top: 5%;
        }
        input {
            margin-bottom: 10px;
        }
    </style>
    <title>로그인</title>

</head>
<body>
<!-- 에러페이지 접근 후 로그인 확인 후 메인화면 이동 -->
<c:if test="${memberNum ne null}">
    <script>
        location.replace("/board/main");
    </script>
</c:if>

<div class="container">

    <div class="py-5 text-center">
        <div><h1>Jeon's Board</h1></div>
        <br><hr>
        <h2>로그인</h2>
    </div>

    <form id="loginForm" class="loginForm" method="post">
        <div>
            <label for="member_id">아이디</label>
            <input type="text" id="member_id" name="member_id" class="form-control" placeholder="아이디를 입력하세요">
        </div>
        <div>
            <label for="member_pw">비밀번호</label>
            <input type="password" id="member_pw" name="member_pw" class="form-control" placeholder="비밀번호를 입력하세요">
        </div>

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <button type="submit" class="w-100 btn btn-primary btn-lg" >로그인</button>
            </div>
            <div class="col">
                <button class="w-100 btn btn-secondary btn-lg" onclick="location.href='member/join'"type="button">회원가입</button>
            </div>
        </div>

        <c:if test="${msg == false}">
            <script>
                alert('아이디 혹은 비밀번호를 확인하세요.');
            </script>
        </c:if>
    </form>

    <!-- Modal -->
    <div class="modal fade" id="alertModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">경고</h5>
                </div>
                <div class="modal-body">
                    <p class="modal-contents"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <hr/>



</div>
<!-- Bootstrap JS -->
<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>