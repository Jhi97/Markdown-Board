package com.jeon.board.controller;

import com.jeon.board.dto.Post;
import com.jeon.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private BoardService boardService;

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
    public String postWrite(Post post, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String memberId = String.valueOf(session.getAttribute("member"));
        boardService.postWrite(post, memberId);
        return "/board/main";
    }
}
