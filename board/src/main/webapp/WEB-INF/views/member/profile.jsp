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
    <!-- custom JS -->
    <script src="/js/profile.js"></script>
    <script>
        let insIpt = '<input type="text" class="form-control" id="introduce" placeholder="목표, 자기소개, 의지 등"' +
            'value="<c:if test="${not empty profile.introduce}">${profile.introduce}</c:if>">';
    </script>
    <style>
        p{
            margin: 2px;
        }
        button{
            margin: 1px 0px 0px 5px;
        }
    </style>
    <title>프로필</title>
</head>
<body>
<header class="p-3 mb-3">
    <%@include file="../nav.jsp"%>
</header>
<div class="container wrapper">
    <div class="main-body">
        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="../../../resources/upload/member_Img/${profile.member_img}" id="member_img" class="rounded-circle" width="150" height="150">
                            <div class="mt-3">
                                <h4>${memberId}</h4>
                                <div>
                                    <c:if test="${empty profile.introduce}">
                                        <p class="text-secondary mb-1" id="introduce">목표, 자기소개, 의지 등을 적어주세요</p>
                                    </c:if>
                                    <c:if test="${profile.introduce ne ''}">
                                        <p class="text-secondary mb-1" id="introduce">${profile.introduce}</p>
                                    </c:if>
                                </div>
                                <button class="btn btn-primary" id="edit_Img">이미지 변경</button>
                                <button class="btn btn-outline-primary" id="edit">프로필 수정</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">아이디</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">${memberId}</div>
                        </div><hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">이메일</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"><p id="member_email">${member.member_email}</p></div>
                        </div><hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">성별</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"><p id="member_gender">${member.member_gender}</p></div>
                        </div><hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">가입 일자</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"><fmt:formatDate value="${member.member_joinDate}" pattern="yyyy-MM-dd"/></div>
                        </div><hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">총 게시글 수</h6>
                            </div>
                            <div class="col-sm-9 text-secondary"><p id="post_cnt">${allCount} 개</p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="alertModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">프로필 이미지 설정</h5>
            </div>
            <div class="modal-body">
                <form method="POST" enctype="multipart/form-data" id="imageUploadForm">
                    <input class="form-control" id="img_file" name="file" type="file" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="imgFormSubmit" data-bs-dismiss="modal">변경</button>
            </div>
        </div>
    </div>

</div>

</body>
</html>


