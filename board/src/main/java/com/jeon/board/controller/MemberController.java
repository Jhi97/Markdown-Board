package com.jeon.board.controller;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Profile;
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

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

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

    @PostMapping("/join/idCheck")
    @ResponseBody
    public int idCheck(Member m){
        log.info("idCheck");
        return memberService.idCheck(m.getMember_id());
    }

    @GetMapping("/profile")
    public String getProfile(HttpServletRequest request, HttpSession session) {
        session = request.getSession();
        String memberId = String.valueOf(session.getAttribute("memberId"));


        return "/member/profile";
    }

    @PostMapping("/profile/edit")
    @ResponseBody
    public ResponseEntity<?> profileEdit(@RequestParam("file") MultipartFile uploadImg) {
        log.info("run upload");
        if (uploadImg.isEmpty()) {
            return new ResponseEntity<>("파일을 선택하세요.", HttpStatus.BAD_REQUEST);
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
