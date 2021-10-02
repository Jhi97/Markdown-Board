package com.jeon.board.service;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Post;
import com.jeon.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardMapper boardMapper;

    @Override
    public void postWrite(Post post, String memberId) {
        boardMapper.postWrite(post, memberId);
    }
}
