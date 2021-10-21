package com.jeon.board.mapper;

import com.jeon.board.dto.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Mapper
public interface BoardMapper {
    // 게시글 목록
    List<Post> getMain(@Param("memberNum") int memberNum);
    // 게시글 목록 + 페이징
    List<Post> getListPage(@Param("listPage") Map data);
    // 카테고리 목록
    List<HashMap<String, Object>> getCategory(@Param("memberNum") int memberNum);
    // 전체 게시글 수
    int getCount(@Param("memberNum")int memberNum);
    // 글쓰기
    void postWrite(@Param("post")Post post, @Param("memberNum") int memberNum);
    //글 상세보기
    Post getView(@Param("post_num")int num);
}
