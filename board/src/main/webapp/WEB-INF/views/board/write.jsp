<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <!-- TOAST UI Editor -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <title>메모 작성하기</title>
</head>
<body>
    <header class="p-3 mb-3">
        <%@include file="../nav.jsp"%>
    </header>
    <div class="container">
        <h1>글쓰기</h1> <br/>
        <div class="input-group" style="height: 50px">
            <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
            <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                <span name="category" id="category">카테고리 선택</span>
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">새 카테고리</a></li>
            </ul>
            <button type="button" class="btn btn-primary" id="postSubmit" name="postSubmit">작성완료</button>
        </div>
        <!-- TOAST UI Editor-->
        <div class="" id="editor"></div>
        <!-- TOAST UI Editor Contents-->
        <div class="" id="contents"></div>
    </div>

<!-- Bootstrap js -->
<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        height: '700px',
        initialEditType: 'markdown',
        initialValue: '### 내용을 입력하세요'
    });
    // 컨텐츠 내용 확인
    console.log(editor.getHTML());
</script>
</body>
</html>