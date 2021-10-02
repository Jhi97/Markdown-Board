package com.jeon.board.service;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Post;

import java.util.List;

public interface BoardService {
    void postWrite(Post post, String memberId);
}
