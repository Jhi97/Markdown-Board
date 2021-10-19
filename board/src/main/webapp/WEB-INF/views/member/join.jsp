<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <!-- Bootstrap -->
    <link href="/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="/node_modules/jquery/dist/jquery.js"></script>
    <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- custom js -->
    <script src="/js/join.js"></script>

    <!-- custom css -->
    <style>
        .container{
            max-width: 40%;
            padding-top: 7%;
        }
        .align_center{
            text-align: center;
        }
        .margin_cus{
            margin: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- header -->
    <header class="align_center">
        <h1>Jeon's Board</h1>
        <div class="row">
            <p></p>
            <div class="col-md-12 custom-align">
                <small>
                    <a href="/">로그인</a> | <a href="join">초기화</a>
                </small>
            </div>
        </div>
    </header>
    <!-- Modal -->
    <div class="modal fade" id="alertModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">경고</h5>
                </div>
                <div class="modal-body">
                    <p class="modal-contents"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <hr/>

    <!-- content -->
    <div class="custom-align-content" >
        <form class="form-horizontal" method="post" accept-charset="UTF-8" id="joinForm">
            <div class="form-group" id="divId">
                <label for="userId" class="col-lg-1 control-label">아이디</label>
                <button class="margin_cus btn btn-primary" type="button" id="userIdCheck" name="userIdCheck">중복확인</button>
                <div class="col-lg-12">
                    <input type="text" class="form-control onlyAlphabetAndNumber" id="userId" name="member_id" data-rule-required="true" placeholder="30자이내의 알파벳, 숫자만 입력 가능합니다." maxlength="30">
                </div>
            </div>

            <div class="form-group" id="divPassword">
                <label for="userPw" class="col-lg-2 control-label">비밀번호</label>
                <div class="col-lg-12">
                    <input type="password" class="form-control" id="userPw" name="member_pw" data-rule-required="true" placeholder="비밀번호" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divPasswordCheck">
                <label for="userPwCheck" class="col-lg-2 control-label">비밀번호 확인</label>
                <div class="col-lg-12">
                    <input type="password" class="form-control" id="userPwCheck" data-rule-required="true" placeholder="비밀번호 확인" maxlength="30">
                </div>
            </div>

            <div class="form-group" id="divMail">
                <label for="userMail" class="col-lg-2 control-label">이메일</label>
                <div class="col-lg-12">
                    <input type="email" class="form-control" id="userMail" name="member_email" data-rule-required="true" placeholder="이메일" maxlength="40">
                </div>
            </div>

            <div class="form-group">
                <label for="userGender" class="col-lg-2 control-label">성별</label>
                <div class="col-lg-12">
                    <select class="form-control" id="userGender" name="member_gender">
                        <option value="남">남</option>
                        <option value="여">여</option>
                    </select>
                </div>
            </div>

            <div class="align_center margin_cus">
                <button type="submit" class="btn btn-primary">제출</button>
            </div>
        </form>
    </div>

    <hr/>
    <!-- footer -->
    <footer>
        <div>
            <p class="text-center">
                <small>Copyrightⓒ JHI97 All rights reserved.</small>
            </p>
        </div>
    </footer>
</div>
</body>
</html>
