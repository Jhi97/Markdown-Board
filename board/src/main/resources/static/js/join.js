$(function (){
    document.getElementById("userIdCheck").onclick= function () {idCheck_fn()};
    //모달 컨텐츠
    let modalContents = $(".modal-contents");
    //모달 On/Off
    let modal = $("#alertModal");
    //아이디 중복검사 여부
    let idCheckVal = false;

    //검증 필요 변수 선언
    let formId = $('#userId');
    let formPw = $('#userPw');
    let formPwChk = $('#userPwCheck');
    let formMail = $('#userMail');

    <!-- input validation -->
    $('.onlyAlphabetAndNumber').keyup(function(event) {
        if(!(event.keyCode >37 && event.keyCode<=40)){
            let inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^_a-z0-9]/gi,''));
        }
    });

    <!-- id duplication Check -->
    function idCheck_fn() {
        if (formId.val() == '') {
            modalContents.text("아이디를 입력해 주세요!");
            modal.modal('show');
            return false;
        } else {
            $.ajax({
                url : "/member/join/idCheck",
                type : "POST",
                data : formId,
                success : function (data) {
                    if (data == 1) {
                        modalContents.text("중복된 아이디 입니다!");
                        modal.modal('show');
                        return false;
                    }else if (data == 0) {
                        modalContents.text("사용 가능한 아이디 입니다!");
                        modal.modal('show');
                        idCheckVal = true;
                    }else{
                        modalContents.text("알 수 없는 오류");
                        modal.modal('show');
                        return false;
                    }
                }

            })
        }
    }

    <!-- null validation -->
    $('#joinForm').submit(function (event) {

        //Id Null Check
        if(formId.val()==""){
            modalContents.text("아이디를 입력해 주세요!");
            modal.modal('show');
            $('#userId').focus();
            return false;
        }

        //Id Duplication Check
        if (idCheckVal == false) {
            modalContents.text("아이디 중복검사를 해주세요!");
            modal.modal('show');
            return false;
        }

        //Pw Null Check
        if (formPw.val() == "") {
            modalContents.text("비밀번호를 입력해 주세요!");
            modal.modal('show');
            $('#userPw').focus();
            return false;
        }

        //PwCheck Null Check
        if (formPwChk.val() == "") {
            modalContents.text("비밀번호 확인을 입력해 주세요!");
            modal.modal('show');
            $('#userPwCheck').focus();
            return false;
        }

        //Pw Checking
        if (formPw.val() != formPwChk.val()) {
            modalContents.text("비밀번호가 일치하지 않습니다!");
            modal.modal('show');
            $('#userPwCheck').focus();
            return false;
        }

        //Mail Null Check
        if (formMail.val() == "") {
            modalContents.text("메일을 입력해 주세요!");
            modal.modal('show');
            $('#userMail').focus();
            return false;
        }
    });

})