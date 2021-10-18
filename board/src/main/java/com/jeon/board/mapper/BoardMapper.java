package com.jeon.board.mapper;

import com.jeon.board.dto.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;


@Mapper
public interface BoardMapper {
    // 게시글 목록
    List<Post> getMain(@Param("member_id") String memberId);
    // 카테고리 목록
    List<HashMap<String, Object>> getCategory();
    // 글쓰기
    void postWrite(@Param("post")Post post, @Param("member_id") String memberId);
    //글 상세보기
    Post getView(@Param("num")int num);
}
