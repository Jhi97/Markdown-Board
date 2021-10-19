package com.jeon.board.controller;

import com.jeon.board.dto.Member;
import com.jeon.board.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    private final MemberService memberService;

    //서버 접속 시 로그인 화면으로 이동
    @GetMapping("/")
    public String getLogin(){
        log.info("hello");
        return "/member/index";
    }

    //로그인 요청
    @PostMapping("/")
    public String postLogin(Member member, HttpServletRequest request, RedirectAttributes rttr){
        log.info("post login");
        HttpSession session = request.getSession();
        int member_num = memberService.login(member);

        if (member_num > 0) {
            log.info("login Success");
            session.setAttribute("memberId", member.getMember_id());
            session.setAttribute("memberNum", member_num);
            return "redirect:/board/main";
        } else{
            log.info("login Fail");
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
            return "redirect:/";
        }
    }
}
