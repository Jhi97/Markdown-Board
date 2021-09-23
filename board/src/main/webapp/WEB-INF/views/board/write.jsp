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

    <title>메모 작성하기</title>
</head>
<body>
    <header class="p-3 mb-3">
        <%@include file="../nav.jsp"%>
    </header>
    <div class="container">
        <h1>TOAST UI Editor 테스트</h1>

        <!-- TOAST UI Editor-->
        <div class="" id="editor"></div>
        <!-- TOAST UI Editor Contents-->
        <div class="" id="contents"></div>
    </div>

<!-- Bootstrap js -->
<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script type="module">
    import Editor from '@toast-ui/editor';
    import '@toast-ui/editor/dist/toastui-editor.css';
    import '@toast-ui/editor/dist/theme/toastui-editor-dark.css';

    const editor = new Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        height: '500px',
        initialValue: content,
        theme: 'dark',
    });
</script>
</body>
</html>