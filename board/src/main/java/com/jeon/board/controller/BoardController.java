package com.jeon.board.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

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
}
