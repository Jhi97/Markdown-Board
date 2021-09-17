package com.jeon.board.mapper;

import com.jeon.board.dto.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    //회원가입
    void join(@Param("member")Member member);

    //회원가입 아이디 중복 체크
    int idCheck(@Param("member_id") String member_id);

    //로그인
    int login(@Param("member")Member member);


}
