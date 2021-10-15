package com.jeon.board.service;

import com.jeon.board.dto.Post;

import java.util.Map;


public interface BoardService {
    Map<String, Object> getMain(String memberId);
    void postWrite(Post post, String memberId);
}
