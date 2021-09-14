<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
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

<div class="container">

    <div class="py-5 text-center">
        <div><h1>Jeon's Board</h1></div>
        <br><hr>
        <h2>로그인</h2>
    </div>

    <form id="loginForm" class="loginForm" method="post"></form>
    <div>
        <label for="itemName">아이디</label>
        <input type="text" id="itemName" class="form-control" placeholder="이름을 입력하세요">
    </div>
    <div>
        <label for="price">비밀번호</label>
        <input type="text" id="price" class="form-control" placeholder="가격을 입력하세요">
    </div>

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <button class="w-100 btn btn-primary btn-lg" type="submit">로그인</button>
        </div>
        <div class="col">
            <button class="w-100 btn btn-secondary btn-lg" onclick="location.href='member/join'"type="button">회원가입</button>
        </div>
    </div>

    </form>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>