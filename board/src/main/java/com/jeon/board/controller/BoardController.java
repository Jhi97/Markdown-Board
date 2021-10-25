package com.jeon.board.controller;

import com.jeon.board.CustomAuthException;
import com.jeon.board.dto.Page;
import com.jeon.board.dto.Post;
import com.jeon.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @GetMapping("/main")
    public String getSearch(@RequestParam(defaultValue = "1") int num,
                            @RequestParam(defaultValue = "") String keyword,
                            @RequestParam(defaultValue = "") String category,
                            Model model, HttpSession session) throws CustomAuthException {
        int memberNum = MemberController.getMemberNum(session);
        int allCount = boardService.getCount(memberNum);

        Page page = new Page(num, allCount);
        Map<String, Object> mainMap = boardService.getMain(page.getDisplayPost(), page.getPostNum(), keyword, category, memberNum);
        //검색 입력시 페이징 조정
        if (!keyword.isEmpty() || !category.isEmpty()) {
            int searchCount = Integer.parseInt(mainMap.get("searchCount").toString());
            page.setCount(searchCount);
        }

        List<Post> postList = (List<Post>) mainMap.get("post");
        List<Map> categoryList = (List<Map>) mainMap.get("category");
        model.addAttribute("post", postList);
        model.addAttribute("categories", categoryList);
        //검색어 존재 시 카테고리 총 게시글 수정
        if (keyword.isEmpty()) {
            model.addAttribute("allCount", allCount);
        } else {
            int categoryCnt = 0;
            for (int i = 0; i < categoryList.size(); i++) {
                categoryCnt += Integer.parseInt(categoryList.get(i).get("cnt").toString());
            }
            model.addAttribute("allCount", categoryCnt);
        }
        model.addAttribute("page", page);
        model.addAttribute("keyword", keyword);
        model.addAttribute("categoryParam", category);

        return "/board/main";
    }

    //글쓰기
    @GetMapping("/write")
    public String getWrite(Model model, HttpSession session) {
        int memberNum = 0;
        try{
            memberNum = MemberController.getMemberNum(session);
        }catch (Exception e){
            model.addAttribute("msg", false);
            return "/board/write";
        }
        String[] category = boardService.getCategory(memberNum);
        model.addAttribute("categories", category);
        return "/board/write";
    }

    //작성완료
    @PostMapping("/write")
    @ResponseBody
    public String postWrite(@RequestBody Map jsonData,
                            HttpSession session) throws Exception {
        int memberNum = MemberController.getMemberNum(session);
        Post post = setPost(jsonData);
        log.info("member: " + memberNum);
        List noUsedImages = (List) jsonData.get("noUsedImage");
        boardService.postWrite(post, noUsedImages, memberNum);
        return "/board/main";
    }

    public Post setPost(Map<String, String> map) {
        Post post = new Post();
        post.setTitle(map.get("title"));
        post.setCategory(map.get("category"));
        post.setContents(map.get("contents"));
        return post;
    }

    //글 상세보기
    @GetMapping("/view")
    public String getView(@RequestParam int num,
                          Model model,
                          HttpSession session,
                          HttpServletResponse response) throws IOException, CustomAuthException {
        int memberNum = MemberController.getMemberNum(session);
        setBoardView(num, model, memberNum, response);
        return "/board/view";
    }

    //카테고리
    @GetMapping("/category")
    @ResponseBody
    public String categoryList(@RequestParam("category") String category) {
        log.info(category);
        return "/board/main";
    }

    // 게시글 수정화면
    @GetMapping("/modify")
    public String getModify(@RequestParam int num,
                            Model model,
                            HttpSession session,
                            HttpServletResponse response) throws IOException, CustomAuthException {
        int memberNum = MemberController.getMemberNum(session);
        setBoardView(num, model, memberNum, response);
        String[] category = boardService.getCategory(memberNum);
        model.addAttribute("categories", category);
        return "/board/modify";
    }

    // 사용자 검증 및 게시글 상세정보
    public void setBoardView(int num, Model model, int memberNum, HttpServletResponse response) throws IOException {
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
    }

    //수정완료
    @PutMapping("/view/{postNum}")
    @ResponseBody
    public String putModify(@PathVariable int postNum,
                            @RequestBody Map jsonData, HttpSession session) throws Exception {
        int memberNum = MemberController.getMemberNum(session);
        Post post = setPost(jsonData);
        post.setPost_num(postNum);
        log.info(post.toString());
        List noUsedImages = (List) jsonData.get("noUsedImage");
        log.info("noUsedImaged: " + noUsedImages);
        try {
            boardService.putModify(post, noUsedImages, memberNum);
            //게시글 번호 또는 아이디 검증
        } catch (IllegalAccessException e) {
            return "수정 중 에러가 발생했습니다.";
        }
        return "/board/view?num=" + postNum;
    }

    //게시글 삭제
    @DeleteMapping("/view/{postNum}")
    @ResponseBody
    public String postDelete(@PathVariable int postNum, HttpSession session, HttpServletResponse response) throws Exception {
        int memberNum = MemberController.getMemberNum(session);
        try {
            boardService.delete(postNum, memberNum);
        } catch (Exception e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');window.location.replace('/board/main');</script>");
            out.flush();
        }
        return "/board/main";
    }

    @PostMapping("/write/image")
    @ResponseBody
    public String postImage(@RequestParam("image") MultipartFile uploadImg, HttpSession session) throws IOException, CustomAuthException {
        int memberNum = MemberController.getMemberNum(session);
        String imageUrl = "../../../resources/upload/post/"+memberNum+ "/" + boardService.postImage(uploadImg, memberNum);
        log.info(imageUrl);
        return imageUrl;
    }
}