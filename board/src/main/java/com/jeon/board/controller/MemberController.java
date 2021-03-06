package com.jeon.board.controller;

import com.jeon.board.error.CustomAuthException;
import com.jeon.board.dto.Member;
import com.jeon.board.dto.Profile;
import com.jeon.board.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    public static int getMemberNum(HttpSession session) throws CustomAuthException{
        int memberNum;
        try {
            memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
        } catch (Exception e) {
            throw new CustomAuthException("로그인이 필요한 서비스입니다.");
        }
        return memberNum;
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
    public String getProfile(HttpSession session, Model model) throws CustomAuthException {
        int memberNum = getMemberNum(session);
        Map<String, Object> map = memberService.getMember(memberNum);
        Member member = (Member) map.get("member");
        Profile profile = (Profile) map.get("profile");
        int allCount = Integer.parseInt(map.get("allCount").toString());

        model.addAttribute("member", member);
        model.addAttribute("allCount", allCount);
        session.setAttribute("profile", profile);
        return "/member/profile";
    }

    @PostMapping("/profile/edit")
    @ResponseBody
    public String editProfile(@RequestBody Map<String,Object> json,
                              HttpSession session) throws CustomAuthException {
        String email = json.get("email").toString();
        String introduce = json.get("introduce").toString();
        int memberNum = getMemberNum(session);
        memberService.editProfile(memberNum, introduce, email);
        return "/member/profile";
    }

    @PostMapping("/profile/alterImg")
    @ResponseBody
    public ResponseEntity<?> alterImage(@RequestParam("file") MultipartFile uploadImg, HttpSession session) throws CustomAuthException {
        log.info("run upload");
        // 회원 번호 및 프로필 조회
        int memberNum = getMemberNum(session);
        Profile profile =(Profile) session.getAttribute("profile");
        String beforeImg = profile.getMember_img();

        if (uploadImg.isEmpty()) {
            return new ResponseEntity<>("/member/profile", HttpStatus.OK);
        }
        log.info(uploadImg.getOriginalFilename());

        try {
            memberService.uploadImg(uploadImg, memberNum, beforeImg);

        }catch (IOException e){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity("/member/profile", new HttpHeaders(), HttpStatus.OK);
    }

    @GetMapping("/logout")
    public String getLogout(HttpSession session) {
        log.info(session.getAttribute("memberId").toString()+" logout");
        session.invalidate();

        return "redirect:/";
    }

}
