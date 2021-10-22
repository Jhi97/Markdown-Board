package com.jeon.board.service;

import com.jeon.board.dto.Post;
import com.jeon.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Slf4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardMapper boardMapper;

//    @Override
//    public Map<String, Object> getMain(int displayPost, int postNum, int memberNum) {
//        Map<String, Object> map = new HashMap<>();
//        Map mainDate = mainInfoToData(displayPost, postNum, memberNum);
//        log.info(mainDate.toString());
//        map.put("post", boardMapper.getListPage(mainDate));
//        map.put("category", boardMapper.getCategory(memberNum));
//        map.put("allCount", boardMapper.getCount(memberNum));
//        return map;
//    }

    @Override
    public Map<String, Object> getMain(int displayPost, int postNum, String keyword, String categoryParam, int memberNum) {
        Map<String, Object> map = new HashMap<>();
        Map mainDate = mainInfoToDataV2(displayPost, postNum, keyword, categoryParam, memberNum);
        log.info(mainDate.toString());
        map.put("post", boardMapper.getMain(mainDate));
        map.put("category", boardMapper.getCategory(keyword, memberNum));
        map.put("allCount", boardMapper.getCount(memberNum));
        if (!keyword.isEmpty() || !categoryParam.isEmpty()) {
            log.info("CountSearch run");
            map.put("searchCount", boardMapper.getCountSearch(mainDate));
        }
        return map;
    }

    // 계정 게시글 전체 갯수 조회
    @Override
    public int getCount(int memberNum) {
        return boardMapper.getCount(memberNum);
    }
    // Mapper에 전달할 main의 정보 생성
    public Map<String, Object> mainInfoToDataV2(int displayPost, int postNum, String keyword, String categoryParam, int memberNum) {
        Map<String, Object> data = new HashMap<>();
        data.put("displayPost", displayPost);
        data.put("postNum", postNum);
        data.put("keyword", keyword);
        data.put("category", categoryParam);
        data.put("memberNum", memberNum);
        return data;
    }

    @Override
    public String[] getCategory(int memberNum) {
        List<HashMap<String, Object>> categoryData = boardMapper.getCategory(new String(""), memberNum);
        int size = categoryData.size();
        String[] categoryList = new String[size];
        for (int i = 0; i < size; i++) {
            categoryList[i] = categoryData.get(i).get("name").toString();
        }
        return categoryList;
    }

    @Override
    public void postWrite(Post post, int memberNum) {
        log.info("memberNum: " + memberNum);
        boardMapper.postWrite(post, memberNum);
    }

    @Override
    public Post getView(int num, int memberNum) throws IllegalAccessException {
        Post post = boardMapper.getView(num);
        if (!(post.getMember_num()==memberNum)) {
            IllegalAccessException userError = new IllegalAccessException();
            throw userError;
        }else{
            // javascript 변수 선언을 위한 개행 처리
            post.setContents(post.getContents().replace("\n", "<br>"));
            return post;
        }
    }

    @Override
    public void putModify(Post post, int memberNum) throws Exception {
        try {
            boardMapper.putModify(post, memberNum);
        } catch (Exception e) {
            IllegalAccessException modifyError = new IllegalAccessException();
            throw modifyError;
        }
    }

    @Override
    public void delete(int postNum, int memberNum) throws Exception {
        try {
            boardMapper.delete(postNum, memberNum);
        } catch (Exception e) {
            IllegalAccessException deleteError = new IllegalAccessException();
            throw deleteError;
        }
    }
}
