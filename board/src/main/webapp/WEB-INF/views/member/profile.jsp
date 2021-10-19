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
                            <img src="https://github.com/mdo.png" id="member_img" class="rounded-circle" width="150" height="150">
                            <div class="mt-3">
                                <h4>${memberId}</h4>
                                <div>
                                    <p class="text-secondary mb-1" id="introduce">목표, 자기소개, 의지 등을 적어주세요</p>
                                </div>
                                <button class="btn btn-primary" id="edit_Img" onclick="edit_img()">이미지 변경</button>
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
                <button type="button" class="btn btn-primary" id="imgFormSubmit" data-bs-dismiss="modal">확인</button>
            </div>
        </div>
    </div>

</div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        let form = $('#imageUploadForm')[0];
        let data = new FormData(form);

        $('#edit').click(function(){
            let mail = $('#member_email').html();
            let insBtn = '<button class="btn btn-outline-primary" id="edit_complete">수정 완료</button>';

            //수정 input 삽입
            $('#introduce').contents().unwrap().wrap('<input type="text" class="form-control" id="introduce" placeholder="목표, 자기소개, 의지 등">');
            $('#member_email').contents().unwrap().wrap('<input type="email" class="form-control" id="member_email" value="">');
            $('#member_email').attr("value", mail);

            //버튼 동적 삽입 및 삭제
            $('#edit').before(insBtn);
            $('#edit').remove();
        });

        $(document).on("click", "#edit_Img", function(){
            let modal = $('#alertModal');
            modal.modal('show');
        })

        $('#imgFormSubmit').click(function (){
            form = $('#imageUploadForm')[0];
            data = new FormData(form);

            $.ajax({
                type:'post',
                enctype: 'multipart/form-data',
                url: '/member/profile/alterImg',
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function(data){
                    window.location.replace(data);
                },
                error: function(e){
                    alert('ERROR! ' + e.responseText);
                }
            });
        });

        $("#img_file").change(function(){
            if(this.files && this.files[0]) {
                var reader = new FileReader;
                reader.onload = function(data) {
                    $("#member_img").attr("src", data.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

        //동적 생성 된 수정완료 버튼 클릭 이벤트
        $(document).on("click","#edit_complete", function (){
            //이메일 검증
            let emailVal = $('#member_email').val();
            let regExp = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
            if (emailVal.match(regExp) == null) {
                alert('이메일을 정확히 입력해주세요.');
                return false;
            }
            let profileData = {'email' : emailVal, 'introduce' : $('#introduce').val()}
            console.log(profileData);
            $.ajax({
                    url : "/member/profile/edit",
                    type : "POST",
                    data : JSON.stringify(profileData),
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


<!--
$.ajax({
type:'post',
enctype: 'multipart/form-data',
url: '/member/profile/imgUpload',
data: data,
processData: false,
contentType: false,
cache: false,
timeout: 600000,
success: function(data){
$('#result').text(data);
console.log('success : ', data);
},
error: function(e){
$('#result').text(e.responseText);
console.log('ERROR : ', e);
}
});
-->