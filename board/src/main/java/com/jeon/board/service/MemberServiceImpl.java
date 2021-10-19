package com.jeon.board.service;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Profile;
import com.jeon.board.mapper.BoardMapper;
import com.jeon.board.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
    private static String UPLOADED_FOLDER = "../webapp/resources/upload";
    private final MemberMapper memberMapper;
    private final BoardMapper boardMapper;

    //회원 가입
    @Override
    public void join(Member member) {
        memberMapper.join(member);
        int memberNum = memberMapper.getMemberNum(member.getMember_id());
        memberMapper.joinProfile(memberNum);
    }

    //아이디 중복 체크
    @Override
    public int idCheck(String member_id) {
        return memberMapper.idCheck(member_id);
    }

    //로그인
    @Override
    public int login(Member member) {
        int login = memberMapper.login(member);
        if(login > 0)
            return login;
        else
            return 0;
    }

    //회원 정보 조회
    @Override
    public Map<String, Object> getMember(int memberNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("member", memberMapper.getMember(memberNum));
        map.put("allCount", boardMapper.getCount(memberNum));
        return map;
    }

    //프로필 수정
    @Override
    public void editProfile(int memberNum, String introduce, String email) {
        Member member = new Member(memberNum, email);
        Profile profile = new Profile(memberNum, introduce, null);

        memberMapper.editEmail(member);
        memberMapper.editProfile(profile);
    }

    //프로필 사진 업로드
    @Override
    public void uploadImg(List<MultipartFile> files) throws IOException {
        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                continue;
            }
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);
        }
    }


}
