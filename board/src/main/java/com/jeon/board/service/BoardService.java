package com.jeon.board.service;

import com.jeon.board.dto.Post;

import java.util.Map;


public interface BoardService {
    //글 목록
    Map<String, Object> getMain(String memberId);

    //글쓰기
    void postWrite(Post post, String memberId);

    //글 상세보기
    Post getView(int num, String memberId) throws IllegalAccessException;
}
