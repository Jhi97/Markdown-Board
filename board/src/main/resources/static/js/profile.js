$(document).ready(function(){
    let form = $('#imageUploadForm')[0];
    let data = new FormData(form);

    $('#edit').click(function(){
        let mail = $('#member_email').html();
        let insBtn = '<button class="btn btn-outline-primary" id="edit_complete">수정 완료</button>';

        //수정 input 삽입
        $('#introduce').contents().unwrap()
            .wrap(insIpt);
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
            let reader = new FileReader;
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