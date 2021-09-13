package com.jeon.board.mapper;

import com.jeon.board.dto.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<Member> getMember();
}
