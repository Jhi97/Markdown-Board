package com.jeon.board.service;

import com.jeon.board.dto.Member;

public interface MemberService {

    //회원 가입
    void join(Member member);

    //아이디 중복 체크
    int idCheck(String member_id);
}
