package com.jeon.board.service;

import com.jeon.board.dto.Member;
import com.jeon.board.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

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
}
