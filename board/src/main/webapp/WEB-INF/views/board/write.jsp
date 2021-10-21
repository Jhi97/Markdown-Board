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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <!-- TOAST UI Editor -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <title>글쓰기</title>
    <style>
        body {
            overflow: hidden;
        }
        header {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <header class="p-3 mb-3">
        <%@include file="../nav.jsp"%>
    </header>
    <div class="container">
        <div class="input-group" style="height: 50px">
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
    <hr/>

<!-- Bootstrap js -->
<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        height: '750px',
        initialEditType: 'markdown',
        initialValue: '### 내용을 입력하세요'
    });
    // 컨텐츠 내용 확인
    console.log(editor.getMarkdown());

    // 하단 마크다운 위지웍 선택 탭 삭제
    let selectTab = document.querySelectorAll("div.tab-item");
    selectTab[2].style.display = 'none';
    selectTab[3].style.display = 'none';

    $(document).ready(function(){
        let modal = $('#alertModal');
        //카테고리 선택함수
        $('.cateList').click(function (){
            $('#category').html($(this).html());
        });

        //카테고리 생성 모달
        $('#createCate').click(function(){
            $('#newCate, #categoryConfirm').css('display','inline');
            $('#warning, #warningConfirm').css('display','none');
            modal.modal('show');
        });
        // 카테고리 생성 클릭 시 카테고리 적용
        $('#categoryConfirm').click(function(){
            let newCategory = $('#newCate').val();
            $('#category').html(newCategory);
        });
        // 작성완료 버튼 클릭 시
        $('#postSubmit').click(function(){
            let title = $('#title').val();
            let category = $('#category').html();
            let contents = editor.getMarkdown();
            console.log(contents);
            //제목 입력 체크
            if (title == "" || category=="") {
                $('#warning, #warningConfirm').css('display','inline');
                $('#newCate, #categoryConfirm').css('display','none');
                $('#warning').text('제목 또는 카테고리를 입력해주세요!');
                modal.modal('show');
                return false;
            }
            //카테고리 선택 안할 시 NULL 값
            if(category=='선택안함'){
                category=null;
            }
            let data = {
                'title': title,
                'category': category,
                'contents': contents
            };
            //ajax를 통한 게시글 저장
            $.ajax({
                url : "/board/write",
                type : "POST",
                data : JSON.stringify(data),
                contentType: 'application/json; charset:UTF-8',
                success: function (data){
                    // 이전 정보를 저장하지 않도록 replace 사용
                    window.location.replace(data);
                },
                error: function() {
                    alert('error');
                }
            });
        });
    });
</script>
</body>
</html>