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
    <!-- Bootstrap CSS, JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Toast UI Editor Viewer-->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/view.css">
    <title>${post.title} - ${post.category}</title>
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
                <button type="button" class="btn btn-primary locationBtn" id="main">홈으로</button>
                <button type="button" class="btn btn-secondary locationBtn" id="back">뒤로</button>
            </div>
            <div class="btn_write">
                <button type="button" class="btn btn-primary locationBtn" id="modify">수정</button>
                <button type="button" class="btn btn-primary locationBtn" id="delete">삭제</button>
            </div>
        </footer>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="alertModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">알림</h5>
                </div>
                <div class="modal-body">
                    <p id="alert">해당 게시글을 삭제하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="warningConfirm" data-bs-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-secondary" id="cancel" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        let contents = '${post.contents}';
        let post_num = ${post.post_num};

    </script>
    <!-- Custom JS -->
    <script src="/js/view.js"></script>
</body>
</html>