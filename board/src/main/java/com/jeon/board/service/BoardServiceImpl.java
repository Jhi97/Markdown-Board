package com.jeon.board.service;

import com.jeon.board.dto.Post;
import com.jeon.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Service
@Slf4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardMapper boardMapper;

    @Override
    public Map<String, Object> getMain(int memberNum) {
        log.info("run BoardService getMain");
        Map<String, Object> map = new HashMap<>();
        map.put("post", boardMapper.getMain(memberNum));
        map.put("category", boardMapper.getCategory(memberNum));
        map.put("allCount", boardMapper.getCount(memberNum));
        return map;
    }

    @Override
    public void postWrite(Post post, int memberNum) {
        log.info("memberNum: " + memberNum);
        boardMapper.postWrite(post, memberNum);
    }

    @Override
    public Post getView(int num, int memberNum) throws IllegalAccessException {
        Post post = boardMapper.getView(num);
        if (!(post.getMember_num()==memberNum)) {
            IllegalAccessException userError = new IllegalAccessException();
            throw userError;
        }else{
            // javascript 변수 선언을 위한 개행 처리
            post.setContents(post.getContents().replace("\n", "<br>"));
            return post;
        }
    }
}
