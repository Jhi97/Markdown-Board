package com.jeon.board.controller;

import com.jeon.board.dto.Member;
import com.jeon.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class BoardController {
    private final BoardService boardService;

    @GetMapping("/")
    public String getLogin(){

        return "member/index";
    }

    @GetMapping("/mybatis")
    @ResponseBody
    public List<Member> getMember() {
        log.info("Controller Start");
        return boardService.getMember();
    }
}
