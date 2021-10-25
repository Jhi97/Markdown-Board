package com.jeon.board.controller;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Profile;
import com.jeon.board.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

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
    public String postLogin(Member member, HttpSession session, RedirectAttributes rttr){
        log.info("post login");
        int memberNum = memberService.login(member);
        Map<String, Object> memberInfo = memberService.getMember(memberNum);
        Profile profile = (Profile) memberInfo.get("profile");

        // 미가입 회원 체크
        if (memberNum > 0) {
            log.info("login Success");
            session.setAttribute("memberId", member.getMember_id());
            session.setAttribute("memberNum", memberNum);
            session.setAttribute("profile", profile);
            return "redirect:/board/main?num=1";
        } else {
            log.info("login Fail");
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
            return "redirect:/";
        }
    }

    @GetMapping("/logout")
    public String getLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
