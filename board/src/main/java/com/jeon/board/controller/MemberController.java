package com.jeon.board.controller;

import com.jeon.board.dto.Member;
import com.jeon.board.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    public static int getMemberNum(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return Integer.parseInt(session.getAttribute("memberNum").toString());
    }

    //회원가입
    @GetMapping("/join")
    public String getJoin(){
        log.info("Get Join");
        return "member/join";
    }

    @PostMapping("/join")
    public String postJoin(Member member){
        log.info("Post join");
        memberService.join(member);
        return "redirect:/";
    }
    //회원 아이디 체크
    @PostMapping("/join/idCheck")
    @ResponseBody
    public int idCheck(Member m){
        log.info("idCheck");
        return memberService.idCheck(m.getMember_id());
    }
    //프로필 페이지
    @GetMapping("/profile")
    public String getProfile(HttpServletRequest request) {
        int memberNum = getMemberNum(request);
        Map<String, Object> map = memberService.getMember(memberNum);
        Member member = (Member) map.get("member");
        int allCount = Integer.parseInt(map.get("allCount").toString());
        request.setAttribute("member", member);
        request.setAttribute("allCount", allCount);
        return "/member/profile";
    }

    @PostMapping("/profile/edit")
    @ResponseBody
    public String editProfile(@RequestBody String email,
                              @RequestBody String introduce,
                              HttpServletRequest request) {
        log.info("email: " + email + "introduce: "+ introduce);
        int memberNum = getMemberNum(request);
        memberService.editProfile(memberNum, introduce, email);
        return "/member/profile";
    }

    @PostMapping("/profile/alterImg")
    @ResponseBody
    public ResponseEntity<?> alterImage(@RequestParam("file") MultipartFile uploadImg) {
        log.info("run upload");
        if (uploadImg.isEmpty()) {
            return new ResponseEntity<>("/member/profile", HttpStatus.OK);
        }
        log.info(uploadImg.getName());
        log.info(uploadImg.getOriginalFilename());

        try {
            memberService.uploadImg(Arrays.asList(uploadImg));

        }catch (IOException e){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity("/member/profile", new HttpHeaders(), HttpStatus.OK);
    }


}
