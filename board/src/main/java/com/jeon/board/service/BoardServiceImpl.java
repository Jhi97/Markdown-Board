package com.jeon.board.service;

import com.jeon.board.dto.Post;
import com.jeon.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


@Service
@Slf4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardMapper boardMapper;

    @Override
    public void getMain(String memberId) {
        log.info("run BoardSerive getMain");

    }

    @Override
    public void postWrite(Post post, String memberId) {
        log.info("run BoardService postWrite");
        boardMapper.postWrite(post, memberId);
    }
}
