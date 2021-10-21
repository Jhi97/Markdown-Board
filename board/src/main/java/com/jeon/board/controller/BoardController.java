package com.jeon.board.controller;

import com.jeon.board.dto.Page;
import com.jeon.board.dto.Post;
import com.jeon.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

//    //메인화면
//    @GetMapping("/main")
//    public String getMain(Model model, HttpSession session) {
//        int memberNum = MemberController.getMemberNum(session);
//        Map<String, Object> result = boardService.getMain(memberNum);
//        List<Post> postList = (List<Post>) result.get("post");
//        List<String> categoryList = (List<String>) result.get("category");
//        int allCount = Integer.parseInt(result.get("allCount").toString());
//
//        //작성글 유무 확인
//        int cnt = postList.size();
//        log.info("cnt : "+ cnt);
//        //request 객체에 저장
//        model.addAttribute("post", postList);
//        model.addAttribute("category", categoryList);
//        model.addAttribute("cnt", cnt);
//        model.addAttribute("allCount", allCount);
//        return "/board/main";
//    }

    //메인화면 + 페이징 추가
    @GetMapping("/main")
    public String getListPage(@RequestParam int num, Model model, HttpSession session) {
        int memberNum = MemberController.getMemberNum(session);
        int allCount = boardService.getCount(memberNum);

        Page page = new Page(num, allCount);

        Map<String, Object> mainMap = boardService.getMain(page.getDisplayPost(), page.getPostNum(), memberNum);
        List<Post> postList = (List<Post>) mainMap.get("post");
        List<String> categoryList = (List<String>) mainMap.get("category");

        model.addAttribute("post", postList);
        model.addAttribute("category", categoryList);
        model.addAttribute("allCount", allCount);
        model.addAttribute("page", page);
        return "/board/main";
    }

    //글쓰기
    @GetMapping("/write")
    public String getWrite(Model model, HttpSession session) {
        int memberNum = MemberController.getMemberNum(session);
        String[] category = boardService.getCategory(memberNum);
        model.addAttribute("cate//gories", category);
        return "/board/write";
    }

    //작성완료
    @PostMapping("/write")
    @ResponseBody
    public String postWrite(@RequestBody Post post, HttpSession session) {
        int memberNum = MemberController.getMemberNum(session);
        log.info("member: " + memberNum);
        log.info("post: " + post.toString());
        boardService.postWrite(post, memberNum);
        return "/board/main";
    }

    //글 상세보기
    @GetMapping("/view")
    public String getView(@RequestParam("num") int num,
                          Model model,
                          HttpSession session,
                          HttpServletResponse response) throws IOException {
        int memberNum = MemberController.getMemberNum(session);
        try {
            Post post = boardService.getView(num, memberNum);
            model.addAttribute("post", post);
        //다른 아이디로 접근 시 에러
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
