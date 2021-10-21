<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    <link href="/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>${memberId}'s Board</title>

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
        a{
            text-decoration: none;
        }
        .categories{
            margin-bottom: 5px;
        }
    </style>
    <script>
        function cate_click_fn(ths){
            let val = $(ths).text();
            console.log(val);
            $.ajax({
                url : "/board/category",
                type : "get",
                data : {category: val},
                success : function(data){
                    alert('success');
                },
                error : function(){
                    alert('error')
                }
            });
            $(document).ready(function(){
               let num = ${page.num};
               $('ul>li>')
            });
            // $.ajax({
            //     url : "/board/write",
            //     type : "POST",
            //     data : JSON.stringify(data),
            //     contentType: 'application/json; charset:UTF-8',
            //     success: function (data){
            //         // 이전 정보를 저장하지 않도록 replace 사용
            //         window.location.replace(data);
            //     },
            //     error: function() {
            //         alert('error');
            //     }
            // });
        }
    </script>
</head>
<body>
    <header class="p-3 mb-3">
        <%@include file="../nav.jsp"%>
    </header>
    <section class="container">
        <div class="row h-100">
            <div class="col-10 text-area">
                <div class="text-title border-bottom">
                    글 목록
                </div>
                <!-- 글 목록 출력 -->
                <div class="text-body">
                    <c:if test="${fn:length(post) == 0}">
                        <span>글이 없습니다. 글을 작성해 주세요.</span>
                    </c:if>
                    <c:if test="${fn:length(post) ne 0}">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="col-md-1">번호</th>
                                        <th class="col-md-4">제목</th>
                                        <th class="col-md-2">카테고리</th>
                                        <th class="col-md-2">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${post}" var="post">
                                    <tr>
                                        <td>${post.post_num}</td>
                                        <td><a href="/board/view?num=${post.post_num}">${post.title}</a></td>
                                        <td>${post.category}</td>
                                        <td><fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div style="display: flex; justify-content: center">
                                <ul class="pagination">
                                    <c:if test="${page.prev}">
                                        <li class="page-item"><a class="page-link" href="/board/main?num=${page.startPageNum - 1}">이전</a></li>
                                    </c:if>
                                    <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
                                    <li class="page-item <c:if test="${num eq page.num}">active</c:if>">
                                        <a class="page-link" href="/board/main?num=${num}">${num}</a>
                                    </li>
                                    </c:forEach>
                                    <c:if test="${page.next}">
                                        <li class="page-item"><a class="page-link" href="/board/main?num=${page.endPageNum + 1}">다음</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
            <!-- 글 목록 출력 끝 -->
            <!-- 카테고리 출력 -->
            <div class="col-2 category-area">
                <div class="category-title border-bottom">카테고리</div>
                <c:if test="${fn:length(post) ne 0}">
                    <div class="h-100 category-body">
                        <div class="categories"><a href="#">전체보기</a> (${allCount})</div>
                        <c:forEach items="${category}" var="category">
                            <c:if test="${category!=null}">
                                <div class="categories"><a href="#" onclick="cate_click_fn(this);">${category.name}</a> (${category.cnt})</div>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <!-- 카테고리 출력 끝-->

        </div>
    </section>

    <!-- Bootstrap JS-->
    <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>