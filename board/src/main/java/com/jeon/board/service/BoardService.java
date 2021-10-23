package com.jeon.board.service;

import com.jeon.board.dto.Post;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;


public interface BoardService {
    // 메인페이지
    Map<String, Object> getMain(int displayPost, int postNum, String keyword, String categoryParam, int memberNum);

    //전체 게시물 갯수
    int getCount(int memberNum);

    //카테고리 목록 불러오기
    String[] getCategory(int memberNum);

    //글쓰기
    void postWrite(Post post, List noUsedImages, int memberNum);

    //이미지 업로드 처리
    String postImage(MultipartFile image, int memberNum) throws IOException;

    //글 상세보기
    Post getView(int num, int memberNum) throws IllegalAccessException;

    //글 수정하기
    void putModify(Post post, int memberNum) throws Exception;

    //글 삭제하기
    void delete(int postNum, int memberNum) throws Exception;
}
