<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ERROR</title>
    <!-- jQuery CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        * {
            position: relative;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .centered {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            margin-bottom: 50px;
            font-family: 'Lato', sans-serif;
            font-size: 50px;
        }
        .container{
            text-align: center;
        }
    </style>
</head>
<body>

<section class="centered">
    <h1>${status} ${error}</h1>
    <div class="container">
        <!-- 로그인 미확인 -->
        <c:if test="${status eq 500}">
            <h4>${message}</h4>
        </c:if>
        <!-- 404 또는 bad request 처리 -->
        <c:if test="${status eq 404 || status eq 400}">
            <h4>페이지를 찾지 못하였습니다</h4>
        </c:if>
        <p>이용에 불편을 드려 죄송합니다</p>
    </div>
    <button type="button" class="btn btn-primary" onclick="window.location.href='/'">홈으로</button>
</section>
</body>
</html>