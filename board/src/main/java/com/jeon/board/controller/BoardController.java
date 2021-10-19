package com.jeon.board.controller;

import com.jeon.board.dto.Post;
import com.jeon.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    //메인화면
    @GetMapping("/main")
    public String getMain(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
        Map<String, Object> result = boardService.getMain(memberNum);
        List<Post> postList = (List<Post>) result.get("post");
        List<String> categoryList = (List<String>) result.get("category");

        //작성글 유무 확인
        int cnt = postList.size();
        log.info("cnt : "+ cnt);
        //request 객체에 저장
        request.setAttribute("post", postList);
        request.setAttribute("category", categoryList);
        request.setAttribute("cnt", cnt);
        return "/board/main";
    }

    //글쓰기
    @GetMapping("/write")
    public String getWrite() {
        return "/board/write";
    }

    //작성완료
    @PostMapping("/write")
    @ResponseBody
    public String postWrite(@RequestBody Post post, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
        log.info("member: " + memberNum);
        log.info("post: " + post.toString());
        boardService.postWrite(post, memberNum);
        return "/board/main";
    }

    //글 상세보기
    @GetMapping("/view")
    public String getView(@RequestParam("num") int num,
                          HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
        try {
            Post post = boardService.getView(num, memberNum);
            request.setAttribute("post", post);
        } catch (IllegalAccessException e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');location.href='/board/main';</script>");
            out.flush();
        }
        return "/board/view";
    }

    //카테고리
    @GetMapping("/category")
    @ResponseBody
    public String categoryList(@RequestParam("category") String category) {
        log.info(category);
        return "/board/main";
    }
}
