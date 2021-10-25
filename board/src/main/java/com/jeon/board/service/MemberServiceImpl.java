package com.jeon.board.service;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Profile;
import com.jeon.board.mapper.BoardMapper;
import com.jeon.board.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
    private static String UPLOADED_FOLDER = "./src/main/webapp/resources/upload/member_Img/";
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
        boolean login = memberMapper.login(member);
        log.info("login: " + login);
        if(login)
            return memberMapper.getMemberNum(member.getMember_id());
        else
            return 0;
    }

    //회원 정보 조회
    @Override
    public Map<String, Object> getMember(int memberNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("member", memberMapper.getMember(memberNum));
        map.put("profile", memberMapper.getProfile(memberNum));
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
    public void uploadImg(MultipartFile image, int memberNum, String beforeImg) throws IOException {
        byte[] bytes = image.getBytes();
        //이미지 랜덤 이름 부여
        String fileName = BoardServiceImpl.setFileName(image.getOriginalFilename());
        Path path = Paths.get(UPLOADED_FOLDER + fileName);
        Profile profile = new Profile(memberNum, null, fileName);
        memberMapper.editProfile(profile);
        beforeImgDelete(beforeImg);
        Files.write(path, bytes);
    }
    public void beforeImgDelete(String beforeImg) {
        File file = new File(UPLOADED_FOLDER + beforeImg);
        if (file.exists()) {
            if (file.delete()) {
                log.info("프로필 이미지 삭제 성공");
            }else{
                log.info("프로필 이미지 삭제 실패");
            }
        }
    }


}
