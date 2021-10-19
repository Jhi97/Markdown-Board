package com.jeon.board.service;

import com.jeon.board.dto.Member;
import com.jeon.board.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
    private static String UPLOADED_FOLDER = "";
    private final MemberMapper memberMapper;

    //회원 가입
    @Override
    public void join(Member member) {
        memberMapper.join(member);
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
