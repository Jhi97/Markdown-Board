
const viewer = new toastui.Editor({
    el: document.querySelector('#viewer'),
    initialValue: contents
});
$(document).ready(function(){
    //게시글 번호
    let num = post_num;
    $('.locationBtn').click(function () {
        let val = $(this).attr("id");
        //뒤로가기
        if (val == 'back') {
            back_fn();
            //홈으로
        } else if(val == 'main'){
            window.location.href = '/board/'+val;
            //삭제
        } else if(val == 'delete'){
            let modal = $('#alertModal');
            modal.modal('show');
            $('#warningConfirm').click(function(){
                $.ajax({
                    url: "/board/view/"+ post_num,
                    type: "delete",
                    success(data) {
                        window.location.replace(data);
                    },error(data){
                        alert('알수없는 오류');
                    }
                });
            });
            //수정
        } else{
            window.location.href = '/board/'+val+'?num='+num;
        }
        function back_fn(){
            window.history.back();
        }
    });
});