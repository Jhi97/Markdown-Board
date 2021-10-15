package com.jeon.board.service;

import com.jeon.board.dto.Post;


public interface BoardService {
    void getMain(String memberId);
    void postWrite(Post post, String memberId);
}
