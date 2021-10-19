package com.jeon.board.service;

import com.jeon.board.dto.Member;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface MemberService {

    //회원 가입
    void join(Member member);

    //아이디 중복 체크
    int idCheck(String member_id);

    //로그인
    int login(Member member);

    //이미지 업로드
    void uploadImg(List<MultipartFile> files) throws IOException;

    //회원 정보 가져오기
}
