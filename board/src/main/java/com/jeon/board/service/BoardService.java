package com.jeon.board.service;

import com.jeon.board.dto.Post;

import java.util.Map;


public interface BoardService {
    //글 목록
    Map<String, Object> getMain(int memberNum);

    //글쓰기
    void postWrite(Post post, int memberNum);

    //글 상세보기
    Post getView(int num, int memberNum) throws IllegalAccessException;
}
