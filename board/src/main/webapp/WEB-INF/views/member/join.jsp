<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- custom js -->
    <script type="text/javascript" src="/resources/js/register.js"/></script>
    <!-- custom css -->
    <link href="/resources/css/register.css" rel="stylesheet" type="text/css">
    <style>
        .container{
            max-width: 50%;
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
<div class="container"><!-- 좌우측 공간 확보 -->
    <!-- header -->
    <header class="align_center">
        <h1>Jeon's Board</h1>
        <div class="row">
            <p></p>
            <div class="col-md-12 custom-align">
                <small>
                    <a href="/">로그인</a> | <a href="/join">초기화</a>
                </small>
            </div>
        </div>
    </header>
    <!-- modal -->
    <div class="modal fade" id="defaultModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">알림</h4>
                </div>
                <div class="modal-body">
                    <p class="modal-contents"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <hr/>

    <!-- content -->
    <div class="custom-align-content" >
        <form class="form-horizontal" role="form" method="post" accept-charset="UTF-8" id="regForm">
            <div class="form-group" id="divId">
                <label for="userId" class="col-lg-1 control-label">아이디</label>
                <button class="margin_cus btn btn-primary" type="button" id="idCheck" name="idCheck" onclick="fn_idCheck();" value="N">중복확인</button>
                <div class="col-lg-12">
                    <input type="text" class="form-control onlyAlphabetAndNumber" id="userId" name="userId" data-rule-required="true" placeholder="30자이내의 알파벳, 숫자만 입력 가능합니다." maxlength="30">
                </div>
            </div>

            <div class="form-group" id="divPassword">
                <label for="userPw" class="col-lg-2 control-label">비밀번호</label>
                <div class="col-lg-12">
                    <input type="password" class="form-control" id="userPw" name="userPw" data-rule-required="true" placeholder="비밀번호" maxlength="30">
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
                    <input type="email" class="form-control" id="userMail" name="userMail" data-rule-required="true" placeholder="이메일" maxlength="40">
                </div>
            </div>

            <div class="form-group">
                <label for="userGender" class="col-lg-2 control-label">성별</label>
                <div class="col-lg-12">
                    <select class="form-control" id="userGender" name="userGender">
                        <option value="M">남</option>
                        <option value="F">여</option>
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
