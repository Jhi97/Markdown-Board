const Editor = toastui.Editor;
const editor = new Editor({
    el: document.querySelector('#editor'),
    previewStyle: 'vertical',
    height: '750px',
    initialEditType: 'markdown',
    initialValue: '### 내용을 입력하세요',
    hooks: {
        addImageBlobHook: (blob, callback) => {
            uploadImage(blob);
            callback(imageUrl, blob.name);
        }
    }
});

let imageUrl;
let imageUrlArr = [];
let finalImageUrlArr = new Array();
function uploadImage(blob) {
    console.log('insert image');
    let formData = new FormData();
    formData.append('image', blob); // 이미지를 폼데이터 file로 변경 'image'가 input name이다.
    $.ajax({
        url : '/board/write/image',
        enctype: 'multipart/form-data',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        async: false, // 비동기를 동기로 변경.
        success: function(data){
            imageUrl = data;
            imageUrlArr.push(imageUrl);
            console.log(imageUrlArr);
        },
        error: function(data){
            alert(data);
        }
    });
};



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
            'contents': contents,
            'noUsedImage': finalImage_fn()
        };
        console.log(data);

        // //ajax를 통한 게시글 저장
        $.ajax({
            url : "/board/write",
            type : "POST",
            data : JSON.stringify(data),
            contentType: 'application/json; charset:UTF-8',
            success: function (data){
                //이전 정보를 저장하지 않도록 replace 사용
                window.location.replace(data);
            },
            error: function() {
                alert('error');
            }
        });
    });
    function finalImage_fn(){
        //최종 사용된 이미지 배열 생성
        $('img').each(function(){
            finalImageUrlArr.push($(this).attr('src'));
        });
        console.log(finalImageUrlArr);

        //삭제예정 이미지 배열(삽입되어 서버에 저장된 이미지 배열과 최종 사용된 이미지 배열 중복값 제거)
        let deleteImages = imageUrlArr.filter(x => !finalImageUrlArr.includes(x));
        //아이콘 이미지 제거
        console.log(deleteImages);
        return deleteImages
    }
});