package com.jeon.board.controller;

import com.jeon.board.dto.Post;
import com.jeon.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    //메인화면
    @GetMapping("/main")
    public String getMain(){
        return "/board/main";
    }

    //글쓰기
    @GetMapping("/write")
    public String getWrite(){
        return "/board/write";
    }

    //작성완료
    @PostMapping("/write")
    @ResponseBody
    public String postWrite(@RequestBody Post post, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String memberId = String.valueOf(session.getAttribute("member"));
        log.info("member: "+ memberId);
        log.info("post: "+ post.toString());
        boardService.postWrite(post, memberId);
        return "/board/main";
    }
}
