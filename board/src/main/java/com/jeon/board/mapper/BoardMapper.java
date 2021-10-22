package com.jeon.board.mapper;

import com.jeon.board.dto.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Mapper
public interface BoardMapper {
    // 게시글 목록 + 페이징
    List<Post> getListPage(@Param("data") Map data);
    // 페이징 + 검색
    List<Post> getSearch(@Param("data") Map data);
    // 카테고리 목록
    List<HashMap<String, Object>> getCategory(@Param("memberNum") int memberNum);
    // 전체 게시글 수
    int getCount(@Param("memberNum")int memberNum);
    // 검색에 의한 게시글 수
    int getCountSearch(@Param("data") Map data);
    // 글쓰기
    void postWrite(@Param("post")Post post, @Param("memberNum") int memberNum);
    //글 상세보기
    Post getView(@Param("post_num")int num);
    //글 수정
    void putModify(@Param("post") Post post, @Param("memberNum") int memberNum);
}
