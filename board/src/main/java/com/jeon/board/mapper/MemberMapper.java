package com.jeon.board.mapper;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Profile;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    //회원가입 아이디 중복 체크
    int idCheck(@Param("member_id") String member_id);

    //회원가입
    void join(@Param("member")Member member);

    //회원번호
    int getMemberNum(@Param("member_id") String member_id);

    Member getMember(@Param("memberNum") int memberNum);
    //프로필 생성
    void joinProfile(@Param("memberNum") int memberNum);

    Profile getProfile(@Param("memberNum") int memberNum);

    //로그인
    boolean login(@Param("member")Member member);

    //프로필 수정
    void editProfile(@Param("profile")Profile profile);

    //이메일 수정
    void editEmail(@Param("member") Member member);

}
