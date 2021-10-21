package com.jeon.board.service;

import com.jeon.board.dto.Post;

import java.util.List;
import java.util.Map;


public interface BoardService {
//    //글 목록 + 페이징
//    Map<String, Object> getMain(int displayPost, int postNum, int memberNum);

    // 페이징 + 검색
    Map<String, Object> getSearch(int displayPost, int postNum, String keyword, int memberNum);

    //전체 게시물 갯수
    int getCount(int memberNum);

    //카테고리 목록 불러오기
    String[] getCategory(int memberNum);

    //글쓰기
    void postWrite(Post post, int memberNum);

    //글 상세보기
    Post getView(int num, int memberNum) throws IllegalAccessException;
}
