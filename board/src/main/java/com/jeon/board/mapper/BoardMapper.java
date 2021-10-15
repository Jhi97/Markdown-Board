package com.jeon.board.mapper;

import com.jeon.board.dto.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface BoardMapper {
    void postWrite(@Param("post")Post post, @Param("member_id") String member_Id);
}
