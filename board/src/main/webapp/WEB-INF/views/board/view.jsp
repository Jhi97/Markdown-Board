<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Toast UI Editor Viewer-->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
    <title>Hello, world!</title>
    <style>
        span.view_category::after{
            padding: 0px 5px 0px 5px;
            content: "|";
        }
        .info{
            text-align: right;
        }
        .content_head{
            margin-bottom: 30px;
        }
        .viewer{
            margin: 30px 0px 30px 0px;
        }
        .btn_group{
            float: left;
        }
        .btn_write{
            float: right;
        }
    </style>
</head>
<body>
    <header class="p-3 mb-3">
        <%@include file="../nav.jsp"%>
    </header>

    <div class="container">
        <div class="content_head">
            <h2>${post.title}</h2>
            <div class="info">
                <span class="view_category">${post.category}</span>
                <span class="write_date">
                    <fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd"/>
                </span>
            </div>
        </div>
        <div class="viewer" id="viewer"></div>

        <footer>
            <div class="btn_group">
                <button type="button" class="btn btn-primary" id="main">홈으로</button>
                <button type="button" class="btn btn-secondary" id="back">뒤로</button>
            </div>
            <div class="btn_write">
                <button type="button" class="btn btn-primary" id="write">글쓰기</button>
            </div>
        </footer>
    </div>



<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 개행 처리
    let contents = '${post.contents}';
    contents = contents.replace(/<br>/g, '\n');

    const viewer = new toastui.Editor({
        el: document.querySelector('#viewer'),
        initialValue: contents
    });
    $(document).ready(function(){
        $('button').click(function () {
            let val = $(this).attr("id");
            if (val == 'back') {
                back_fn();
            } else{
                window.location.href = '/board/'+val;
            }
        });
        function back_fn(){
            window.history.back();
        }
    });
</script>
</body>
</html>