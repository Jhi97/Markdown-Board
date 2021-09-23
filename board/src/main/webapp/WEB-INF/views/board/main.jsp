<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>Jeon's Board</title>

    <style>

        .border-bottom{
            padding: 0px 10px 10px 10px;
            border-bottom: solid 1px;
        }
        .category-title, .text-title{
            font-size: 20px;
        }
        .category-body{
            margin-top: 10px;
            border-left: solid 1px #dee2e6;
        }
    </style>
</head>
<body>
    <header class="p-3 mb-3">
        <%@include file="../nav.jsp"%>
    </header>
    <section class="container">
        <div class="row h-100">
            <div class="col-9 text-area">
                <div class="text-title border-bottom">
                    글 제목
                </div>
                <div class="text-body">
                    글이 없습니다. 글을 작성해 주세요.
                </div>
            </div>
            <div class="col-3 category-area">
                <div class="category-title border-bottom">
                    Category
                </div>
                <div class="h-100 category-body">
                    <div>asfd</div>
                    <div>asdf</div>
                </div>
            </div>

        </div>
    </section>


    <!-- Bootstrap JS-->
    <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>