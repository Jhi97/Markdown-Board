package com.jeon.board.mapper;

import com.jeon.board.dto.Member;
import com.jeon.board.dto.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {
    void postWrite(@Param("post")Post post, @Param("memberId") String memberId);
}
