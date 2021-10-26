<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS, JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- TOAST UI Editor -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>


    <style>
        body {
            overflow: hidden;
        }
        header {
            margin-bottom: 0px;
        }
        .input-group{
            height: 50px;
        }
    </style>
    <title>글쓰기</title>
</head>
<body>
    <header class="p-3 mb-3">
        <%@include file="../nav.jsp"%>
    </header>
    <div class="container">
        <div class="input-group">
            <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
            <button type="button" id="cateDown" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                <span name="category" id="category">카테고리 선택</span>
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item cateList" href="#">선택안함</a></li>
                <li><hr class="dropdown-divider"></li>
                <c:forEach items="${categories}" var="category">
                    <li><a class="dropdown-item cateList" href="#">${category}</a></li>
                </c:forEach>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" id="createCate" href="#">새 카테고리</a></li>
            </ul>
            <button type="button" class="btn btn-primary" id="postSubmit" name="postSubmit">작성완료</button>
        </div>

        <!-- TOAST UI Editor-->
        <div class="" id="editor"></div>
        <!-- TOAST UI Editor Contents-->
        <div class="" id="contents"></div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="alertModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">카테고리 생성</h5>
                </div>
                <div class="modal-body">
                    <input type="text" class="form-control" id="newCate" placeholder="새 카테고리 이름">
                    <p id="warning"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="warningConfirm" data-bs-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-primary" id="categoryConfirm" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Custom JS -->
    <script src="/js/write.js"></script>
</body>
</html>